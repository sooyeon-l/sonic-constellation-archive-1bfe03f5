import { useEffect, useLayoutEffect, useRef, useState } from "react";
import type { StarRow } from "@/lib/stars";

interface Props {
  stars: StarRow[];
  onPlay: (star: StarRow) => void;
  activeId: string | null;
}

interface StarAnim {
  id: string;
  // Per-star hover phase offsets (deterministic from id hash)
  phaseX: number;
  phaseY: number;
  hoverAmp: number;
  // Spawn timestamp for fly-in lerp
  spawnTs: number;
}

function hashSeed(id: string) {
  let h = 2166136261;
  for (let i = 0; i < id.length; i++) {
    h ^= id.charCodeAt(i);
    h = Math.imul(h, 16777619);
  }
  return (h >>> 0) / 0xffffffff;
}

const SPAWN_MS = 900;

function easeOutCubic(t: number) {
  return 1 - Math.pow(1 - t, 3);
}

/**
 * Overlay covering the active session area. Newly added stars fly out from
 * the recording centre to their final (x_position, y_position), then gently
 * hover. Lines connect them. Click plays the recording.
 */
export function ActiveSessionOverlay({ stars, onPlay, activeId }: Props) {
  const containerRef = useRef<HTMLDivElement>(null);
  const [size, setSize] = useState({ w: 1, h: 1 });
  const animsRef = useRef<Map<string, StarAnim>>(new Map());
  const knownRef = useRef<Set<string>>(new Set());
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

  // Register new stars with spawn animation state.
  useEffect(() => {
    const now = performance.now();
    for (const s of stars) {
      if (!knownRef.current.has(s.id)) {
        knownRef.current.add(s.id);
        const seed = hashSeed(s.id);
        animsRef.current.set(s.id, {
          id: s.id,
          phaseX: seed * Math.PI * 2,
          phaseY: (1 - seed) * Math.PI * 2,
          hoverAmp: 2 + seed * 3, // px
          spawnTs: now,
        });
      }
    }
    // Remove anims for stars no longer in list
    for (const id of Array.from(animsRef.current.keys())) {
      if (!stars.find((s) => s.id === id)) {
        animsRef.current.delete(id);
        knownRef.current.delete(id);
      }
    }
  }, [stars]);

  // rAF loop drives hover + spawn animation.
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

  const { w, h } = size;
  const cx = w / 2;
  const cy = h / 2;
  const now = performance.now();
  const t = now * 0.001;

  const computed = stars.map((s) => {
    const anim = animsRef.current.get(s.id);
    const spawnT = anim ? Math.min(1, (now - anim.spawnTs) / SPAWN_MS) : 1;
    const e = easeOutCubic(spawnT);
    const targetX = s.x_position * w;
    const targetY = s.y_position * h;
    let x = cx + (targetX - cx) * e;
    let y = cy + (targetY - cy) * e;
    if (anim && spawnT >= 1) {
      x += Math.sin(t * 0.8 + anim.phaseX) * anim.hoverAmp;
      y += Math.cos(t * 0.7 + anim.phaseY) * anim.hoverAmp;
    }
    return { star: s, x, y, alpha: 0.4 + 0.6 * e };
  });

  const points = computed.map((c) => `${c.x.toFixed(1)},${c.y.toFixed(1)}`).join(" ");

  return (
    <div
      ref={containerRef}
      className="pointer-events-none absolute inset-0"
      aria-hidden={stars.length === 0}
    >
      <svg className="absolute inset-0 h-full w-full">
        {computed.length > 1 && (
          <polyline
            points={points}
            fill="none"
            stroke="rgba(252, 211, 77, 0.28)"
            strokeWidth={1}
          />
        )}
        {computed.map(({ star: s, x, y, alpha }) => {
          const isActive = s.id === activeId;
          return (
            <g
              key={s.id}
              onClick={() => onPlay(s)}
              className="pointer-events-auto cursor-pointer"
              opacity={alpha}
            >
              <circle cx={x} cy={y} r={isActive ? 20 : 14} fill={s.color} opacity={0.18} />
              <circle cx={x} cy={y} r={isActive ? 5.5 : 3.8} fill={s.color} />
              <title>{s.duration_seconds.toFixed(1)}s · tap to replay</title>
            </g>
          );
        })}
      </svg>
    </div>
  );
}
