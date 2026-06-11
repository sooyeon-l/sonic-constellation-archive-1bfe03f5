import { createFileRoute } from "@tanstack/react-router";

export const Route = createFileRoute("/api/public/constellations/$id")({
  server: {
    handlers: {
      OPTIONS: async () => (await import("@/lib/max-api.server")).preflight(),
      GET: async ({ params }) => {
        const api = await import("@/lib/max-api.server");
        if (!api.isUuid(params.id)) {
          return api.json({ error: "Invalid constellation id" }, 400);
        }
        try {
          const rows = await api.fetchConstellationsWithStars({
            id: params.id,
          });
          if (rows.length === 0) {
            return api.json({ error: "Constellation not found" }, 404);
          }
          return api.json(rows[0]);
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