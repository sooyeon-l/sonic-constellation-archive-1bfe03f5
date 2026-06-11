import { useEffect, useRef } from "react";
import { useMicLevel } from "@/lib/mic-level-context";

interface BgStar {
  x: number;
  y: number;
  r: number;
  base: number;
  phase: number;
  speed: number;
  vx: number;
  vy: number;
}

const COUNT = 180;

/**
 * Fixed full-viewport canvas with drifting, twinkling background stars.
 * Pulses slightly with live mic volume from MicLevelContext.
 */
export function StarField() {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const mic = useMicLevel();

  useEffect(() => {
    const canvas = canvasRef.current;
    if (!canvas) return;
    const ctx = canvas.getContext("2d");
    if (!ctx) return;

    const prefersReduced =
      typeof window !== "undefined" &&
      window.matchMedia?.("(prefers-reduced-motion: reduce)").matches;

    let dpr = window.devicePixelRatio || 1;
    let w = window.innerWidth;
    let h = window.innerHeight;
    let stars: BgStar[] = [];

    const seed = () => {
      stars = [];
      for (let i = 0; i < COUNT; i++) {
        const base = Math.random() * 0.7 + 0.3;
        stars.push({
          x: Math.random() * w,
          y: Math.random() * h,
          r: Math.random() * 1.3 + 0.3,
          base,
          phase: Math.random() * Math.PI * 2,
          speed: 0.4 + Math.random() * 1.2,
          vx: (Math.random() - 0.5) * 0.05,
          vy: (Math.random() - 0.5) * 0.05,
        });
      }
    };

    const resize = () => {
      dpr = window.devicePixelRatio || 1;
      w = window.innerWidth;
      h = window.innerHeight;
      canvas.width = Math.floor(w * dpr);
      canvas.height = Math.floor(h * dpr);
      canvas.style.width = `${w}px`;
      canvas.style.height = `${h}px`;
      ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
      if (stars.length === 0) seed();
    };
    resize();
    window.addEventListener("resize", resize);

    let raf = 0;
    let t0 = performance.now();

    const tick = (now: number) => {
      const dt = (now - t0) / 1000;
      t0 = now;
      const vol = mic.getLatest();
      const pulse = Math.min(1, vol * 4);

      ctx.clearRect(0, 0, w, h);
      ctx.fillStyle = "rgba(8, 10, 20, 0.55)";
      ctx.fillRect(0, 0, w, h);

      for (const s of stars) {
        if (!prefersReduced) {
          s.x += s.vx;
          s.y += s.vy;
          if (s.x < -2) s.x = w + 2;
          if (s.x > w + 2) s.x = -2;
          if (s.y < -2) s.y = h + 2;
          if (s.y > h + 2) s.y = -2;
          s.phase += dt * s.speed;
        }
        const twinkle = prefersReduced ? 0 : (Math.sin(s.phase) + 1) * 0.5;
        const alpha = Math.min(1, s.base * (0.55 + twinkle * 0.45) + pulse * 0.25);
        const r = s.r * (1 + pulse * 0.4);
        ctx.beginPath();
        ctx.fillStyle = `rgba(253, 230, 138, ${alpha * 0.85})`;
        ctx.arc(s.x, s.y, r, 0, Math.PI * 2);
        ctx.fill();
      }

      raf = requestAnimationFrame(tick);
    };
    raf = requestAnimationFrame(tick);

    return () => {
      window.removeEventListener("resize", resize);
      cancelAnimationFrame(raf);
    };
  }, [mic]);

  return (
    <canvas
      ref={canvasRef}
      aria-hidden
      className="pointer-events-none fixed inset-0 z-0"
    />
  );
}
