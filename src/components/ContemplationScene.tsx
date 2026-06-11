import { useEffect, useLayoutEffect, useRef, useState } from "react";
import {
  STATUS_LABELS,
  type ConstellationStatus,
  type ConstellationWithStars,
  type StarRow,
} from "@/lib/stars";

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

function hashSeed(id: string, salt = 0) {
  let h = 2166136261 ^ salt;
  for (let i = 0; i < id.length; i++) {
    h ^= id.charCodeAt(i);
    h = Math.imul(h, 16777619);
  }
  return (h >>> 0) / 0xffffffff;
}

function easeInOut(t: number) {
  return t < 0.5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2;
}

const ANIM_MS = 600;

interface DriftPos {
  baseX: number; // normalized 0..1
  baseY: number;
  ampX: number;
  ampY: number;
  phaseX: number;
  phaseY: number;
  speed: number;
  scale: number; // cluster mini-size relative to canvas
}

function driftFor(id: string): DriftPos {
  const a = hashSeed(id, 1);
  const b = hashSeed(id, 2);
  const c = hashSeed(id, 3);
  const d = hashSeed(id, 4);
  return {
    baseX: 0.12 + a * 0.76,
    baseY: 0.18 + b * 0.64,
    ampX: 0.012 + c * 0.018,
    ampY: 0.012 + d * 0.018,
    phaseX: a * Math.PI * 2,
    phaseY: b * Math.PI * 2,
    speed: 0.15 + c * 0.2,
    scale: 0.08 + d * 0.04, // each cluster ~8-12% of canvas
  };
}

export function ContemplationScene({
  constellations,
  onPlay,
  onPlaySynth,
  activeStarId,
}: Props) {
  const containerRef = useRef<HTMLDivElement>(null);
  const [size, setSize] = useState({ w: 1, h: 1 });
  const [expandedId, setExpandedId] = useState<string | null>(null);
  const [animState, setAnimState] = useState<{
    id: string | null;
    from: number; // 0 = collapsed, 1 = expanded
    to: number;
    start: number;
  }>({ id: null, from: 0, to: 0, start: 0 });
  const [, setTick] = useState(0);
  const rafRef = useRef<number | null>(null);

  useLayoutEffect(() => {
    const el = containerRef.current;
    if (!el) return;
    const update = () => {
      const r = el.getBoundingClientRect();
      setSize({ w: r.width, h: r.height });
    };
    update();
    const ro = new ResizeObserver(update);
    ro.observe(el);
    return () => ro.disconnect();
  }, []);

  useEffect(() => {
    const loop = () => {
      setTick((n) => (n + 1) % 1_000_000);
      rafRef.current = requestAnimationFrame(loop);
    };
    rafRef.current = requestAnimationFrame(loop);
    return () => {
      if (rafRef.current != null) cancelAnimationFrame(rafRef.current);
    };
  }, []);

  const expanded = constellations.find((c) => c.id === expandedId) ?? null;

  const handleClusterClick = (id: string) => {
    if (expandedId === id) return;
    setExpandedId(id);
    setAnimState({ id, from: 0, to: 1, start: performance.now() });
  };

  const handleCollapse = () => {
    if (!expandedId) return;
    setAnimState({ id: expandedId, from: 1, to: 0, start: performance.now() });
    // keep id mounted during collapse, then drop
    const target = expandedId;
    setTimeout(() => {
      setExpandedId((cur) => (cur === target ? null : cur));
    }, ANIM_MS);
  };

  const { w, h } = size;
  const cx = w / 2;
  const cy = h / 2;
  const now = performance.now();
  const t = now * 0.001;

  // Compute current animation progress for the targeted cluster (0..1)
  const animProg = (() => {
    if (!animState.id) return 0;
    const p = Math.min(1, (now - animState.start) / ANIM_MS);
    return animState.from + (animState.to - animState.from) * easeInOut(p);
  })();

  if (constellations.length === 0) {
    return (
      <div className="rounded-lg border border-border/30 bg-black/40 p-8 text-center text-sm text-muted-foreground">
        No completed constellations yet. Record a few stars in Input Mode, then
        tap “Create Constellation.”
      </div>
    );
  }

  return (
    <div className="space-y-3">
      <div
        ref={containerRef}
        className="relative h-[60vh] min-h-[420px] w-full overflow-hidden rounded-lg border border-border/30 bg-black/40"
        onClick={(e) => {
          // click on backdrop = collapse
          if (e.target === e.currentTarget && expandedId) handleCollapse();
        }}
      >
        <svg
          className="absolute inset-0 h-full w-full"
          onClick={(e) => {
            if (e.target === e.currentTarget && expandedId) handleCollapse();
          }}
        >
          {constellations.map((c) => {
            const drift = driftFor(c.id);
            const isExpanded = expandedId === c.id;
            const isAnimating = animState.id === c.id;
            const progress = isExpanded
              ? isAnimating
                ? animProg
                : 1
              : isAnimating
                ? animProg
                : 0;

            // drift center
            const dx =
              drift.baseX + Math.sin(t * drift.speed + drift.phaseX) * drift.ampX;
            const dy =
              drift.baseY + Math.cos(t * drift.speed + drift.phaseY) * drift.ampY;
            const driftCx = dx * w;
            const driftCy = dy * h;

            // expanded center = canvas center
            const finalCx = driftCx + (cx - driftCx) * progress;
            const finalCy = driftCy + (cy - driftCy) * progress;

            // local cluster radius (relative to canvas min dim)
            const minDim = Math.min(w, h);
            const smallRadius = minDim * drift.scale;
            const bigRadius = minDim * 0.36;
            const radius = smallRadius + (bigRadius - smallRadius) * progress;

            const opacity = expandedId && !isExpanded ? 0.25 : 1;


            // Compute child star positions (cluster local 0..1 -> ring)
            const pts = c.stars.map((s, i) => {
              // Use star's stored x/y (relative to its own 0..1 cluster space),
              // but re-centred to (0,0) and rescaled by `radius`.
              const lx = (s.x_position - 0.5) * 2; // -1..1
              const ly = (s.y_position - 0.5) * 2;
              return {
                star: s,
                px: finalCx + lx * radius,
                py: finalCy + ly * radius,
                hi: hashSeed(s.id, i + 1),
              };
            });

            const poly = pts.map((p) => `${p.px.toFixed(1)},${p.py.toFixed(1)}`).join(" ");

            return (
              <g
                key={c.id}
                opacity={opacity}
                style={{ cursor: isExpanded ? "default" : "pointer" }}
                onClick={(e) => {
                  e.stopPropagation();
                  if (!isExpanded) handleClusterClick(c.id);
                }}
              >
                {pts.length > 1 && (
                  <polyline
                    points={poly}
                    fill="none"
                    stroke={
                      isExpanded
                        ? "rgba(252, 211, 77, 0.55)"
                        : "rgba(252, 211, 77, 0.30)"
                    }
                    strokeWidth={isExpanded ? 1.2 : 0.8}
                  />
                )}
                {pts.map(({ star: s, px, py, hi }) => {
                  // gentle per-star hover when collapsed; bigger when expanded
                  const amp = (isExpanded ? 3 : 1.2) + hi * 1.5;
                  const ox = Math.sin(t * 0.9 + hi * 6.28) * amp;
                  const oy = Math.cos(t * 0.8 + hi * 5.13) * amp;
                  const x = px + ox;
                  const y = py + oy;
                  const isActive = activeStarId === s.id;
                  const baseR = isExpanded ? 5 : 2.4;
                  return (
                    <g
                      key={s.id}
                      onClick={(e) => {
                        if (!isExpanded) return;
                        e.stopPropagation();
                        onPlay(s);
                      }}
                      style={{
                        cursor: isExpanded ? "pointer" : "inherit",
                        pointerEvents: isExpanded ? "auto" : "none",
                      }}
                    >
                      <circle
                        cx={x}
                        cy={y}
                        r={isActive ? baseR * 1.7 + 6 : baseR + 4}
                        fill={s.color}
                        opacity={0.14}
                      />
                      <circle
                        cx={x}
                        cy={y}
                        r={isActive ? baseR + 1.5 : baseR}
                        fill={s.color}
                      />
                      {isExpanded && (
                        <title>
                          {s.duration_seconds.toFixed(1)}s · tap to replay
                        </title>
                      )}
                    </g>
                  );
                })}
                {/* Small label under cluster while collapsed */}
                {!isExpanded && progress < 0.2 && (
                  <text
                    x={driftCx}
                    y={driftCy + smallRadius + 14}
                    textAnchor="middle"
                    fill="rgba(226,232,240,0.55)"
                    fontSize={10}
                  >
                    {c.title}
                  </text>
                )}
              </g>
            );
          })}
        </svg>

        {expanded && (
          <div className="pointer-events-none absolute inset-x-0 top-0 z-10 flex flex-col items-center gap-2 px-4 pt-4 text-center">
            <p className="pointer-events-auto text-xs uppercase tracking-[0.2em] text-amber-200/70">
              {expanded.title}
            </p>
            <p className="pointer-events-auto max-w-xl text-sm text-zinc-200/85">
              {expanded.question_text}
            </p>
            <div className="pointer-events-auto">
              <StatusBadge status={expanded.status} />
            </div>
          </div>
        )}

        {expanded && (
          <div className="absolute inset-x-0 bottom-0 z-10 flex flex-col items-center gap-2 p-4">
            {expanded.status === "ready" && expanded.synth_audio_path && (
              <button
                type="button"
                onClick={() => onPlaySynth(expanded)}
                className="rounded-md bg-emerald-300 px-4 py-2 text-sm font-medium text-zinc-900 transition hover:bg-emerald-200"
              >
                {activeStarId === `synth:${expanded.id}`
                  ? "▶ Playing synthesized constellation…"
                  : "▶ Play Synthesized Constellation"}
              </button>
            )}
            {expanded.status === "failed" && expanded.error_message && (
              <p className="rounded border border-red-400/30 bg-red-400/10 p-2 text-xs text-red-200">
                {expanded.error_message}
              </p>
            )}
            <button
              type="button"
              onClick={handleCollapse}
              className="rounded-md border border-white/30 px-3 py-1.5 text-xs text-white/85 hover:bg-white/10"
            >
              Close
            </button>
            <p className="text-[10px] text-muted-foreground">
              Tap any star to hear it. Tap outside to close.
            </p>
          </div>
        )}
      </div>

      {!expanded && (
        <p className="text-center text-[11px] text-muted-foreground">
          Tap a constellation to expand it.
        </p>
      )}
    </div>
  );
}
