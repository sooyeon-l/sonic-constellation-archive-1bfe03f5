## Refine hover glow — outline-only, barely-there

Replace the two big radial ellipses behind hovered constellations with a soft halo that traces the constellation's line/star shape.

### `src/lib/p5-sketch.ts` — `drawConstellations`

Remove the current hover halo block:
```ts
if (isHovered) {
  p.push();
  p.noStroke();
  p.fill(45, 60, 100, 12 + pulse * 10);
  p.ellipse(cx, cy, scale * 3.6);
  p.fill(45, 70, 100, 18 + pulse * 14);
  p.ellipse(cx, cy, scale * 2.4);
  p.pop();
}
```

Replace with an outline-tracing glow drawn just before the normal polyline + stars:

- If `isHovered`:
  - Pulse stays subtle: `const pulse = 0.5 + 0.5 * Math.sin(p.frameCount * 0.03);`
  - Draw 2 stroked passes of the same polyline path (re-using `v.starOffsets`) with wide, low-alpha strokes to create a soft outline bloom:
    - Pass A: `stroke(45, 50, 100, 10 + pulse * 8)`, `strokeWeight(10)`, `p.drawingContext.lineCap = 'round'; lineJoin = 'round'`.
    - Pass B: `stroke(45, 70, 100, 18 + pulse * 10)`, `strokeWeight(5)`.
  - Draw a tiny per-star halo (one ellipse per star) at `scale * 0.55` diameter with `fill(45, 70, 100, 14 + pulse * 10)` — small, just enough to bloom the stars themselves.
  - No centroid ellipse, no `scale * 2.4 / 3.6` circles.

Then existing crisp polyline + star rendering runs on top unchanged (still gets the small `hoverBoost` brightness bump). Tone the existing `hoverBoost` down from `15` to `8` so brightness change is barely perceptible — the new outline glow does the heavy lifting.

Selected state still skips the glow.

### `src/routes/index.tsx`
No changes — tooltip stays as-is.

### Out of scope
Backend, Supabase, Max worker, signed playback, p5 drawing structure for non-hovered constellations, recorder/input mode, click/hover hit-test logic.
