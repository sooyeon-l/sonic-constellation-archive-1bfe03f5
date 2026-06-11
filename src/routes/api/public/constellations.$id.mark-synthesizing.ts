import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute(
  "/api/public/constellations/$id/mark-synthesizing",
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
        try {
          return await api.transitionConstellation(params.id, "synthesizing");
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