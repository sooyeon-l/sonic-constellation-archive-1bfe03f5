import { createFileRoute } from "@tanstack/react-router";
import {
  setResponseHeader,
  setResponseStatus,
} from "@tanstack/react-start/server";

const COLUMNS =
  "id, constellation_id, audio_url, max_audio_url, audio_path, mime_type, duration_seconds, volume_peak, volume_average, x_position, y_position, color, created_at";

function setJsonHeaders() {
  setResponseHeader("content-type", "application/json; charset=utf-8");
  setResponseHeader("access-control-allow-origin", "*");
  setResponseHeader("cache-control", "no-store");
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
        setJsonHeaders();
        if (error) {
          setResponseStatus(500);
          return { error: error.message };
        }
        if (!data) {
          setResponseStatus(404);
          return { error: "No stars yet" };
        }
        return data;
      },
    },
  },
});