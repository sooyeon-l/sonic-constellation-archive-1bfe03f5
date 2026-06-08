import { createFileRoute } from "@tanstack/react-router";

const COLUMNS =
  "id, constellation_id, audio_url, max_audio_url, audio_path, mime_type, duration_seconds, volume_peak, volume_average, x_position, y_position, color, created_at";

export const Route = createFileRoute("/api/public/stars")({
  server: {
    handlers: {
      GET: async () => {
        const { supabaseAdmin } = await import(
          "@/integrations/supabase/client.server"
        );
        const { data, error } = await supabaseAdmin
          .from("stars")
          .select(COLUMNS)
          .order("created_at", { ascending: true });
        if (error) {
          return Response.json(
            { error: error.message },
            {
              status: 500,
              headers: { "Access-Control-Allow-Origin": "*" },
            },
          );
        }
        return Response.json(data ?? [], {
          headers: {
            "Access-Control-Allow-Origin": "*",
            "Cache-Control": "no-store",
          },
        });
      },
    },
  },
});