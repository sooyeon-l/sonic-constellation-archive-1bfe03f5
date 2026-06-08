import { useEffect, useRef, useState } from "react";
import type { StarRow } from "@/lib/stars";

interface Props {
  stars: StarRow[];
  onPlay: (star: StarRow) => void;
  activeId: string | null;
}

/**
 * Overlay SVG covering the active session area. Newly added stars animate
 * from the centre (record button position) out to their assigned x/y.
 */
export function ActiveSessionOverlay({ stars, onPlay, activeId }: Props) {
  const containerRef = useRef<HTMLDivElement>(null);
  const [size, setSize] = useState({ w: 1, h: 1 });
  const [revealed, setRevealed] = useState<Set<string>>(new Set());

  useEffect(() => {
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
    // trigger a "fly from center" animation for any newly added star id
    const t = window.setTimeout(() => {
      setRevealed(new Set(stars.map((s) => s.id)));
    }, 20);
    return () => window.clearTimeout(t);
  }, [stars]);

  const { w, h } = size;
  const cx = w / 2;
  const cy = h / 2;

  const points = stars
    .map((s) => {
      const revealedNow = revealed.has(s.id);
      const x = revealedNow ? s.x_position * w : cx;
      const y = revealedNow ? s.y_position * h : cy;
      return `${x.toFixed(1)},${y.toFixed(1)}`;
    })
    .join(" ");

  return (
    <div
      ref={containerRef}
      className="pointer-events-none absolute inset-0"
      aria-hidden={stars.length === 0}
    >
      <svg className="absolute inset-0 h-full w-full">
        {stars.length > 1 && (
          <polyline
            points={points}
            fill="none"
            stroke="rgba(252, 211, 77, 0.3)"
            strokeWidth={1}
            style={{ transition: "all 700ms ease-out" }}
          />
        )}
        {stars.map((s) => {
          const revealedNow = revealed.has(s.id);
          const x = revealedNow ? s.x_position * w : cx;
          const y = revealedNow ? s.y_position * h : cy;
          const isActive = s.id === activeId;
          return (
            <g
              key={s.id}
              onClick={() => onPlay(s)}
              className="pointer-events-auto cursor-pointer"
              style={{ transition: "transform 700ms ease-out" }}
            >
              <circle
                cx={x}
                cy={y}
                r={isActive ? 18 : 14}
                fill={s.color}
                opacity={0.18}
                style={{ transition: "all 700ms ease-out" }}
              />
              <circle
                cx={x}
                cy={y}
                r={isActive ? 5 : 3.5}
                fill={s.color}
                style={{ transition: "all 700ms ease-out" }}
              />
              <title>{s.duration_seconds.toFixed(1)}s · tap to replay</title>
            </g>
          );
        })}
      </svg>
    </div>
  );
}