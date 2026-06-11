import { timingSafeEqual } from "node:crypto";
import { supabaseAdmin } from "@/integrations/supabase/client.server";

export const CORS_HEADERS = {
  "Access-Control-Allow-Origin": "*",
  "Access-Control-Allow-Methods": "GET, POST, OPTIONS",
  "Access-Control-Allow-Headers":
    "Content-Type, Authorization, Accept, X-Max-Worker-Secret",
  "Access-Control-Max-Age": "86400",
} as const;

const JSON_HEADERS = {
  "Content-Type": "application/json; charset=utf-8",
  "Cache-Control": "no-store",
  ...CORS_HEADERS,
} as const;

export function json(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

export function preflight(): Response {
  return new Response(null, { status: 204, headers: CORS_HEADERS });
}

const UUID_RE =
  /^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i;

export function isUuid(v: string): boolean {
  return UUID_RE.test(v);
}

/**
 * Shared-secret auth for Max worker POST endpoints.
 * Requires header: X-Max-Worker-Secret: <MAX_WORKER_SECRET env value>
 * Returns a Response (401/503) when denied, or null when authorized.
 */
export function verifyMaxWorkerSecret(request: Request): Response | null {
  const secret = process.env.MAX_WORKER_SECRET;
  if (!secret) {
    return json(
      { error: "MAX_WORKER_SECRET is not configured on the server" },
      503,
    );
  }
  const provided = request.headers.get("x-max-worker-secret") ?? "";
  const a = Buffer.from(provided, "utf8");
  const b = Buffer.from(secret, "utf8");
  if (a.length !== b.length || !timingSafeEqual(a, b)) {
    return json({ error: "Unauthorized Max worker request" }, 401);
  }
  return null;
}

const CONSTELLATION_COLUMNS =
  "id, title, question_text, status, synthesis_params, mood_params, synth_audio_url, synth_audio_path, error_message, created_at, ready_at";

const STAR_COLUMNS =
  "id, constellation_id, audio_url, max_audio_url, audio_path, mime_type, duration_seconds, volume_peak, volume_average, x_position, y_position, color, created_at";

interface StarRecord {
  constellation_id: string | null;
  [key: string]: unknown;
}

export async function fetchConstellationsWithStars(filter?: {
  status?: string;
  id?: string;
}) {
  let query = supabaseAdmin
    .from("constellations")
    .select(CONSTELLATION_COLUMNS)
    .order("created_at", { ascending: true });
  if (filter?.status) query = query.eq("status", filter.status);
  if (filter?.id) query = query.eq("id", filter.id);
  const { data: cons, error } = await query;
  if (error) throw new Error(error.message);
  const list = cons ?? [];
  if (list.length === 0) return [];
  const ids = list.map((c) => c.id);
  const { data: stars, error: sErr } = await supabaseAdmin
    .from("stars")
    .select(STAR_COLUMNS)
    .in("constellation_id", ids)
    .order("created_at", { ascending: true });
  if (sErr) throw new Error(sErr.message);
  const byCon = new Map<string, StarRecord[]>();
  for (const s of (stars ?? []) as unknown as StarRecord[]) {
    if (!s.constellation_id) continue;
    const arr = byCon.get(s.constellation_id) ?? [];
    arr.push(s);
    byCon.set(s.constellation_id, arr);
  }
  return list.map((c) => ({ ...c, stars: byCon.get(c.id) ?? [] }));
}

interface TransitionPatch {
  synth_audio_url?: string | null;
  synth_audio_path?: string;
  ready_at?: string;
  error_message?: string;
}

/**
 * State guards (strict):
 *   mark-synthesizing: pending_synthesis -> synthesizing
 *   mark-ready:        synthesizing      -> ready
 *   mark-failed:       synthesizing      -> failed
 * Any other transition returns 409 JSON. The UPDATE re-checks status
 * (compare-and-swap) so two Max workers cannot double-claim a constellation.
 */
const VALID_SOURCES: Record<string, string[]> = {
  synthesizing: ["pending_synthesis"],
  ready: ["synthesizing"],
  failed: ["synthesizing"],
};

export async function transitionConstellation(
  id: string,
  target: "synthesizing" | "ready" | "failed",
  patch: TransitionPatch = {},
): Promise<Response> {
  const allowedFrom = VALID_SOURCES[target];
  const { data: current, error: curErr } = await supabaseAdmin
    .from("constellations")
    .select("id, status")
    .eq("id", id)
    .maybeSingle();
  if (curErr) return json({ error: curErr.message }, 500);
  if (!current) return json({ error: "Constellation not found" }, 404);
  if (!allowedFrom.includes(current.status)) {
    return json(
      {
        error: `Invalid status transition: ${current.status} -> ${target}`,
        current_status: current.status,
        allowed_from: allowedFrom,
      },
      409,
    );
  }
  const { data: updated, error: upErr } = await supabaseAdmin
    .from("constellations")
    .update({ status: target, ...patch })
    .eq("id", id)
    .in("status", allowedFrom)
    .select(CONSTELLATION_COLUMNS)
    .maybeSingle();
  if (upErr) return json({ error: upErr.message }, 500);
  if (!updated) {
    return json(
      {
        error: "Status changed concurrently; transition not applied",
        current_status: current.status,
      },
      409,
    );
  }
  const withStars = await fetchConstellationsWithStars({ id });
  return json(withStars[0] ?? updated, 200);
}