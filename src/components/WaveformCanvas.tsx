import { useEffect, useRef } from "react";
import { useMicLevel } from "@/lib/mic-level-context";

interface Props {
  analyser: AnalyserNode | null;
  active: boolean;
}

// --- Lightweight 3D value noise (no deps) ---
// Hash → pseudo-random in [0,1] from integer lattice coords.
function hash3(ix: number, iy: number, iz: number): number {
  let h = ix * 374761393 + iy * 668265263 + iz * 2147483647;
  h = (h ^ (h >>> 13)) * 1274126177;
  h = h ^ (h >>> 16);
  return ((h >>> 0) % 100000) / 100000;
}
const fade = (t: number) => t * t * (3 - 2 * t);
const lerp = (a: number, b: number, t: number) => a + (b - a) * t;

function noise3(x: number, y: number, z: number): number {
  const x0 = Math.floor(x), y0 = Math.floor(y), z0 = Math.floor(z);
  const x1 = x0 + 1, y1 = y0 + 1, z1 = z0 + 1;
  const xf = fade(x - x0), yf = fade(y - y0), zf = fade(z - z0);

  const c000 = hash3(x0, y0, z0);
  const c100 = hash3(x1, y0, z0);
  const c010 = hash3(x0, y1, z0);
  const c110 = hash3(x1, y1, z0);
  const c001 = hash3(x0, y0, z1);
  const c101 = hash3(x1, y0, z1);
  const c011 = hash3(x0, y1, z1);
  const c111 = hash3(x1, y1, z1);

  const x00 = lerp(c000, c100, xf);
  const x10 = lerp(c010, c110, xf);
  const x01 = lerp(c001, c101, xf);
  const x11 = lerp(c011, c111, xf);
  const y0i = lerp(x00, x10, yf);
  const y1i = lerp(x01, x11, yf);
  return lerp(y0i, y1i, zf); // [0,1]
}

/**
 * Organic wobble ring matching the teammate's p5 sketch. Uses 3D value-noise
 * sampled at (cos θ * 0.8 + 10, sin θ * 0.8 + 10, frame * 0.008) so neighbor
 * points have uncorrelated radii — produces the hand-drawn strand look rather
 * than a perfect circle.
 */
export function WaveformCanvas({ analyser, active }: Props) {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const rafRef = useRef<number | null>(null);
  const smoothedRef = useRef(0);
  const frameRef = useRef(0);
  const mic = useMicLevel();

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    const dpr = window.devicePixelRatio || 1;
    const size = 320;
    canvas.width = size * dpr;
    canvas.height = size * dpr;
    canvas.style.width = `${size}px`;
    canvas.style.height = `${size}px`;
    ctx.setTransform(dpr, 0, 0, dpr, 0, 0);

    const buf = analyser ? new Uint8Array(analyser.fftSize) : null;
    const circleDiv = 340;
    const reduced =
      typeof window !== "undefined" &&
      window.matchMedia?.("(prefers-reduced-motion: reduce)").matches;

    const draw = () => {
      ctx.clearRect(0, 0, size, size);

      let level = 0;
      if (active && analyser && buf) {
        analyser.getByteTimeDomainData(buf);
        let sum = 0;
        for (let i = 0; i < buf.length; i++) {
          const v = (buf[i] - 128) / 128;
          sum += v * v;
        }
        level = Math.sqrt(sum / buf.length);
      }

      const threshold = 0.001;
      const audioEnergy = Math.max(0, level - threshold);
      smoothedRef.current = smoothedRef.current * 0.92 + audioEnergy * 0.08;
      const s = smoothedRef.current;
      mic.publish(s);

      if (!reduced) frameRef.current += 1;
      const frame = frameRef.current;

      const cx = size / 2;
      const cy = size / 2;
      const baseRadius = size / 5;
      // small idle baseline so the ring is still organic at silence
      const idle = 0.002;
      const wavePower = reduced ? 0 : (s + idle) * 300;
      const nz = frame * 0.008;

      for (let i = 0; i < circleDiv; i++) {
        const theta = (i * Math.PI * 2) / circleDiv;
        const nx = Math.cos(theta) * 0.8 + 10;
        const ny = Math.sin(theta) * 0.8 + 10;
        const n = noise3(nx, ny, nz) * 2 - 1; // [-1,1]
        const wobble = n * wavePower * 5;
        const radius = baseRadius + wobble;

        const dotR = 1.2;
        const hue = 170 + (theta / (Math.PI * 2)) * 80;
        ctx.fillStyle = `hsla(${hue}, 60%, 80%, 0.75)`;

        const x1 = cx + radius * Math.cos(theta);
        const y1 = cy + radius * Math.sin(theta);
        ctx.beginPath();
        ctx.arc(x1, y1, dotR, 0, Math.PI * 2);
        ctx.fill();

        const x2 = cx + radius * Math.cos(theta + Math.PI);
        const y2 = cy + radius * Math.sin(theta + Math.PI);
        ctx.beginPath();
        ctx.arc(x2, y2, dotR, 0, Math.PI * 2);
        ctx.fill();

        const x3 = cx + radius * Math.cos(theta + Math.PI * 1.5);
        const y3 = cy + radius * Math.sin(theta + Math.PI * 1.5);
        ctx.beginPath();
        ctx.arc(x3, y3, dotR, 0, Math.PI * 2);
        ctx.fill();
      }

      // soft outer glow
      const glowR = baseRadius + Math.abs(wavePower) * 5 + 60;
      const glow = ctx.createRadialGradient(
        cx,
        cy,
        baseRadius * 0.4,
        cx,
        cy,
        glowR,
      );
      glow.addColorStop(0, `rgba(253, 230, 138, ${0.06 + s * 0.6})`);
      glow.addColorStop(1, "rgba(253, 230, 138, 0)");
      ctx.fillStyle = glow;
      ctx.beginPath();
      ctx.arc(cx, cy, glowR, 0, Math.PI * 2);
      ctx.fill();

      rafRef.current = requestAnimationFrame(draw);
    };

    rafRef.current = requestAnimationFrame(draw);
    return () => {
      if (rafRef.current != null) cancelAnimationFrame(rafRef.current);
    };
  }, [analyser, active, mic]);

  return <canvas ref={canvasRef} className="pointer-events-none" />;
}
