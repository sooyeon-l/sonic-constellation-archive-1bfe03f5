import { useState } from "react";
import type { ConstellationWithStars, StarRow } from "@/lib/stars";
import { Constellation } from "./Constellation";

interface Props {
  constellations: ConstellationWithStars[];
  onPlay: (star: StarRow) => void;
  activeStarId: string | null;
}

function MiniConstellation({ c }: { c: ConstellationWithStars }) {
  const W = 160;
  const H = 100;
  const pts = c.stars
    .map((s) => `${(s.x_position * W).toFixed(1)},${(s.y_position * H).toFixed(1)}`)
    .join(" ");
  return (
    <svg viewBox={`0 0 ${W} ${H}`} className="h-24 w-full">
      {c.stars.length > 1 && (
        <polyline
          points={pts}
          fill="none"
          stroke="rgba(252, 211, 77, 0.35)"
          strokeWidth={0.8}
        />
      )}
      {c.stars.map((s) => (
        <circle
          key={s.id}
          cx={s.x_position * W}
          cy={s.y_position * H}
          r={2}
          fill={s.color}
        />
      ))}
    </svg>
  );
}

export function ConstellationArchive({
  constellations,
  onPlay,
  activeStarId,
}: Props) {
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const expanded = constellations.find((c) => c.id === expandedId) ?? null;

  if (constellations.length === 0) {
    return (
      <div className="rounded-lg border border-border/30 bg-black/40 p-8 text-center text-sm text-muted-foreground">
        No completed constellations yet. Record a few stars in Input Mode, then
        tap “Create Constellation.”
      </div>
    );
  }

  if (expanded) {
    return (
      <div className="space-y-3">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-lg font-light text-zinc-100">{expanded.title}</h2>
            <p className="text-xs text-muted-foreground">
              {expanded.stars.length} stars ·{" "}
              {new Date(expanded.created_at).toLocaleString()}
            </p>
          </div>
          <button
            type="button"
            onClick={() => setExpandedId(null)}
            className="rounded-md border border-white/30 px-3 py-1.5 text-xs text-white/85 hover:bg-white/10 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-white/60"
          >
            ← Back to archive
          </button>
        </div>
        <Constellation
          stars={expanded.stars}
          onPlay={onPlay}
          activeId={activeStarId}
        />
        <p className="text-center text-xs text-muted-foreground">
          Click a star to hear it.
        </p>
      </div>
    );
  }

  return (
    <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 md:grid-cols-4">
      {constellations.map((c) => (
        <button
          type="button"
          key={c.id}
          onClick={() => setExpandedId(c.id)}
          className="group rounded-lg border border-border/30 bg-black/40 p-3 text-left transition hover:border-amber-200/50 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-amber-200"
        >
          <MiniConstellation c={c} />
          <div className="mt-2 truncate text-xs text-zinc-200">{c.title}</div>
          <div className="text-[10px] text-muted-foreground">
            {c.stars.length} stars
          </div>
        </button>
      ))}
    </div>
  );
}