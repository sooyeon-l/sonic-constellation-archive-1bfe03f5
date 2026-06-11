import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/api/public/constellations/create")({
  server: {
    handlers: {
      OPTIONS: async () => (await import("@/lib/max-api.server")).preflight(),
      POST: async ({ request }) => {
        const api = await import("@/lib/max-api.server");
        const { supabaseAdmin } = await import(
          "@/integrations/supabase/client.server"
        );
        const { buildSynthesisParams, buildMoodParams, QUESTION_TEXT } =
          await import("@/lib/stars-shared");

        let body: unknown;
        try {
          body = await request.json();
        } catch {
          return api.json({ error: "Invalid JSON body" }, 400);
        }
        const b = (body ?? {}) as { star_ids?: unknown; title?: unknown };
        const ids = Array.isArray(b.star_ids) ? b.star_ids : null;
        if (
          !ids ||
          ids.length < 3 ||
          ids.length > 7 ||
          !ids.every((v) => typeof v === "string" && api.isUuid(v))
        ) {
          return api.json(
            { error: "star_ids must be 3–7 valid UUID strings" },
            400,
          );
        }
        const uniqueIds = Array.from(new Set(ids as string[]));
        if (uniqueIds.length !== ids.length) {
          return api.json({ error: "star_ids must be unique" }, 400);
        }

        let title: string | null = null;
        if (b.title !== undefined && b.title !== null) {
          if (typeof b.title !== "string") {
            return api.json({ error: "title must be a string" }, 400);
          }
          const trimmed = b.title.trim().replace(/[\u0000-\u001f\u007f]/g, "");
          if (trimmed.length > 200) {
            return api.json({ error: "title too long (max 200)" }, 400);
          }
          title = trimmed.length > 0 ? trimmed : null;
        }

        const { data: stars, error: sErr } = await supabaseAdmin
          .from("stars")
          .select(
            "id, constellation_id, audio_url, audio_path, mime_type, duration_seconds, volume_peak, volume_average, x_position, y_position, radial_distance, angle, color",
          )
          .in("id", uniqueIds);
        if (sErr) return api.json({ error: sErr.message }, 500);
        if (!stars || stars.length !== uniqueIds.length) {
          return api.json(
            { error: "One or more stars not found" },
            400,
          );
        }
        if (stars.some((s) => s.constellation_id !== null)) {
          return api.json(
            { error: "One or more stars already belong to a constellation" },
            409,
          );
        }

        const starRows = stars as Parameters<typeof buildSynthesisParams>[0];
        const finalTitle =
          title ??
          `Constellation ${new Date().toLocaleString(undefined, {
            dateStyle: "short",
            timeStyle: "short",
          })}`;

        const { data: con, error: cErr } = await supabaseAdmin
          .from("constellations")
          .insert({
            title: finalTitle,
            question_text: QUESTION_TEXT,
            status: "pending_synthesis",
            synthesis_params: buildSynthesisParams(starRows),
            mood_params: buildMoodParams(starRows),
          })
          .select("id")
          .single();
        if (cErr || !con) {
          return api.json(
            { error: cErr?.message ?? "Failed to create constellation" },
            500,
          );
        }

        const { error: uErr } = await supabaseAdmin
          .from("stars")
          .update({ constellation_id: con.id })
          .in("id", uniqueIds)
          .is("constellation_id", null);
        if (uErr) {
          return api.json({ error: uErr.message }, 500);
        }

        const withStars = await api.fetchConstellationsWithStars({ id: con.id });
        return api.json(withStars[0] ?? { id: con.id }, 201);
      },
    },
  },
});