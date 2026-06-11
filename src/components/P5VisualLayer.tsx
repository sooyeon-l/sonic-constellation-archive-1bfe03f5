import { useEffect, useRef } from "react";
import type p5 from "p5";
import { createSketch, type SketchProps } from "@/lib/p5-sketch";

interface Props extends SketchProps {
  className?: string;
}

/**
 * Client-only p5 instance-mode renderer. Owns the visual layer (wobble, bg
 * stars, active-session stars, constellation scene) and forwards visual
 * clicks back to React via props. HTML overlays own all real controls.
 */
export function P5VisualLayer(props: Props) {
  const containerRef = useRef<HTMLDivElement>(null);
  const propsRef = useRef<SketchProps>(props);
  const instanceRef = useRef<p5 | null>(null);

  // Keep latest props for the sketch closure without remounting.
  propsRef.current = props;

  useEffect(() => {
    let cancelled = false;
    let ro: ResizeObserver | null = null;

    (async () => {
      if (typeof window === "undefined") return;
      const mod = await import("p5");
      if (cancelled || !containerRef.current) return;
      const P5 = mod.default;
      const reduced =
        window.matchMedia?.("(prefers-reduced-motion: reduce)").matches ??
        false;

      const getProps = () => ({ ...propsRef.current, reducedMotion: reduced });
      const inst = new P5(createSketch(getProps), containerRef.current);
      instanceRef.current = inst;

      ro = new ResizeObserver(() => {
        const el = containerRef.current;
        if (!el) return;
        const resize = (
          inst as unknown as { __resize?: (w: number, h: number) => void }
        ).__resize;
        if (resize) resize(el.clientWidth, el.clientHeight);
      });
      ro.observe(containerRef.current);
    })();

    return () => {
      cancelled = true;
      if (ro) ro.disconnect();
      if (instanceRef.current) {
        instanceRef.current.remove();
        instanceRef.current = null;
      }
    };
  }, []);

  return (
    <div
      ref={containerRef}
      className={props.className ?? "absolute inset-0"}
      aria-hidden
    />
  );
}
