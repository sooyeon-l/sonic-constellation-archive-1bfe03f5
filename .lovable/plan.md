# Fix the wobble to look organic, not circular

## Root cause

`src/components/WaveformCanvas.tsx` uses a `pseudoNoise(x, y, t)` that is just a sum of three sines of `theta`. Because every input is a smooth periodic function of `theta`, the resulting radius offset is almost the same all the way around the ring — it reads as a perfect circle that breathes uniformly. The p5 reference uses true 2D Perlin noise sampled at `(cos θ * 0.8 + 10, sin θ * 0.8 + 10, frameCount * 0.008)`, which gives a different value at every angle and produces the uneven, hand‑drawn strands. The wobble multiplier is also too small (`* 0.6` vs `* 5` in p5), so even with louder mic input the ring stays nearly round.

## Change (single file: `src/components/WaveformCanvas.tsx`)

1. Replace `pseudoNoise` with a lightweight 3D value‑noise function:
   - Hash-based gradient at integer lattice points (`x, y, z` integers → pseudo-random in `[0,1]`).
   - Trilinear interpolation with smoothstep `f(t) = t*t*(3-2*t)`.
   - Remap output from `[0,1] → [-1,1]` to match the p5 `map(noise, 0,1,-1,1)`.
   - Pure JS, no deps, ~40 lines, deterministic.

2. Sample noise exactly like the prototype:
   ```ts
   const nx = Math.cos(theta) * 0.8 + 10;
   const ny = Math.sin(theta) * 0.8 + 10;
   const nz = frame * 0.008;          // frame counter incremented per RAF
   const n  = noise3(nx, ny, nz) * 2 - 1;
   ```
   Using `cos/sin * 0.8 + 10` (not `theta` itself) is what gives neighboring points uncorrelated noise values and creates the irregular look.

3. Match the p5 wobble math:
   - `smoothed = smoothed * 0.92 + max(0, level - 0.001) * 0.08` (unchanged).
   - `wavePower = smoothed * 300`.
   - `wobble = n * wavePower * 5` (was `* 0.6`).
   - `radius = baseRadius + wobble`.
   - Idle baseline: add a tiny `idleEnergy ≈ 0.002` so the ring is still organic when silent but not flat-circle.

4. Keep the three rotated copies at `theta`, `theta + PI`, `theta + 1.5·PI`, 1.5px dots, ~350 points, hue ramp 170→250, soft outer glow. Still respects existing canvas size and DPR.

5. Continue publishing the smoothed level into `MicLevelContext` (unchanged) so `StarField` still reacts.

6. Honor `prefers-reduced-motion`: when set, freeze `frame` and use `wavePower = 0` so we render a single static, slightly-irregular ring.

## Out of scope

No changes to `Recorder`, `MicLevelProvider`, `StarField`, `ActiveSession`, `ConstellationArchive`, `ContemplationScene`, routes, server functions, Supabase schema, or the surrounding buttons/layout. This is a presentation-only fix inside `WaveformCanvas.tsx`.

## Verification

- Visual: at idle, ring shows small irregular bumps (not a perfect circle). While speaking, strands push outward unevenly and the three rotated layers create overlapping hand-drawn arcs, matching the p5 screenshot.
- No new deps, no new files, build stays green.
