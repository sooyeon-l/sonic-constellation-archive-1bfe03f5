import { useEffect, useRef } from "react";
import { useMicLevel } from "@/lib/mic-level-context";

interface Props {
  analyser: AnalyserNode | null;
  active: boolean;
}

// 2D noise-ish function — cheap pseudo-perlin via summed sines.
function pseudoNoise(x: number, y: number, t: number) {
  return (
    Math.sin(x * 1.7 + t * 0.9) * 0.5 +
    Math.sin(y * 2.1 - t * 1.1) * 0.3 +
    Math.sin((x + y) * 1.3 + t * 0.6) * 0.2
  );
}

/**
 * p5-prototype-style wobble ring around the recorder. Driven by the same
 * AnalyserNode the Recorder already creates. Also broadcasts the smoothed
 * level into MicLevelContext so other visuals (StarField) can react.
 */
export function WaveformCanvas({ analyser, active }: Props) {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const rafRef = useRef<number | null>(null);
  const smoothedRef = useRef(0);
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
    const circleDiv = 350;

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
      // p5 prototype smoothing
      smoothedRef.current = smoothedRef.current * 0.92 + audioEnergy * 0.08;
      const s = smoothedRef.current;
      mic.publish(s);

      const cx = size / 2;
      const cy = size / 2;
      const baseRadius = size / 5;
      // idle still has a tiny baseline so the ring never feels dead
      const idleBoost = active ? 0 : 0.0015;
      const wavePower = (s + idleBoost) * 300;
      const t = performance.now() * 0.001;

      for (let i = 0; i < circleDiv; i++) {
        const theta = (i * Math.PI * 2) / circleDiv;
        const nx = Math.cos(theta) * 0.8 + 10;
        const ny = Math.sin(theta) * 0.8 + 10;
        const n = pseudoNoise(nx, ny, t * 0.6);
        const wobble = n * wavePower * 0.6;
        const radius = baseRadius + wobble;

        const dotR = 1.2;

        const hue = 170 + ((theta / (Math.PI * 2)) * 80); // 170..250
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
      const glow = ctx.createRadialGradient(
        cx,
        cy,
        baseRadius * 0.4,
        cx,
        cy,
        baseRadius + wavePower + 60,
      );
      glow.addColorStop(0, `rgba(253, 230, 138, ${0.06 + s * 0.6})`);
      glow.addColorStop(1, "rgba(253, 230, 138, 0)");
      ctx.fillStyle = glow;
      ctx.beginPath();
      ctx.arc(cx, cy, baseRadius + wavePower + 60, 0, Math.PI * 2);
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
