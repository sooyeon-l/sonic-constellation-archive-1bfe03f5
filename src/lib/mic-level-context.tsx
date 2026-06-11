import { createContext, useCallback, useContext, useRef, type ReactNode } from "react";

type Listener = (level: number) => void;

interface MicLevelApi {
  publish: (level: number) => void;
  subscribe: (cb: Listener) => () => void;
  getLatest: () => number;
}

const MicLevelContext = createContext<MicLevelApi | null>(null);

export function MicLevelProvider({ children }: { children: ReactNode }) {
  const listeners = useRef<Set<Listener>>(new Set());
  const latest = useRef(0);

  const publish = useCallback((level: number) => {
    latest.current = level;
    listeners.current.forEach((l) => l(level));
  }, []);

  const subscribe = useCallback((cb: Listener) => {
    listeners.current.add(cb);
    return () => {
      listeners.current.delete(cb);
    };
  }, []);

  const getLatest = useCallback(() => latest.current, []);

  return (
    <MicLevelContext.Provider value={{ publish, subscribe, getLatest }}>
      {children}
    </MicLevelContext.Provider>
  );
}

export function useMicLevel(): MicLevelApi {
  const ctx = useContext(MicLevelContext);
  if (!ctx) {
    // Safe no-op fallback for components rendered outside the provider.
    return {
      publish: () => undefined,
      subscribe: () => () => undefined,
      getLatest: () => 0,
    };
  }
  return ctx;
}
