import { createFileRoute } from "@tanstack/react-router";

const MAX_BYTES = 50 * 1024 * 1024; // 50 MB

export const Route = createFileRoute(
  "/api/public/constellations/$id/upload-synth",
)({
  server: {
    handlers: {
      OPTIONS: async () => (await import("@/lib/max-api.server")).preflight(),
      POST: async ({ request, params }) => {
        const api = await import("@/lib/max-api.server");
        const denied = api.verifyMaxWorkerSecret(request);
        if (denied) return denied;
        if (!api.isUuid(params.id)) {
          return api.json({ error: "Invalid constellation id" }, 400);
        }

        // Accept multipart/form-data (field "file") OR JSON { audio_base64 }.
        const contentType = request.headers.get("content-type") ?? "";
        let bytes: Uint8Array;
        try {
          if (contentType.includes("multipart/form-data")) {
            const form = await request.formData();
            const file = form.get("file");
            if (!(file instanceof File) && !(file instanceof Blob)) {
              return api.json(
                { error: "Missing 'file' field in multipart body" },
                400,
              );
            }
            const buf = await file.arrayBuffer();
            bytes = new Uint8Array(buf);
          } else if (contentType.includes("application/json")) {
            const body = (await request.json()) as { audio_base64?: unknown };
            if (typeof body.audio_base64 !== "string" || !body.audio_base64) {
              return api.json(
                { error: "Missing 'audio_base64' string in JSON body" },
                400,
              );
            }
            const b64 = body.audio_base64.replace(/^data:[^;]+;base64,/, "");
            bytes = Uint8Array.from(Buffer.from(b64, "base64"));
          } else if (
            contentType.includes("audio/") ||
            contentType.includes("application/octet-stream")
          ) {
            const buf = await request.arrayBuffer();
            bytes = new Uint8Array(buf);
          } else {
            return api.json(
              {
                error:
                  "Unsupported Content-Type. Use multipart/form-data, application/json {audio_base64}, or audio/wav.",
              },
              415,
            );
          }
        } catch (err) {
          return api.json(
            {
              error: `Failed to read request body: ${
                err instanceof Error ? err.message : "unknown"
              }`,
            },
            400,
          );
        }

        if (bytes.byteLength === 0) {
          return api.json({ error: "Empty audio payload" }, 400);
        }
        if (bytes.byteLength > MAX_BYTES) {
          return api.json(
            {
              error: `Audio too large (${bytes.byteLength} bytes, max ${MAX_BYTES})`,
            },
            413,
          );
        }

        const synthPath = `synthesized/${params.id}.wav`;
        try {
          const { supabaseAdmin } = await import(
            "@/integrations/supabase/client.server"
          );
          const { error: upErr } = await supabaseAdmin.storage
            .from("star-audio")
            .upload(synthPath, bytes, {
              contentType: "audio/wav",
              upsert: true,
            });
          if (upErr) {
            return api.json(
              { error: `Storage upload failed: ${upErr.message}` },
              500,
            );
          }
        } catch (err) {
          return api.json(
            {
              error: `Storage upload error: ${
                err instanceof Error ? err.message : "unknown"
              }`,
            },
            500,
          );
        }

        try {
          return await api.transitionConstellation(params.id, "ready", {
            synth_audio_url: null,
            synth_audio_path: synthPath,
            ready_at: new Date().toISOString(),
          });
        } catch (err) {
          return api.json(
            { error: err instanceof Error ? err.message : "Internal error" },
            500,
          );
        }
      },
    },
  },
});
