
## Goal

Keep all existing controls, layout, recording flow, Supabase backend, server routes, and Max-worker architecture intact. Only upgrade the visual/animation layer to match the p5 prototype's feel: mic-reactive wobble, drifting background stars, star "fly out from center" creation, volume-based radial placement, hovering stars, animated constellation formation, and drifting/expanding constellations in Contemplation Mode.

No new networking, no localhost sockets, no local Node server, no p5 dependency. All visuals will be rendered with the canvas/SVG components we already use.

---

## 1. Background star field (new)

New component `src/components/StarField.tsx` rendered once inside the page background (behind the tabs/cards on `/`).

- Full-viewport `<canvas>` fixed behind content, dark transparent bg, `pointer-events-none`.
- ~180 "BgStar" particles with random position, brightness, twinkle phase, slow drift.
- Optional `volume` prop (0–1). When > 0, stars pulse slightly brighter/larger — wired from the recorder's live mic level via a lightweight context so we don't restructure props.
- Respects `prefers-reduced-motion` (static field, no twinkle).

## 2. Mic-reactive wobble around the recorder

Replace the current circular waveform in `src/components/WaveformCanvas.tsx` (or add a sibling) with the p5 wobble:

- Use the same `AnalyserNode` Recorder already provides — no new audio plumbing.
- Smoothing identical to the prototype: `smoothed = smoothed*0.92 + max(0, vol - 0.001)*0.08`, `wavePower = smoothed * 300`.
- Render a perlin-noise wobble ring using `circleDiv ≈ 350` points, three rotational copies (theta, theta+PI, theta+1.5PI), 1.5px dots, hue ramp 170→250 like the sketch.
- Always animates (idle = subtle), gets stronger while recording.
- Keep the current record button — wobble is purely behind/around it.

Expose the live volume value (the same smoothed level) up to the page via a small `MicLevelContext` so `StarField` can react to it too. No change to `Recorder` props/API.

## 3. Volume-based star placement

In `src/lib/stars.ts → uploadAndInsertStar`, replace the current `randomPosition()` with the p5 radial rule:

```ts
const expectedMaxVolume = 0.35; // tuned to browser mic RMS
const normVol = clamp((meta.volumeAverage ?? 0) / expectedMaxVolume, 0, 1);
const radialDistance = 0.12 + normVol * 0.30;       // 0.12 .. 0.42
const angle = Math.random() * Math.PI * 2;
const x_position = clamp(0.5 + Math.cos(angle) * radialDistance, 0.05, 0.95);
const y_position = clamp(0.5 + Math.sin(angle) * radialDistance, 0.05, 0.95);
```

Continue storing normalized `x_position`/`y_position`. Add two optional columns to `public.stars` so we can persist the polar form too:

- `radial_distance numeric` (nullable)
- `angle numeric` (nullable)

Migration also updates the existing `anyone can insert stars` RLS check to allow these new fields (no-op constraints). `volume_average` and `volume_peak` are already stored. No change to server routes, no change to grants beyond what already exists.

If you'd rather skip the schema change, we can drop `radial_distance`/`angle` and keep only x/y — say the word.

## 4. Star creation & hover animation

Upgrade `src/components/ActiveSession.tsx`:

- New stars spawn at canvas center, then lerp to their `x_position * w, y_position * h` over ~900 ms with ease-out (already partially there — extend with per-star animation state).
- After arrival, each star gets a small per-id sinusoidal "hover" offset (a few px, slow phase) like `Star.hovering()` in the sketch — animated via `requestAnimationFrame`, not CSS, so we can drive many stars cheaply.
- Click still calls `onPlay(star)` exactly as today; existing Supabase audio playback unchanged.

## 5. Constellation formation animation

When the user clicks the existing **Create Constellation** button:

- Before navigating to Contemplation, animate the current active stars: draw connecting lines that fade/grow in sequence (stroke-dasharray reveal) and pulse each star briefly.
- ~800 ms transition, then call the existing `createConstellationFromStars` server route as today and switch tab to `observe`.
- Pure presentation — no backend change.

## 6. Contemplation Mode: drifting + expanding constellations

Rebuild `ConstellationArchive` grid into a single canvas/SVG scene (kept inside the same tab, no nav change):

- Each saved constellation is rendered as a small star-cluster with connecting lines, placed at a deterministic position derived from its id, drifting slowly (sin/cos offsets per cluster, like the prototype's `Constellation.update()`).
- Click a cluster → animate it expanding toward viewport center, dim the others, show its title/question prompt.
- Click outside → animate it shrinking back to its drift position.
- Inside an expanded constellation: clicking individual stars still calls `onPlay(star)` (existing Supabase audio).
- Status badge (`pending_synthesis` / `synthesizing` / `ready` / `failed`) and the **Play Synthesized Constellation** button stay as-is, shown when a constellation is expanded.
- The existing list/grid behavior is replaced by this scene; if you want to keep the grid as a fallback, we can add a small toggle — otherwise the canvas scene becomes the only Contemplation view.

## 7. Out of scope (explicitly unchanged)

- Recorder controls, Tabs, Create Constellation button, Reset session button, header copy, MaxDataPanel debug toggle.
- All server routes under `src/routes/api/public/*` and `src/lib/max-api.server.ts`.
- Supabase auth model, RLS for stars insert/select, storage bucket, signed-URL playback path.
- Max worker polling, mark-ready/mark-failed/mark-synthesizing endpoints, synth-audio signed URL flow.

---

## Technical notes (for the implementation pass)

- New files: `src/components/StarField.tsx`, `src/components/WobbleRing.tsx` (or replace `WaveformCanvas`), `src/lib/mic-level-context.tsx`, `src/components/ContemplationScene.tsx`.
- Edited files: `src/components/Recorder.tsx` (publish smoothed level into context), `src/components/ActiveSession.tsx` (hover anim + creation lerp), `src/components/ConstellationArchive.tsx` (delegate to ContemplationScene; keep expanded panel chrome), `src/routes/index.tsx` (mount StarField + MicLevelProvider), `src/lib/stars.ts` (radial placement, types).
- One migration adding nullable `radial_distance` and `angle` to `public.stars` and refreshing the existing insert policy's CHECK to permit them. Grants already cover `authenticated` / `anon` from the existing policy set; no new grants needed.
- All animation uses `requestAnimationFrame` and respects `prefers-reduced-motion` (degrades to static).
- No p5, no Web Audio changes beyond reading the existing AnalyserNode.

Confirm and I'll build it.
