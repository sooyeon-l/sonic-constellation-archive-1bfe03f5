# Constellation hover UX (Contemplation Mode)

Frontend-only enhancement to the p5 visual layer + a small React tooltip overlay. No backend, Supabase, Max, or synthesis changes.

## 1. p5 sketch — `src/lib/p5-sketch.ts`

### New props
Extend `SketchProps`:
- `onHoverChange?: (hover: { id: string; x: number; y: number } | null) => void`

Existing props (`onConstellationClick`, etc.) unchanged.

### Shared hit-test helper
Extract a single `pickConstellation(mx, my)` used by both `mouseMoved` and `mousePressed`. Logic:
- Iterate `constellationMap` values.
- For each, compute `{ cx, cy, scale }` via the existing `getConstellationDrawInfo`.
- Compute the forgiving hit radius:
  - `clusterRadius = scale * 1.15` (bounding-circle around centroid).
  - Also test distance to each star (`scale * 0.18` per-star halo) so sparse clusters stay easy to grab.
- A constellation is a candidate if `dist(mx, my, cx, cy) <= clusterRadius` OR `dist(mx, my, starX, starY) <= scale * 0.18`.
- Among candidates, pick the one with the smallest distance to its centroid → resolves overlaps deterministically.
- Returns `{ id, cx, cy } | null`.

`hitTestConstellation` is replaced by this helper so hover and click never disagree. The expanded-selection star hit-test (for playing individual stars) stays as-is and runs before `pickConstellation` in the click path.

### Hover state + glow
- Add `let hoveredId: string | null = null;` inside the sketch closure.
- `p.mouseMoved = (event) => { ... }`:
  - Same overlay bail-out as `mousePressed` (`data-html-overlay="true"` → clear hover and return).
  - If mouse is outside canvas bounds → clear hover.
  - Otherwise call `pickConstellation`; if id changed, update `hoveredId`, set `canvasEl.style.cursor = hit ? 'pointer' : 'default'`, and call `props.onHoverChange?.(hit ? { id, x: mouseX, y: mouseY } : null)`.
- Also call `onHoverChange(null)` from `mouseOut` / when canvas loses pointer.

### Glow rendering
In `drawConstellations`, before drawing the existing polyline/stars for each `v`, if `v.id === hoveredId && v.id !== selectedId`:
- Compute pulse: `const pulse = 0.5 + 0.5 * Math.sin(p.frameCount * 0.03);`
- `p.noStroke();` then layered soft radial fills using HSB alpha:
  - outer halo: `fill(45, 60, 100, 12 + pulse * 10)`, `ellipse(cx, cy, scale * 3.6)`
  - mid halo:   `fill(45, 70, 100, 18 + pulse * 14)`, `ellipse(cx, cy, scale * 2.4)`
- Then slightly brighten the lines/stars for the hovered cluster: bump the existing `isSelected ? 95 : 60` line alpha and star halo alpha by ~15 when hovered (small multiplier; no border, no box).

When `selectedId === v.id` we keep the existing selected styling and skip the hover glow (selection already conveys focus).

### Selected-state hover
While a constellation is expanded, hovering elsewhere should still preview a different cluster; the existing click behavior already dismisses on empty-space click and selects on cluster click, both of which now share `pickConstellation`.

## 2. React tooltip — `src/routes/index.tsx`

### State
```ts
const [hoverInfo, setHoverInfo] = useState<{ id: string; x: number; y: number } | null>(null);
```

Only used in `tab === "observe"`. Wire `onHoverChange={setHoverInfo}` on `<P5VisualLayer>`. Clear on tab change in the existing tab `useEffect`.

### Lookup + KST formatter
```ts
const KST = new Intl.DateTimeFormat("en-US", {
  timeZone: "Asia/Seoul",
  year: "numeric", month: "short", day: "numeric",
  hour: "numeric", minute: "2-digit", hour12: true,
});
const formatKST = (iso: string) => `${KST.format(new Date(iso))} KST`;
```

`const hovered = useMemo(() => hoverInfo ? archive.find(c => c.id === hoverInfo.id) ?? null : null, [hoverInfo, archive]);`

### Tooltip element
Render only when `tab === "observe" && hovered && hovered.id !== selectedConstellationId`:

```tsx
<div
  data-html-overlay="true"
  className="pointer-events-none fixed z-30 -translate-x-1/2 rounded-md border border-amber-200/25 bg-zinc-950/85 px-3 py-2 text-xs text-amber-100 shadow-xl backdrop-blur"
  style={{ left: hoverInfo!.x, top: hoverInfo!.y - 14, transform: "translate(-50%, -100%)" }}
>
  <p className="font-medium truncate max-w-[16rem]">
    {hovered.title || hovered.question_text}
  </p>
  <p className="mt-0.5 text-[10px] text-zinc-400">{formatKST(hovered.created_at)}</p>
  <p className="mt-0.5 text-[10px] uppercase tracking-wider text-amber-200/80">
    {STATUS_LABELS[hovered.status]}
  </p>
</div>
```

`pointer-events-none` ensures the tooltip can never intercept a click or dismiss the constellation. `data-html-overlay="true"` is defensive but not strictly required since pointer events are off.

Clamp `left`/`top` to viewport (`Math.max(12, Math.min(window.innerWidth - 12, x))`) so the tooltip doesn't clip on edges.

## 3. Behavior summary

- Mouse over a cluster → cursor becomes pointer, soft pulsing glow appears around the cluster (no rectangle), tooltip shows title + KST timestamp + status.
- Click while hovered → selects exactly that cluster (same `pickConstellation` for hover and click).
- Click empty space → dismisses selection as before.
- Selected cluster → hover glow suppressed for that one (selection already styled); hovering other clusters still previews them.
- Old (3-star) and new (5–7 star) constellations work identically — hit area uses the existing normalized offsets.
- Reduced motion: pulse still runs (very subtle); not gated, since it never moves layout.

## Out of scope
Backend, Supabase, Max worker, signed playback, auth/storage, p5 drawing structure for non-hovered constellations, recorder/input mode.

## Files
- `src/lib/p5-sketch.ts`
- `src/routes/index.tsx`
