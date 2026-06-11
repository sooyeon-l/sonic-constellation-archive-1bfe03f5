# Fix yellow box, forming state, layout, and constellation behavior

## 1. Remove the yellow rectangular frame (Input Mode)
In `src/routes/index.tsx`, the Input Mode wrapper currently adds
`ring-2 ring-amber-200/60 shadow-[0_0_60px_rgba(252,211,77,0.35)] rounded-lg`
when `forming` is true. This is the gold rectangle the user is seeing.

- Drop the ring/shadow entirely. Replace the conditional class with a subtle
  text/opacity cue only (e.g. brief "Forming…" label on the button itself —
  already shown). No border, no outline, no ring, no shadow on the wrapper.
- Audit Recorder.tsx and P5VisualLayer wrapper for any `border`, `ring`,
  `outline`, `shadow` — leave only the small button borders/buttons.

## 2. Fix accidental "Forming…" state
`forming` is only flipped inside `createConstellation`, but the artificial
`await new Promise(r => setTimeout(r, 800))` keeps the button stuck in
"Forming…" even though no real work is in flight, and any thrown error
already resets it via `finally`. Confirm:

- Remove the artificial 800ms delay (or drop it to 0). Set `forming=true`
  only inside the click handler, immediately before the network call, and
  always reset in `finally`.
- Ensure `forming` is not set anywhere else (search the file). Recording,
  preview, submit must not touch `forming`.
- The button label logic stays: Forming → Saving → "Create Constellation".

## 3. Tighten Input Mode spacing
The stack is already vertical, but text and active stars crowd the recorder.
In `src/routes/index.tsx` and `Recorder.tsx`:

- Increase gap between recorder block and the status/counter/button row
  (`gap-6` → `gap-8`) and add `mt-2` on the counter paragraph.
- Keep the existing `min-h-[2.5rem]` status slot in `Recorder` so the
  "A star has been created" line never reflows the layout.
- Active stars: keep current radial placement (0.22–0.50 of min dim) — text
  sits below the 320×320 anchor, which is outside that band. No change to
  star math needed, only the wrapper gap.

## 4. Rewrite Contemplation Mode constellations
Currently each constellation uses raw `x_position - 0.5, y_position - 0.5`
offsets scaled by `minDim * 0.22`. Older stars span the full 0..1 grid,
newer stars sit in a tight 0.22–0.50 ring around 0.5 — both give arbitrary
spreads and the result looks like random graph clusters.

Rewrite `ensureConstellation` and `getConstellationDrawInfo` in
`src/lib/p5-sketch.ts` so each constellation is a unified, centroid-
normalized shape that preserves its relative layout:

- On creation, compute the centroid of `(x_position, y_position)` and store
  per-star offsets `(dx, dy) = (x - cxBar, y - cyBar)`.
- Compute the constellation's intrinsic radius
  `r = max(sqrt(dx² + dy²))` (fallback to a small epsilon).
- Store offsets as **normalized** vectors `(dx/r, dy/r)` so every
  constellation has a consistent unit footprint regardless of original spread.
- Collapsed scale: `minDim * 0.10` (radius ~10% of screen short edge → ~20%
  diameter — big enough to read, not edge-hugging).
- Expanded scale: `minDim * 0.32` (radius → ~64% diameter, clearly clickable).
- Place clusters in a center-biased band (keep current 0.25–0.75 of
  width/height for `cx`, `cy`), but clamp drift bounds with
  `pad = minDim * 0.18 + collapsedScale` so the whole group stays visible.

### Drawing
- Draw a closed polyline through the **same star order** as input session
  (the saved star order is preserved server-side). This gives each
  constellation a stable, deterministic shape that matches the p5 sketch.
- Selected: stroke alpha 95, weight 1.8, star halo 36 / core 10.
- Non-selected when one selected: alpha × 0.3, dim halo.
- Idle (none selected): alpha × 1.0.

### Drift + expand
- Idle: each constellation drifts as a single group via `cx += vx`,
  `cy += vy`, bouncing inside the padded bounds. Already done — keep.
- Selected: lerp `cx, cy` toward screen center (factor 0.85) and lerp
  `scale` from collapsed → expanded with `expansion += (target - expansion) * 0.08`.
- Clicking outside clears selection (already wired through
  `onConstellationClick(null)`); shrink/recenter happens naturally via the
  same lerp.

### Click behavior
- Hit test on cluster bounding circle (`scale * 1.1`) for collapsed
  selection.
- When already expanded, hit-test individual stars first and forward
  `onStarClick(starId)` for playback. Empty space inside the expanded
  cluster does NOT trigger synthesized playback. (No change to React: the
  "Play Synthesized Constellation" button stays in the HTML overlay.)

## 5. Out of scope
No backend, Supabase, Max worker, signed-URL playback, auth, server
routes, env, or build config changes. No changes to recorder upload logic,
star insertion, or constellation creation API.

## Files to edit
- `src/routes/index.tsx` — remove ring/shadow wrapper, drop the 800ms
  delay, bump gap to 8.
- `src/lib/p5-sketch.ts` — rewrite constellation offsets (centroid +
  normalized radius), scales, drift bounds, and hit radius.
- `src/components/Recorder.tsx` — no functional change unless the audit
  finds a stray ring/border; verify only.
