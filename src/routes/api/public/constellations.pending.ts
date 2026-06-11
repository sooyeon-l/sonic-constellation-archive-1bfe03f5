import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/api/public/constellations/pending")({
  server: {
    handlers: {
      OPTIONS: async () => (await import("@/lib/max-api.server")).preflight(),
      GET: async () => {
        const api = await import("@/lib/max-api.server");
        try {
          return api.json(
            await api.fetchConstellationsWithStars({
              status: "pending_synthesis",
            }),
          );
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