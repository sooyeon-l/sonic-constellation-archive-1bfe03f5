# Fix: HTML overlay clicks shouldn't dismiss selected constellation

## Root cause
p5's `mousePressed` is bound at the window level, so it fires for every click in the viewport — including clicks on HTML overlays layered above the canvas. `stopPropagation` on the HTML side does not stop p5's listener because p5 attaches in the capture phase / on `window`. When the user clicks "Play Synthesized Constellation", the HTML button runs `playSynth`, then p5's `mousePressed` also runs, sees no hit, and calls `onConstellationClick(null)` — dismissing the panel.

## Fix (frontend only)

### 1. `src/lib/p5-sketch.ts` — ignore clicks over HTML overlays
At the top of `p.mousePressed`, inspect the underlying DOM event and bail if the real event target is inside an opt-in overlay:

```ts
p.mousePressed = (event?: MouseEvent | PointerEvent) => {
  const target = (event?.target as HTMLElement | null) ?? null;
  if (target && target.closest('[data-html-overlay="true"]')) return;
  // ...existing logic
};
```

No other p5 logic changes.

### 2. `src/routes/index.tsx` — mark the selected-constellation panel as an overlay and stop propagation
On the `selectedConstellation` panel `<div>` at line 350:
- add `data-html-overlay="true"`
- add `onPointerDown={(e) => e.stopPropagation()}` and `onClick={(e) => e.stopPropagation()}`

On the Close button (line 376) and Play Synthesized Constellation button (line 387):
- add `onPointerDown={(e) => e.stopPropagation()}`
- wrap existing `onClick` to call `e.stopPropagation()` before `setSelectedConstellationId(null)` / `playSynth(selectedConstellation)`

Optionally mark the MaxDataPanel wrapper (line 409) with `data-html-overlay="true"` for the same protection.

## Behavior after fix
- Click Play Synthesized → audio plays, panel stays open.
- Click Close → panel closes (p5 ignores because target is inside overlay).
- Click empty canvas → p5 dismisses selection as before.
- Click a different constellation cluster → p5 selects it as before.

## Out of scope
No backend, Supabase, Max worker, signed playback, or p5 drawing/hit-test changes.

## Files
- `src/lib/p5-sketch.ts`
- `src/routes/index.tsx`
