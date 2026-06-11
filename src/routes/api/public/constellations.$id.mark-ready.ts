import { createFileRoute } from "@tanstack/react-router";
import { z } from "zod";

const BodySchema = z.object({
  synth_audio_url: z.string().url().min(1).max(2000),
  synth_audio_path: z
    .string()
    .min(1)
    .max(500)
    .regex(/^[a-zA-Z0-9/._-]+$/),
});

export const Route = createFileRoute(
  "/api/public/constellations/$id/mark-ready",
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
        let raw: unknown;
        try {
          raw = await request.json();
        } catch {
          return api.json({ error: "Invalid JSON body" }, 400);
        }
        const parsed = BodySchema.safeParse(raw);
        if (!parsed.success) {
          return api.json(
            { error: "Invalid body", details: parsed.error.flatten() },
            400,
          );
        }
        try {
          return await api.transitionConstellation(params.id, "ready", {
            synth_audio_url: parsed.data.synth_audio_url,
            synth_audio_path: parsed.data.synth_audio_path,
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