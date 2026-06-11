import { createFileRoute } from "@tanstack/react-router";

const EXPIRES_IN = 3600;

export const Route = createFileRoute(
  "/api/public/constellations/$id/synth-audio",
)({
  server: {
    handlers: {
      OPTIONS: async () => (await import("@/lib/max-api.server")).preflight(),
      GET: async ({ params }) => {
        const api = await import("@/lib/max-api.server");
        if (!api.isUuid(params.id)) {
          return api.json({ error: "Invalid constellation id" }, 400);
        }
        const { supabaseAdmin } = await import(
          "@/integrations/supabase/client.server"
        );
        const { data: con, error } = await supabaseAdmin
          .from("constellations")
          .select("id, status, synth_audio_path")
          .eq("id", params.id)
          .maybeSingle();
        if (error) return api.json({ error: error.message }, 500);
        if (!con) return api.json({ error: "Constellation not found" }, 404);
        if (con.status !== "ready") {
          return api.json(
            { error: "Constellation is not ready", status: con.status },
            409,
          );
        }
        if (!con.synth_audio_path) {
          return api.json(
            { error: "Constellation has no synth_audio_path" },
            404,
          );
        }
        const { data: signed, error: sErr } = await supabaseAdmin.storage
          .from("star-audio")
          .createSignedUrl(con.synth_audio_path, EXPIRES_IN);
        if (sErr || !signed) {
          return api.json(
            { error: sErr?.message ?? "Failed to sign URL" },
            500,
          );
        }
        return api.json({
          signed_url: signed.signedUrl,
          expires_in: EXPIRES_IN,
        });
      },
    },
  },
});
