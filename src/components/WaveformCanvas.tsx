import { useEffect, useRef } from "react";

interface Props {
  analyser: AnalyserNode | null;
  active: boolean;
}

/**
 * Circular wobble waveform inspired by the reference p5 sketch.
 * Uses the Web Audio AnalyserNode tied to the same MediaStream as MediaRecorder.
 * Visual only — does not touch the recorded audio.
 */
export function WaveformCanvas({ analyser, active }: Props) {
  const canvasRef = useRef<HTMLCanvasElement>(null);
  const rafRef = useRef<number | null>(null);
  const smoothedRef = useRef(0);

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
    ctx.scale(dpr, dpr);

    const buf = analyser ? new Uint8Array(analyser.fftSize) : null;

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

      // Smoothing per reference sketch: smoothed = smoothed*0.92 + level*0.08
      smoothedRef.current = smoothedRef.current * 0.92 + level * 0.08;
      const s = smoothedRef.current;

      const cx = size / 2;
      const cy = size / 2;
      const baseR = 70;
      const wavePower = s * 180;

      // Outer glow ring
      const grad = ctx.createRadialGradient(cx, cy, baseR * 0.6, cx, cy, baseR + wavePower + 60);
      grad.addColorStop(0, `rgba(253, 230, 138, ${0.10 + s * 0.5})`);
      grad.addColorStop(1, "rgba(253, 230, 138, 0)");
      ctx.fillStyle = grad;
      ctx.beginPath();
      ctx.arc(cx, cy, baseR + wavePower + 60, 0, Math.PI * 2);
      ctx.fill();

      // Wobbling ring
      const points = 96;
      ctx.beginPath();
      for (let i = 0; i <= points; i++) {
        const a = (i / points) * Math.PI * 2;
        const noise =
          Math.sin(a * 3 + performance.now() * 0.002) * (4 + wavePower * 0.4) +
          Math.sin(a * 7 + performance.now() * 0.0035) * (3 + wavePower * 0.25);
        const r = baseR + wavePower * 0.4 + noise;
        const x = cx + Math.cos(a) * r;
        const y = cy + Math.sin(a) * r;
        if (i === 0) ctx.moveTo(x, y);
        else ctx.lineTo(x, y);
      }
      ctx.closePath();
      ctx.strokeStyle = active
        ? `rgba(252, 211, 77, ${0.7 + s * 0.3})`
        : "rgba(148, 163, 184, 0.35)";
      ctx.lineWidth = 1.5;
      ctx.stroke();

      rafRef.current = requestAnimationFrame(draw);
    };

    rafRef.current = requestAnimationFrame(draw);
    return () => {
      if (rafRef.current != null) cancelAnimationFrame(rafRef.current);
    };
  }, [analyser, active]);

  return <canvas ref={canvasRef} className="pointer-events-none" />;
}