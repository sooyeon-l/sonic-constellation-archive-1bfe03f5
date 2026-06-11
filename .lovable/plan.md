# Visual + Layout Refinements (frontend only)

Frontend-only pass. Only one backend touch: bump the create-constellation validator min from 3 to 5 (max stays 7). No Max worker, storage, signed playback, or auth changes.

## 1. Min stars: 3 → 5 (max stays 7)

- `src/lib/stars.ts`, `src/lib/stars-shared.ts`: `MIN_CONSTELLATION_STARS = 5`. `MAX_CONSTELLATION_STARS` stays `7`.
- `src/routes/api/public/constellations.create.ts`: change `ids.length < 3` → `< 5`; keep `> 7`. Error message: `"star_ids must be 5–7 valid UUID strings"`.
- `src/routes/index.tsx`: helper text reads from `MIN_CONSTELLATION_STARS`/`MAX_CONSTELLATION_STARS` (already does). Re-verify all copy. Update any literal "3" string. Updated phrases:
  - Counter: `${n} star(s) in this session` + `${MIN - n} more to form a constellation`
  - `session full (max ${MAX_CONSTELLATION_STARS})`
  - If no idle hint exists, add "Create a constellation after 5 stars" near the counter when `activeStars.length === 0`.
- `src/lib/stars.ts` client-side `createConstellationFromStars` error already references the constant — confirms update.

### Safeguard — existing 3/4-star constellations stay visible

The min-5 rule applies only at **creation time** (client guard + backend validator). The fetch + render path (`fetchConstellations`, `drawConstellations`) imposes no minimum, so older 3-star constellations continue to load, click, expand, and play. No migration, no filter, no `.gte("star_count", 5)` anywhere.

## 2. Layout: preview never overlaps Create Constellation

Currently the preview panel inside `Recorder` is `absolute top-full` and the Create Constellation row sits in normal flow right beneath the recorder block → overlap.

Changes:

- `src/components/Recorder.tsx`:
  - Add `anchorRef?: React.Ref<HTMLDivElement>` prop (forwarded onto the **button frame only**, the 320×320 div). The preview panel, status slot, and Stop button are **outside** the ref'd element.
  - Convert the preview panel from `absolute left-1/2 top-full` to in-flow (`mt-3 w-full max-w-md`), so it pushes layout downward instead of floating over neighbors.
  - Keep Stop button in-flow under the status slot too (small `mt-2`); remove `absolute` positioning.
- `src/routes/index.tsx`:
  - Replace the `h-[60vh] min-h-[420px]` absolutely-centered recorder area with a vertical `flex flex-col items-center gap-6` stack:
    1. Recorder (with its in-flow preview panel)
    2. Session counter + Create Constellation + Reset row (`mt-2`)
    3. Save error
  - Pass `recorderAnchorRef` into `<Recorder anchorRef={recorderAnchorRef} />`. Drop the outer wrapper `<div ref={recorderAnchorRef}>` so the anchor measures the button frame only.

## 3. Recorder anchor measures only the button frame

- Anchor ref lives on the 320×320 button frame inside `Recorder` (item 2).
- `useEffect` in index.tsx already measures `getBoundingClientRect()` and centers — switch from `r.top + 160` to `r.top + r.height/2` since the ref now wraps the actual button square.
- Wobble center therefore stays locked to the record button regardless of preview/status changes.

## 4. p5 does not block HTML clicks

- `src/routes/index.tsx`: the canvas wrapper is currently `pointer-events-auto fixed inset-0 z-0`. Change to `pointer-events-none` on the wrapper so HTML overlays always receive clicks first.
- To preserve p5 star/constellation clicks: re-enable pointer events **only on the canvas itself** in `src/components/P5VisualLayer.tsx` by giving the container `pointer-events-none` and the inner `<canvas>` `pointer-events-auto` via a small `useEffect` that sets `canvas.style.pointerEvents = "auto"` after mount. All HTML overlay buttons (z-10) sit above the canvas in the stacking order, so their click areas naturally win.
  - Simpler equivalent: leave wrapper `pointer-events-none`; in p5 instance, after `createCanvas`, do `(p as any).canvas.style.pointerEvents = "auto"`. Buttons in z-10 layer with `pointer-events-auto` already beat it because they're higher in the DOM.

## 5. Wobble: more organic

`src/lib/p5-sketch.ts` `drawWobble`:

- Add resting deformation independent of volume: `baseDeform = (p.noise(cos*1.6+30, sin*1.6+30, nz*0.6)*2-1) * baseRadius * 0.18`.
- Three rotated layers use **distinct** noise offsets:
  - layer1 offsets `(+10, +10)`, nz·1.0
  - layer2 offsets `(+40, −15)`, nz·1.3
  - layer3 offsets `(−25, +55)`, nz·0.7
- Compute `radius1/radius2/radius3` separately (each = `baseRadius + baseDeform_i + waveDeform_i`).
- Raise wave coupling so loud audio visibly warps shape: `wavePower = smoothed * 600` and add lower-freq harmonic weighted by smoothed volume.

## 6. Stars not snapped to the wobble ring

- `src/lib/stars.ts` `radialPositionFromVolume`: shift band away from ring. `radialDistance = 0.22 + normVol * 0.28` (range 0.22–0.50). Clamp x/y to `0.08..0.92`.
- p5 drawing math unchanged — still reads saved `x_position`/`y_position` as offsets from recorder anchor, scaled by `min(width, height)`. No coupling to wobble radius.

### Safeguard — small screens / mobile

- `computeActiveStarPos` in `p5-sketch.ts`: after computing `tX/tY`, clamp to a visible margin: `tX = constrain(tX, margin, p.width - margin)` and same for Y, where `margin = min(p.width, p.height) * 0.08`. This preserves the volume→distance ordering (louder still further within available room) but never lets a star fall off-screen on narrow viewports.

## 7. Contemplation: bigger, brighter, centered

`src/lib/p5-sketch.ts`:

- `ensureConstellation`: `cx = (0.25 + seed*0.50)*width`, `cy = (0.28 + seed2*0.44)*height` (central band).
- `getConstellationDrawInfo`: `baseScale = min(w,h) * 0.22`, `expandedScale = min(w,h) * 0.55`.
- `drawConstellations`:
  - `strokeWeight(isSelected ? 1.8 : 1.2)`; stroke alpha `isSelected ? 90 : 55`.
  - halo `isSelected ? 32 : 20`, core `isSelected ? 9 : 5`.
  - When some cluster is selected and `v.id !== selectedId`, multiply alphas by `0.35` (subtle but still visible).
  - Drift bounds use `pad = min(w,h)*0.18`.
- `hitTestConstellation`: cluster hit radius `Math.max(60, scale * 0.9)`.

## 8. Top clipping fix

`src/routes/index.tsx`:

- Outer wrapper: `min-h-screen overflow-hidden` → `min-h-dvh` (drop `overflow-hidden`; canvas is `fixed inset-0` so layout overflow is already contained).
- Header padding: `py-8` → `pt-[max(2.5rem,env(safe-area-inset-top))] pb-12`.
- Confirm overlay `z-10` sits above `z-0` canvas (unchanged).

## 9. Out of scope (unchanged)

- Recording capture, blob upload, Supabase Storage, signed-URL flow.
- Max worker endpoints (`mark-ready`, `mark-failed`, `mark-synthesizing`, `synth-audio`, `pending`).
- Auth, route tree, env, build config.
- p5 owns no controls or upload logic.

## Files to edit

- `src/lib/stars.ts` (MIN=5, radial band 0.22–0.50)
- `src/lib/stars-shared.ts` (MIN=5)
- `src/routes/api/public/constellations.create.ts` (validator < 5 + message)
- `src/lib/p5-sketch.ts` (wobble layers, constellation scale/colors, visible-clamp for active stars, canvas pointer-events)
- `src/components/Recorder.tsx` (anchorRef on button frame, in-flow preview/Stop)
- `src/components/P5VisualLayer.tsx` (wrapper `pointer-events-none`)
- `src/routes/index.tsx` (vertical Input layout, wrapper height/overflow/padding, anchor wiring, copy)
