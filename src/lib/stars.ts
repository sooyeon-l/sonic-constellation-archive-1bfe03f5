import { supabase } from "@/integrations/supabase/client";

export const QUESTION_TEXT =
  "What sound do you wish you could hear one more time?";

export const MIN_CONSTELLATION_STARS = 3;
export const MAX_CONSTELLATION_STARS = 7;

export const STAR_COLORS = [
  "#fef3c7",
  "#fde68a",
  "#fca5a5",
  "#f9a8d4",
  "#c4b5fd",
  "#93c5fd",
  "#67e8f9",
  "#86efac",
];

export type ConstellationStatus =
  | "pending_synthesis"
  | "synthesizing"
  | "ready"
  | "failed";

export const STATUS_LABELS: Record<ConstellationStatus, string> = {
  pending_synthesis: "Waiting for Max synthesis",
  synthesizing: "Max is synthesizing",
  ready: "Synthesized sound ready",
  failed: "Synthesis failed",
};

export interface StarRow {
  id: string;
  question_text: string;
  audio_url: string;
  audio_path: string;
  max_audio_url: string | null;
  mime_type: string | null;
  duration_seconds: number;
  volume_peak: number | null;
  volume_average: number | null;
  x_position: number;
  y_position: number;
  radial_distance: number | null;
  angle: number | null;
  color: string;
  created_at: string;
  constellation_id: string | null;
}


export interface ConstellationRow {
  id: string;
  title: string;
  question_text: string;
  status: ConstellationStatus;
  synthesis_params: unknown;
  mood_params: unknown;
  synth_audio_url: string | null;
  synth_audio_path: string | null;
  error_message: string | null;
  created_at: string;
  ready_at: string | null;
}

export interface ConstellationWithStars extends ConstellationRow {
  stars: StarRow[];
}

export interface RecordingMeta {
  durationSeconds: number;
  volumePeak: number;
  volumeAverage: number;
  mimeType: string;
}

export function randomColor() {
  return STAR_COLORS[Math.floor(Math.random() * STAR_COLORS.length)];
}

function clamp01(v: number, min: number, max: number) {
  return Math.min(max, Math.max(min, v));
}

/**
 * Map recording average volume to a radial position around the canvas center,
 * matching the p5 prototype: louder = farther from center.
 */
export function radialPositionFromVolume(volumeAverage: number | null) {
  const expectedMax = 0.35;
  const normVol = clamp01((volumeAverage ?? 0) / expectedMax, 0, 1);
  const radialDistance = 0.12 + normVol * 0.30; // 0.12 .. 0.42 of canvas half-size
  const angle = Math.random() * Math.PI * 2;
  const x = clamp01(0.5 + Math.cos(angle) * radialDistance, 0.05, 0.95);
  const y = clamp01(0.5 + Math.sin(angle) * radialDistance, 0.05, 0.95);
  return { x, y, radialDistance, angle };
}

export function randomPosition() {
  const pad = 0.08;
  return {
    x: pad + Math.random() * (1 - pad * 2),
    y: pad + Math.random() * (1 - pad * 2),
  };
}


const CONSTELLATION_COLUMNS =
  "id, title, question_text, status, synthesis_params, mood_params, synth_audio_url, synth_audio_path, error_message, created_at, ready_at";

export async function fetchStars(): Promise<StarRow[]> {
  const { data, error } = await supabase
    .from("stars")
    .select(
      "id, question_text, audio_url, audio_path, max_audio_url, mime_type, duration_seconds, volume_peak, volume_average, x_position, y_position, color, created_at, constellation_id",
    )
    .order("created_at", { ascending: true });
  if (error) throw error;
  return (data ?? []) as StarRow[];
}

export async function fetchConstellations(): Promise<ConstellationWithStars[]> {
  const [{ data: cons, error: cErr }, { data: stars, error: sErr }] =
    await Promise.all([
      supabase
        .from("constellations")
        .select(CONSTELLATION_COLUMNS)
        .order("created_at", { ascending: true }),
      supabase
        .from("stars")
        .select(
          "id, question_text, audio_url, audio_path, max_audio_url, mime_type, duration_seconds, volume_peak, volume_average, x_position, y_position, color, created_at, constellation_id",
        )
        .not("constellation_id", "is", null)
        .order("created_at", { ascending: true }),
    ]);
  if (cErr) throw cErr;
  if (sErr) throw sErr;
  const byCon = new Map<string, StarRow[]>();
  for (const s of (stars ?? []) as StarRow[]) {
    if (!s.constellation_id) continue;
    const arr = byCon.get(s.constellation_id) ?? [];
    arr.push(s);
    byCon.set(s.constellation_id, arr);
  }
  return ((cons ?? []) as ConstellationRow[]).map((c) => ({
    ...c,
    stars: byCon.get(c.id) ?? [],
  }));
}

function clamp(v: number, min: number, max: number) {
  return Math.min(max, Math.max(min, v));
}

/**
 * Basic per-star synthesis parameters derived from recording metadata.
 * Max can use these as a starting point for voice mapping.
 */
export function buildSynthesisParams(stars: StarRow[]) {
  return {
    version: 1,
    voice_count: stars.length,
    voices: stars.map((s, index) => ({
      star_id: s.id,
      index,
      audio_url: s.audio_url,
      audio_path: s.audio_path,
      mime_type: s.mime_type,
      duration_seconds: s.duration_seconds,
      // x position (0..1) -> stereo pan (-1..1)
      pan: Number((s.x_position * 2 - 1).toFixed(3)),
      // y position (0 = top) -> brightness/pitch hint (0..1, top = brighter)
      pitch: Number((1 - s.y_position).toFixed(3)),
      // average volume -> gain hint (0.2..1)
      gain: Number(clamp(0.2 + (s.volume_average ?? 0.3) * 2, 0.2, 1).toFixed(3)),
      peak: s.volume_peak,
      color: s.color,
    })),
  };
}

/**
 * Basic aggregate mood parameters derived from star metadata.
 */
export function buildMoodParams(stars: StarRow[]) {
  const n = Math.max(1, stars.length);
  const totalDuration = stars.reduce((a, s) => a + s.duration_seconds, 0);
  const avgVolume =
    stars.reduce((a, s) => a + (s.volume_average ?? 0), 0) / n;
  const maxPeak = stars.reduce((a, s) => Math.max(a, s.volume_peak ?? 0), 0);
  const avgBrightness = stars.reduce((a, s) => a + (1 - s.y_position), 0) / n;
  return {
    version: 1,
    star_count: stars.length,
    total_duration_seconds: Number(totalDuration.toFixed(2)),
    // stars per second of source material — denser = busier texture
    density: Number((stars.length / Math.max(1, totalDuration)).toFixed(4)),
    energy: Number(clamp(avgVolume * 3, 0, 1).toFixed(3)),
    peak: Number(maxPeak.toFixed(3)),
    brightness: Number(avgBrightness.toFixed(3)),
    palette: stars.map((s) => s.color),
  };
}

export async function createConstellationFromStars(
  stars: StarRow[],
  title?: string,
): Promise<ConstellationWithStars> {
  if (stars.length < MIN_CONSTELLATION_STARS) {
    throw new Error(
      `At least ${MIN_CONSTELLATION_STARS} stars are needed to form a constellation.`,
    );
  }
  if (stars.length > MAX_CONSTELLATION_STARS) {
    throw new Error(
      `A constellation can hold at most ${MAX_CONSTELLATION_STARS} stars.`,
    );
  }
  const res = await fetch("/api/public/constellations/create", {
    method: "POST",
    headers: { "Content-Type": "application/json", Accept: "application/json" },
    body: JSON.stringify({
      star_ids: stars.map((s) => s.id),
      title: title?.trim() || undefined,
    }),
  });
  let payload: unknown = null;
  try {
    payload = await res.json();
  } catch {
    /* noop */
  }
  if (!res.ok) {
    const msg =
      (payload as { error?: string } | null)?.error ??
      `Failed to create constellation (HTTP ${res.status})`;
    throw new Error(msg);
  }
  return payload as ConstellationWithStars;
}

export async function uploadAndInsertStar(
  blob: Blob,
  meta: RecordingMeta,
): Promise<StarRow> {
  if (!blob.type.startsWith("audio/")) {
    throw new Error("Recording is not an audio file.");
  }
  if (blob.size > 10 * 1024 * 1024) {
    throw new Error("Recording is larger than 10MB.");
  }
  if (meta.durationSeconds < 0.5 || meta.durationSeconds > 120) {
    throw new Error("Recording must be between 0.5 and 120 seconds.");
  }

  const id = crypto.randomUUID();
  const path = `recordings/${id}.webm`;

  const { error: upErr } = await supabase.storage
    .from("star-audio")
    .upload(path, blob, { contentType: meta.mimeType, upsert: false });
  if (upErr) throw upErr;

  // Stable public URL (no token, never expires). Requires the star-audio
  // bucket to be public. If the workspace still blocks public buckets, the
  // public URL won't resolve, so fall back to a long-lived signed URL until
  // public buckets are enabled (the Max panel warns when this happens).
  const { data: pub } = supabase.storage
    .from("star-audio")
    .getPublicUrl(path);
  let audioUrl = pub.publicUrl;
  try {
    const head = await fetch(audioUrl, { method: "HEAD" });
    if (!head.ok) throw new Error("public URL not accessible");
  } catch {
    const { data: signed, error: signErr } = await supabase.storage
      .from("star-audio")
      .createSignedUrl(path, 60 * 60 * 24 * 365);
    if (signErr || !signed) throw signErr ?? new Error("Failed to sign URL");
    audioUrl = signed.signedUrl;
  }

  const pos = radialPositionFromVolume(meta.volumeAverage);
  const row = {
    id,
    question_text: QUESTION_TEXT,
    audio_url: audioUrl,
    audio_path: path,
    mime_type: meta.mimeType,
    duration_seconds: Number(meta.durationSeconds.toFixed(2)),
    volume_peak: Number(meta.volumePeak.toFixed(4)),
    volume_average: Number(meta.volumeAverage.toFixed(4)),
    x_position: Number(pos.x.toFixed(4)),
    y_position: Number(pos.y.toFixed(4)),
    radial_distance: Number(pos.radialDistance.toFixed(4)),
    angle: Number(pos.angle.toFixed(4)),
    color: randomColor(),
  };


  const { data, error } = await supabase
    .from("stars")
    .insert(row)
    .select()
    .single();
  if (error) throw error;
  return data as StarRow;
}

export function isRecordingSupported(): boolean {
  if (typeof window === "undefined") return true;
  return Boolean(
    navigator.mediaDevices &&
      typeof navigator.mediaDevices.getUserMedia === "function" &&
      typeof window.MediaRecorder !== "undefined",
  );
}