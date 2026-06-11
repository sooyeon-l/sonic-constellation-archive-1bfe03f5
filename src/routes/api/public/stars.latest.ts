import { createFileRoute } from "@tanstack/react-router";

const COLUMNS =
  "id, constellation_id, audio_url, max_audio_url, audio_path, mime_type, duration_seconds, volume_peak, volume_average, x_position, y_position, radial_distance, angle, color, created_at";

const JSON_HEADERS = {
  "Content-Type": "application/json; charset=utf-8",
  "Access-Control-Allow-Origin": "*",
  "Cache-Control": "no-store",
} as const;

function jsonResponse(body: unknown, status = 200): Response {
  return new Response(JSON.stringify(body), { status, headers: JSON_HEADERS });
}

export const Route = createFileRoute("/api/public/stars/latest")({
  server: {
    handlers: {
      GET: async () => {
        const { supabaseAdmin } = await import(
          "@/integrations/supabase/client.server"
        );
        const { data, error } = await supabaseAdmin
          .from("stars")
          .select(COLUMNS)
          .order("created_at", { ascending: false })
          .limit(1)
          .maybeSingle();
        if (error) return jsonResponse({ error: error.message }, 500);
        if (!data) return jsonResponse({ error: "No stars yet" }, 404);
        return jsonResponse(data, 200);
      },
    },
  },
});