import { useState } from "react";
import {
  STATUS_LABELS,
  type ConstellationStatus,
  type ConstellationWithStars,
  type StarRow,
} from "@/lib/stars";
import { Constellation } from "./Constellation";

interface Props {
  constellations: ConstellationWithStars[];
  onPlay: (star: StarRow) => void;
  onPlaySynth: (c: ConstellationWithStars) => void;
  activeStarId: string | null;
}

const STATUS_STYLES: Record<ConstellationStatus, string> = {
  pending_synthesis: "border-sky-300/40 bg-sky-300/10 text-sky-200",
  synthesizing: "border-amber-300/40 bg-amber-300/10 text-amber-200",
  ready: "border-emerald-300/40 bg-emerald-300/10 text-emerald-200",
  failed: "border-red-400/40 bg-red-400/10 text-red-200",
};

function StatusBadge({ status }: { status: ConstellationStatus }) {
  return (
    <span
      className={`inline-flex items-center gap-1.5 rounded-full border px-2 py-0.5 text-[10px] ${STATUS_STYLES[status] ?? "border-border/40 bg-black/30 text-zinc-300"}`}
    >
      {status === "synthesizing" && (
        <span className="h-1.5 w-1.5 animate-pulse rounded-full bg-amber-300" />
      )}
      {STATUS_LABELS[status] ?? status}
    </span>
  );
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
  onPlaySynth,
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
    const synthPlayable =
      expanded.status === "ready" && Boolean(expanded.synth_audio_url);
    const synthPlaying = activeStarId === `synth:${expanded.id}`;
    return (
      <div className="space-y-3">
        <div className="flex items-center justify-between">
          <div>
            <h2 className="text-lg font-light text-zinc-100">{expanded.title}</h2>
            <p className="text-xs text-muted-foreground">
              {expanded.stars.length} stars ·{" "}
              {new Date(expanded.created_at).toLocaleString()}
            </p>
            <div className="mt-1.5">
              <StatusBadge status={expanded.status} />
            </div>
          </div>
          <button
            type="button"
            onClick={() => setExpandedId(null)}
            className="rounded-md border border-white/30 px-3 py-1.5 text-xs text-white/85 hover:bg-white/10 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-white/60"
          >
            ← Back to archive
          </button>
        </div>
        {synthPlayable && (
          <button
            type="button"
            onClick={() => onPlaySynth(expanded)}
            className="w-full rounded-md bg-emerald-300 px-4 py-2.5 text-sm font-medium text-zinc-900 transition hover:bg-emerald-200 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-emerald-300"
          >
            {synthPlaying ? "▶ Playing synthesized constellation…" : "▶ Play Synthesized Constellation"}
          </button>
        )}
        {expanded.status === "failed" && expanded.error_message && (
          <p className="rounded border border-red-400/30 bg-red-400/10 p-2 text-xs text-red-200">
            {expanded.error_message}
          </p>
        )}
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
          <div className="mt-1.5">
            <StatusBadge status={c.status} />
          </div>
        </button>
      ))}
    </div>
  );
}