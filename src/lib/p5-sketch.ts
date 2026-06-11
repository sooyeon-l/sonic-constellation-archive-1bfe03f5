import type p5 from "p5";
import type { ConstellationWithStars, StarRow } from "./stars";

export interface SketchProps {
  mode: "input" | "observe";
  isRecording: boolean;
  liveVolume: number; // 0..1
  activeStars: StarRow[];
  constellations: ConstellationWithStars[];
  selectedConstellationId: string | null;
  /** Recorder anchor center in CSS px (input mode only). */
  centerX?: number | null;
  centerY?: number | null;
  onStarClick?: (starId: string) => void;
  onConstellationClick?: (id: string | null) => void;
  onHoverChange?: (hover: { id: string; x: number; y: number } | null) => void;
  reducedMotion?: boolean;
}


type GetProps = () => SketchProps;

function hash01(s: string) {
  let h = 2166136261;
  for (let i = 0; i < s.length; i++) {
    h ^= s.charCodeAt(i);
    h = Math.imul(h, 16777619);
  }
  return ((h >>> 0) % 100000) / 100000;
}

const SPAWN_MS = 900;
const easeOutCubic = (t: number) => 1 - Math.pow(1 - t, 3);

interface BgStar {
  x: number;
  y: number;
  baseSize: number;
  twinkleOffset: number;
  vx: number;
  vy: number;
}

interface ActiveStarVis {
  id: string;
  spawnTs: number;
  tx: number; // normalized target
  ty: number;
  color: string;
  phaseX: number;
  phaseY: number;
  hoverAmp: number;
}

interface ConstellationVis {
  id: string;
  cx: number;
  cy: number;
  vx: number;
  vy: number;
  expansion: number;
  starOffsets: Array<{ id: string; dx: number; dy: number; color: string }>;
}

export function createSketch(getProps: GetProps) {
  return (p: p5) => {
    let bgStars: BgStar[] = [];
    let smoothed = 0;
    const circleDiv = 350;
    const activeStarMap = new Map<string, ActiveStarVis>();
    const constellationMap = new Map<string, ConstellationVis>();
    let hoveredId: string | null = null;
    let canvasEl: HTMLCanvasElement | null = null;

    function rebuildBgStars() {
      bgStars = [];
      const count = 180;
      for (let i = 0; i < count; i++) {
        bgStars.push({
          x: p.random(p.width),
          y: p.random(p.height),
          baseSize: p.random(0.6, 2.2),
          twinkleOffset: p.random(0, 1000),
          vx: p.random(-0.05, 0.05),
          vy: p.random(-0.05, 0.05),
        });
      }
    }

    function ensureConstellation(c: ConstellationWithStars) {
      const existing = constellationMap.get(c.id);
      if (existing && existing.starOffsets.length === c.stars.length) {
        return existing;
      }
      // Centroid-normalize the stars' saved positions so the constellation
      // is a unified, scale-invariant shape — preserves relative layout
      // but every cluster has a consistent unit footprint.
      const n = Math.max(1, c.stars.length);
      const meanX = c.stars.reduce((a, s) => a + s.x_position, 0) / n;
      const meanY = c.stars.reduce((a, s) => a + s.y_position, 0) / n;
      let maxR = 0;
      for (const s of c.stars) {
        const dx = s.x_position - meanX;
        const dy = s.y_position - meanY;
        const r = Math.sqrt(dx * dx + dy * dy);
        if (r > maxR) maxR = r;
      }
      const norm = Math.max(maxR, 0.0001);
      const offsets = c.stars.map((s) => ({
        id: s.id,
        dx: (s.x_position - meanX) / norm,
        dy: (s.y_position - meanY) / norm,
        color: s.color,
      }));
      if (existing) {
        existing.starOffsets = offsets;
        return existing;
      }
      const seed = hash01(c.id);
      const seed2 = hash01(c.id + "y");
      const vis: ConstellationVis = {
        id: c.id,
        cx: (0.2 + seed * 0.6) * p.width,
        cy: (0.22 + seed2 * 0.56) * p.height,
        vx: (seed - 0.5) * 0.2,
        vy: (seed2 - 0.5) * 0.2,
        expansion: 0,
        starOffsets: offsets,
      };
      constellationMap.set(c.id, vis);
      return vis;
    }

    function reconcileActiveStars(stars: StarRow[]) {
      const now = p.millis();
      const ids = new Set(stars.map((s) => s.id));
      for (const id of Array.from(activeStarMap.keys())) {
        if (!ids.has(id)) activeStarMap.delete(id);
      }
      for (const s of stars) {
        if (!activeStarMap.has(s.id)) {
          const seed = hash01(s.id);
          activeStarMap.set(s.id, {
            id: s.id,
            spawnTs: now,
            tx: s.x_position,
            ty: s.y_position,
            color: s.color,
            phaseX: seed * Math.PI * 2,
            phaseY: (1 - seed) * Math.PI * 2,
            hoverAmp: 2 + seed * 3,
          });
        }
      }
    }

    function reconcileConstellations(list: ConstellationWithStars[]) {
      const ids = new Set(list.map((c) => c.id));
      for (const id of Array.from(constellationMap.keys())) {
        if (!ids.has(id)) constellationMap.delete(id);
      }
      for (const c of list) ensureConstellation(c);
    }

    function drawBgStars(vol: number) {
      const reduced = getProps().reducedMotion;
      for (const bs of bgStars) {
        if (!reduced) {
          bs.x += bs.vx;
          bs.y += bs.vy;
          if (bs.x < 0) bs.x += p.width;
          if (bs.x > p.width) bs.x -= p.width;
          if (bs.y < 0) bs.y += p.height;
          if (bs.y > p.height) bs.y -= p.height;
        }
        const tw =
          0.6 +
          0.4 * Math.sin(p.frameCount * 0.02 + bs.twinkleOffset) +
          vol * 1.5;
        const size = bs.baseSize * (0.9 + Math.min(1, tw) * 0.6);
        p.noStroke();
        p.fill(0, 0, 100, 40 + Math.min(40, vol * 200));
        p.ellipse(bs.x, bs.y, size);
      }
    }

    function getInputCenter() {
      const props = getProps();
      const cx =
        typeof props.centerX === "number" && Number.isFinite(props.centerX)
          ? props.centerX
          : p.width / 2;
      const cy =
        typeof props.centerY === "number" && Number.isFinite(props.centerY)
          ? props.centerY
          : p.height / 2;
      return { cx, cy };
    }

    function drawWobble(vol: number) {
      const reduced = getProps().reducedMotion;
      const threshold = 0.001;
      const audioEnergy = Math.max(0, vol - threshold);
      smoothed = smoothed * 0.92 + audioEnergy * 0.08;
      const wavePower = reduced ? 0 : smoothed * 600;
      const baseRadius = Math.min(p.width, p.height) / 6;
      const { cx, cy } = getInputCenter();
      const nz = reduced ? 0 : p.frameCount * 0.008;

      // Three rotated layers, each with its own noise offsets and freq so
      // they don't trace the same shape — yields the organic look.
      const layers: Array<{
        rot: number;
        ox: number;
        oy: number;
        nzMul: number;
      }> = [
        { rot: 0, ox: 10, oy: 10, nzMul: 1.0 },
        { rot: Math.PI, ox: 40, oy: -15, nzMul: 1.3 },
        { rot: Math.PI * 1.5, ox: -25, oy: 55, nzMul: 0.7 },
      ];

      p.noStroke();
      for (let i = 0; i < circleDiv; i++) {
        const theta = (i * Math.PI * 2) / circleDiv;
        p.fill(p.map(theta, 0, Math.PI * 2, 170, 250), 25, 100, 75);

        for (const L of layers) {
          const a = theta + L.rot;
          const cs = Math.cos(a);
          const sn = Math.sin(a);
          // resting deformation — independent of volume so quiet state is
          // still irregular
          const rest =
            (p.noise(cs * 1.6 + L.ox + 30, sn * 1.6 + L.oy + 30, nz * 0.6 * L.nzMul) *
              2 -
              1) *
            baseRadius *
            0.18;
          // high-freq audio-driven wobble
          const hi =
            p.map(
              p.noise(cs * 0.8 + L.ox, sn * 0.8 + L.oy, nz * L.nzMul),
              0,
              1,
              -1,
              1,
            ) * wavePower * 5;
          // low-freq harmonic, also audio-driven — deforms overall silhouette
          const lo =
            p.map(
              p.noise(cs * 0.3 + L.ox * 0.5, sn * 0.3 + L.oy * 0.5, nz * 0.4 * L.nzMul),
              0,
              1,
              -1,
              1,
            ) *
            wavePower *
            2;
          const radius = baseRadius + rest + hi + lo;
          const x = cx + radius * cs;
          const y = cy + radius * sn;
          p.ellipse(x, y, 1.5);
        }
      }
    }

    function computeActiveStarPos(a: ActiveStarVis) {
      const now = p.millis();
      const { cx, cy } = getInputCenter();
      // Saved coords are normalized offsets around 0.5 — render them as
      // offsets from the recorder anchor, scaled by the canvas short edge.
      const scale = Math.min(p.width, p.height);
      let tX = cx + (a.tx - 0.5) * scale;
      let tY = cy + (a.ty - 0.5) * scale;
      // Mobile/small-screen safeguard: clamp inside a visible margin so a
      // loud recording can't push a star off-screen. Preserves the
      // volume-distance ordering within available room.
      const margin = Math.min(p.width, p.height) * 0.08;
      tX = Math.min(p.width - margin, Math.max(margin, tX));
      tY = Math.min(p.height - margin, Math.max(margin, tY));
      const t = Math.min(1, (now - a.spawnTs) / SPAWN_MS);
      const e = easeOutCubic(t);
      let x = cx + (tX - cx) * e;
      let y = cy + (tY - cy) * e;
      if (t >= 1 && !getProps().reducedMotion) {
        const ts = now * 0.001;
        x += Math.sin(ts * 0.8 + a.phaseX) * a.hoverAmp;
        y += Math.cos(ts * 0.7 + a.phaseY) * a.hoverAmp;
      }
      return { x, y, e };
    }

    function drawActiveStars() {
      // No connecting lines in input mode — stars are independent dots
      // until the user explicitly creates a constellation.
      for (const a of activeStarMap.values()) {
        const { x, y, e } = computeActiveStarPos(a);
        const halo = p.color(a.color);
        halo.setAlpha(40 + e * 60);
        p.noStroke();
        p.fill(halo);
        p.ellipse(x, y, 22);
        const core = p.color(a.color);
        core.setAlpha(240);
        p.fill(core);
        p.ellipse(x, y, 6);
      }
    }


    function getConstellationDrawInfo(v: ConstellationVis) {
      const target = getProps().selectedConstellationId === v.id ? 1 : 0;
      v.expansion += (target - v.expansion) * 0.08;
      const minDim = Math.min(p.width, p.height);
      const baseScale = minDim * 0.10;
      const expandedScale = minDim * 0.32;
      const scale = p.lerp(baseScale, expandedScale, v.expansion);
      const tcx = p.width / 2;
      const tcy = p.height / 2;
      const cx = p.lerp(v.cx, tcx, v.expansion * 0.85);
      const cy = p.lerp(v.cy, tcy, v.expansion * 0.85);
      return { cx, cy, scale };
    }

    function drawConstellations() {
      const reduced = getProps().reducedMotion;
      const selectedId = getProps().selectedConstellationId;
      const minDim = Math.min(p.width, p.height);
      const baseScale = minDim * 0.10;
      const pad = minDim * 0.08 + baseScale;
      const pulse = 0.5 + 0.5 * Math.sin(p.frameCount * 0.03);
      for (const v of constellationMap.values()) {
        if (!reduced && selectedId !== v.id) {
          v.cx += v.vx;
          v.cy += v.vy;
          if (v.cx < pad || v.cx > p.width - pad) v.vx *= -1;
          if (v.cy < pad || v.cy > p.height - pad) v.vy *= -1;
          v.cx = Math.min(p.width - pad, Math.max(pad, v.cx));
          v.cy = Math.min(p.height - pad, Math.max(pad, v.cy));
        }
        const { cx, cy, scale } = getConstellationDrawInfo(v);
        const isSelected = selectedId === v.id;
        const isHovered = hoveredId === v.id && !isSelected;
        const alphaMul = !selectedId ? 1 : isSelected ? 1 : 0.3;

        // Hover glow — soft bloom tracing the constellation outline & stars.
        if (isHovered) {
          p.push();
          p.noFill();
          const ctx = (p as unknown as { drawingContext: CanvasRenderingContext2D }).drawingContext;
          const prevCap = ctx.lineCap;
          const prevJoin = ctx.lineJoin;
          ctx.lineCap = "round";
          ctx.lineJoin = "round";
          const drawPath = () => {
            p.beginShape();
            for (const off of v.starOffsets) {
              p.vertex(cx + off.dx * scale, cy + off.dy * scale);
            }
            if (v.starOffsets.length > 2) {
              const first = v.starOffsets[0];
              p.vertex(cx + first.dx * scale, cy + first.dy * scale);
            }
            p.endShape();
          };
          p.stroke(45, 50, 100, 10 + pulse * 8);
          p.strokeWeight(10);
          drawPath();
          p.stroke(45, 70, 100, 18 + pulse * 10);
          p.strokeWeight(5);
          drawPath();
          p.noStroke();
          p.fill(45, 70, 100, 14 + pulse * 10);
          for (const off of v.starOffsets) {
            p.ellipse(cx + off.dx * scale, cy + off.dy * scale, scale * 0.55);
          }
          ctx.lineCap = prevCap;
          ctx.lineJoin = prevJoin;
          p.pop();
        }

        const hoverBoost = isHovered ? 8 : 0;
        p.push();
        p.noFill();
        p.stroke(45, 70, 100, (isSelected ? 95 : 60 + hoverBoost) * alphaMul);
        p.strokeWeight(isSelected ? 1.8 : isHovered ? 1.5 : 1.2);
        p.beginShape();
        for (const off of v.starOffsets) {
          p.vertex(cx + off.dx * scale, cy + off.dy * scale);
        }
        if (v.starOffsets.length > 2) {
          const first = v.starOffsets[0];
          p.vertex(cx + first.dx * scale, cy + first.dy * scale);
        }
        p.endShape();
        p.pop();

        for (const off of v.starOffsets) {
          const x = cx + off.dx * scale;
          const y = cy + off.dy * scale;
          const halo = p.color(off.color);
          halo.setAlpha((isSelected ? 85 : 55 + hoverBoost) * alphaMul);
          p.noStroke();
          p.fill(halo);
          p.ellipse(x, y, isSelected ? 36 : isHovered ? 28 : 22);
          const core = p.color(off.color);
          core.setAlpha(240 * alphaMul);
          p.fill(core);
          p.ellipse(x, y, isSelected ? 10 : 6);
        }
      }
    }

    function hitTestActiveStar(mx: number, my: number): string | null {
      for (const a of activeStarMap.values()) {
        const { x, y } = computeActiveStarPos(a);
        if (p.dist(mx, my, x, y) < 16) return a.id;
      }
      return null;
    }

    function hitTestSelectedStar(mx: number, my: number): string | null {
      const selectedId = getProps().selectedConstellationId;
      if (!selectedId) return null;
      const v = constellationMap.get(selectedId);
      if (!v) return null;
      const { cx, cy, scale } = getConstellationDrawInfo(v);
      for (const off of v.starOffsets) {
        const x = cx + off.dx * scale;
        const y = cy + off.dy * scale;
        if (p.dist(mx, my, x, y) < 22) return off.id;
      }
      return null;
    }

    // Shared forgiving hit-test used by hover and click so they never disagree.
    function pickConstellation(
      mx: number,
      my: number,
    ): { id: string; cx: number; cy: number } | null {
      let best: { id: string; cx: number; cy: number; d: number } | null = null;
      for (const v of constellationMap.values()) {
        const { cx, cy, scale } = getConstellationDrawInfo(v);
        const d = p.dist(mx, my, cx, cy);
        let candidate = d <= scale * 1.15;
        if (!candidate) {
          for (const off of v.starOffsets) {
            const sx = cx + off.dx * scale;
            const sy = cy + off.dy * scale;
            if (p.dist(mx, my, sx, sy) <= scale * 0.45) {
              candidate = true;
              break;
            }
          }
        }
        if (candidate && (!best || d < best.d)) {
          best = { id: v.id, cx, cy, d };
        }
      }
      return best ? { id: best.id, cx: best.cx, cy: best.cy } : null;
    }


    p.setup = () => {
      const parent = (p as unknown as { _userNode: HTMLElement })._userNode;
      const w = parent?.clientWidth || p.windowWidth;
      const h = parent?.clientHeight || p.windowHeight;
      const c = p.createCanvas(w, h);
      // Wrapper is pointer-events: none so HTML overlays always win. The
      // canvas itself opts back in so p5 can still receive star/cluster
      // clicks in empty areas.
      canvasEl = (c as unknown as { elt: HTMLCanvasElement }).elt;
      if (canvasEl) canvasEl.style.pointerEvents = "auto";
      p.colorMode(p.HSB, 360, 100, 100, 100);
      rebuildBgStars();
    };

    p.draw = () => {
      const props = getProps();
      reconcileActiveStars(props.activeStars);
      reconcileConstellations(props.constellations);

      // semi-transparent background -> trails
      p.push();
      p.noStroke();
      p.fill(0, 0, 0, 33);
      p.rect(0, 0, p.width, p.height);
      p.pop();

      drawBgStars(props.liveVolume);

      if (props.mode === "input") {
        drawWobble(props.liveVolume);
        drawActiveStars();
      } else {
        drawConstellations();
      }
    };

    function clearHover() {
      if (hoveredId !== null) {
        hoveredId = null;
        if (canvasEl) canvasEl.style.cursor = "default";
        getProps().onHoverChange?.(null);
      }
    }

    p.mouseMoved = (event?: MouseEvent | PointerEvent) => {
      const props = getProps();
      if (props.mode !== "observe") {
        clearHover();
        return;
      }
      const target = (event?.target as HTMLElement | null) ?? null;
      if (target && target.closest('[data-html-overlay="true"]')) {
        clearHover();
        return;
      }
      const mx = p.mouseX;
      const my = p.mouseY;
      if (mx < 0 || my < 0 || mx > p.width || my > p.height) {
        clearHover();
        return;
      }
      const hit = pickConstellation(mx, my);
      if (!hit) {
        clearHover();
        return;
      }
      hoveredId = hit.id;
      if (canvasEl) canvasEl.style.cursor = "pointer";
      props.onHoverChange?.({ id: hit.id, x: mx, y: my });
    };

    p.mousePressed = (event?: MouseEvent | PointerEvent) => {
      const target = (event?.target as HTMLElement | null) ?? null;
      if (target && target.closest('[data-html-overlay="true"]')) return;
      const props = getProps();
      const mx = p.mouseX;
      const my = p.mouseY;
      if (mx < 0 || my < 0 || mx > p.width || my > p.height) return;

      if (props.mode === "input") {
        const sid = hitTestActiveStar(mx, my);
        if (sid && props.onStarClick) props.onStarClick(sid);
        return;
      }
      const starHit = hitTestSelectedStar(mx, my);
      if (starHit && props.onStarClick) {
        props.onStarClick(starHit);
        return;
      }
      const hit = pickConstellation(mx, my);
      if (hit && props.onConstellationClick) {
        props.onConstellationClick(hit.id);
        return;
      }
      if (props.selectedConstellationId && props.onConstellationClick) {
        props.onConstellationClick(null);
      }
    };


    (p as unknown as { __resize: (w: number, h: number) => void }).__resize = (
      w: number,
      h: number,
    ) => {
      p.resizeCanvas(w, h);
      rebuildBgStars();
    };
  };
}
