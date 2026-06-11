import { formatKST, type StarRow } from "@/lib/stars";

interface Props {
  stars: StarRow[];
  onPlay: (star: StarRow) => void;
  activeId: string | null;
}

export function Constellation({ stars, onPlay, activeId }: Props) {
  const W = 1000;
  const H = 600;

  const points = stars
    .map((s) => `${(s.x_position * W).toFixed(1)},${(s.y_position * H).toFixed(1)}`)
    .join(" ");

  return (
    <div className="w-full overflow-hidden rounded-lg border border-border/30 bg-black/40">
      <svg
        viewBox={`0 0 ${W} ${H}`}
        className="h-[60vh] w-full"
        preserveAspectRatio="xMidYMid meet"
      >
        {stars.length > 1 && (
          <polyline
            points={points}
            fill="none"
            stroke="rgba(252, 211, 77, 0.25)"
            strokeWidth={1}
          />
        )}
        {stars.map((s) => {
          const cx = s.x_position * W;
          const cy = s.y_position * H;
          const isActive = s.id === activeId;
          return (
            <g key={s.id} onClick={() => onPlay(s)} className="cursor-pointer">
              <circle
                cx={cx}
                cy={cy}
                r={isActive ? 16 : 12}
                fill={s.color}
                opacity={0.18}
              />
              <circle cx={cx} cy={cy} r={isActive ? 5 : 3.5} fill={s.color} />
              <title>
                {formatKST(s.created_at)} · {s.duration_seconds.toFixed(1)}s
              </title>
            </g>
          );
        })}
        {stars.length === 0 && (
          <text
            x={W / 2}
            y={H / 2}
            textAnchor="middle"
            fill="rgba(226,232,240,0.5)"
            fontSize={16}
          >
            No stars yet. Be the first to record.
          </text>
        )}
      </svg>
    </div>
  );
}