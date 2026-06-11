import { createFileRoute } from "@tanstack/react-router";
import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Recorder } from "@/components/Recorder";
import { MaxDataPanel } from "@/components/MaxDataPanel";
import { P5VisualLayer } from "@/components/P5VisualLayer";
import { MicLevelProvider, useMicLevel } from "@/lib/mic-level-context";
import {
  createConstellationFromStars,
  fetchConstellations,
  MAX_CONSTELLATION_STARS,
  MIN_CONSTELLATION_STARS,
  QUESTION_TEXT,
  STATUS_LABELS,
  type ConstellationWithStars,
  type StarRow,
} from "@/lib/stars";


export const Route = createFileRoute("/")({
  head: () => ({
    meta: [
      { title: "Sonic Constellation" },
      {
        name: "description",
        content:
          "Record a voice answer to a shared question. Your recording becomes a star in a shared constellation.",
      },
      { property: "og:title", content: "Sonic Constellation" },
      {
        property: "og:description",
        content: "A participatory sonic constellation archive.",
      },
    ],
  }),
  component: () => (
    <MicLevelProvider>
      <Index />
    </MicLevelProvider>
  ),
});

function Index() {
  const [activeStars, setActiveStars] = useState<StarRow[]>([]);
  const [archive, setArchive] = useState<ConstellationWithStars[]>([]);
  const [activeId, setActiveId] = useState<string | null>(null);
  const [tab, setTab] = useState<"input" | "observe">("input");
  const [saving, setSaving] = useState(false);
  const [forming, setForming] = useState(false);
  const [saveError, setSaveError] = useState<string | null>(null);
  const [showMaxPanel, setShowMaxPanel] = useState(false);
  const [selectedConstellationId, setSelectedConstellationId] = useState<
    string | null
  >(null);
  const [liveVolume, setLiveVolume] = useState(0);
  const [anchor, setAnchor] = useState<{ x: number; y: number } | null>(null);
  const audioRef = useRef<HTMLAudioElement | null>(null);
  const recorderAnchorRef = useRef<HTMLDivElement | null>(null);
  const mic = useMicLevel();

  // Subscribe to mic level for the p5 visual layer.
  useEffect(() => {
    const unsub = mic.subscribe((v) => setLiveVolume(v));
    return unsub;
  }, [mic]);

  // Track the recorder anchor center (viewport coords) so p5 can anchor the
  // wobble + active stars to it in Input Mode.
  useEffect(() => {
    if (tab !== "input") return;
    const measure = () => {
      const el = recorderAnchorRef.current;
      if (!el) return;
      const r = el.getBoundingClientRect();
      setAnchor({ x: r.left + r.width / 2, y: r.top + r.height / 2 });
    };
    measure();
    const ro = new ResizeObserver(measure);
    if (recorderAnchorRef.current) ro.observe(recorderAnchorRef.current);
    window.addEventListener("resize", measure);
    window.addEventListener("scroll", measure, { passive: true });
    const t = window.setInterval(measure, 500);
    return () => {
      ro.disconnect();
      window.removeEventListener("resize", measure);
      window.removeEventListener("scroll", measure);
      window.clearInterval(t);
    };
  }, [tab]);


  const reloadArchive = useCallback(async () => {
    try {
      const data = await fetchConstellations();
      setArchive(data);
    } catch (err) {
      console.error(err);
    }
  }, []);

  useEffect(() => {
    reloadArchive();
  }, [reloadArchive]);

  useEffect(() => {
    if (typeof window === "undefined") return;
    const params = new URLSearchParams(window.location.search);
    setShowMaxPanel(params.get("debug") === "max");
  }, []);

  // Poll while any constellation is waiting on Max so status badges update live.
  useEffect(() => {
    const waiting = archive.some(
      (c) => c.status === "pending_synthesis" || c.status === "synthesizing",
    );
    if (!waiting) return;
    const t = window.setInterval(() => {
      reloadArchive();
    }, 10000);
    return () => window.clearInterval(t);
  }, [archive, reloadArchive]);

  const handleSubmitted = (star: StarRow) => {
    setActiveStars((prev) =>
      prev.some((s) => s.id === star.id) ? prev : [...prev, star],
    );
  };

  const playUrl = (url: string, key: string) => {
    const el = audioRef.current;
    if (!el) return;
    try {
      el.pause();
    } catch {
      /* noop */
    }
    el.src = url;
    el.currentTime = 0;
    setActiveId(key);
    el.play().catch((err) => {
      console.error(err);
      setActiveId(null);
    });
  };

  const playStar = useCallback(
    (star: StarRow) => playUrl(star.audio_url, star.id),
    [],
  );

  const playSynth = async (c: ConstellationWithStars) => {
    if (c.status !== "ready" || !c.synth_audio_path) return;
    try {
      const res = await fetch(
        `/api/public/constellations/${c.id}/synth-audio`,
        { headers: { Accept: "application/json" } },
      );
      const data = (await res.json()) as {
        signed_url?: string;
        error?: string;
      };
      if (!res.ok || !data.signed_url) {
        throw new Error(data.error ?? `HTTP ${res.status}`);
      }
      playUrl(data.signed_url, `synth:${c.id}`);
    } catch (err) {
      console.error("Failed to load synthesized audio", err);
    }
  };

  // Resolve clicks coming from the p5 layer.
  const handleStarClick = useCallback(
    (starId: string) => {
      // Try active session first.
      const fromActive = activeStars.find((s) => s.id === starId);
      if (fromActive) {
        playStar(fromActive);
        return;
      }
      for (const c of archive) {
        const s = c.stars.find((x) => x.id === starId);
        if (s) {
          playStar(s);
          return;
        }
      }
    },
    [activeStars, archive, playStar],
  );

  const handleConstellationClick = useCallback((id: string | null) => {
    setSelectedConstellationId(id);
  }, []);

  const createConstellation = async () => {
    if (activeStars.length < MIN_CONSTELLATION_STARS || saving) return;
    setSaving(true);
    setSaveError(null);
    setForming(true);
    await new Promise((r) => setTimeout(r, 800));
    try {
      await createConstellationFromStars(activeStars);
      setActiveStars([]);
      await reloadArchive();
      setTab("observe");
    } catch (err) {
      console.error(err);
      setSaveError(
        err instanceof Error ? err.message : "Could not save constellation.",
      );
    } finally {
      setForming(false);
      setSaving(false);
    }
  };

  const canCreate = activeStars.length >= MIN_CONSTELLATION_STARS;
  const sessionFull = activeStars.length >= MAX_CONSTELLATION_STARS;

  const resetSession = () => {
    setActiveStars([]);
    setSaveError(null);
  };

  // Clear selection when switching tabs.
  useEffect(() => {
    if (tab !== "observe") setSelectedConstellationId(null);
  }, [tab]);

  const selectedConstellation = useMemo(
    () => archive.find((c) => c.id === selectedConstellationId) ?? null,
    [archive, selectedConstellationId],
  );

  return (
    <div className="relative min-h-screen overflow-hidden bg-zinc-950 text-zinc-100">
      {/* p5 visual layer — the single visual renderer. Sits behind HTML overlays. */}
      <div className="pointer-events-auto fixed inset-0 z-0">
        <P5VisualLayer
          mode={tab}
          isRecording={false}
          liveVolume={liveVolume}
          activeStars={activeStars}
          constellations={archive}
          selectedConstellationId={selectedConstellationId}
          centerX={tab === "input" ? (anchor?.x ?? null) : null}
          centerY={tab === "input" ? (anchor?.y ?? null) : null}
          onStarClick={handleStarClick}
          onConstellationClick={handleConstellationClick}
        />

      </div>

      {/* HTML overlay layer — controls, status, accessibility. */}
      <div className="pointer-events-none relative z-10 mx-auto flex min-h-screen max-w-4xl flex-col gap-6 px-4 py-8">
        <header className="pointer-events-auto text-center">
          <p className="text-xs uppercase tracking-[0.3em] text-amber-200/70">
            Sonic Constellation
          </p>
          <h1 className="mt-4 text-2xl font-light leading-snug text-zinc-100 md:text-3xl">
            {QUESTION_TEXT}
          </h1>
        </header>

        <Tabs
          value={tab}
          onValueChange={(v) => setTab(v as "input" | "observe")}
          className="w-full"
        >
          <TabsList className="pointer-events-auto mx-auto grid w-full max-w-sm grid-cols-2 bg-zinc-900/80 backdrop-blur">
            <TabsTrigger value="input">Input Mode</TabsTrigger>
            <TabsTrigger value="observe">
              Contemplation ({archive.length})
            </TabsTrigger>
          </TabsList>

          <TabsContent value="input" className="pt-6">
            <div
              className={`pointer-events-none relative mx-auto h-[60vh] min-h-[420px] w-full transition ${
                forming
                  ? "ring-2 ring-amber-200/60 shadow-[0_0_60px_rgba(252,211,77,0.35)] rounded-lg"
                  : ""
              }`}
            >
              <div className="pointer-events-auto absolute left-1/2 top-1/2 z-10 -translate-x-1/2 -translate-y-1/2">
                <div ref={recorderAnchorRef}>
                  <Recorder
                    onSubmitted={handleSubmitted}
                    disabled={sessionFull}
                    disabledMessage={`You've gathered ${MAX_CONSTELLATION_STARS} stars — create your constellation or reset the session to record more.`}
                  />
                </div>
              </div>

            </div>
            <div className="pointer-events-auto mt-4 flex flex-col items-center gap-2">
              <p className="text-xs text-muted-foreground">
                {activeStars.length} star
                {activeStars.length === 1 ? "" : "s"} in this session
                {!canCreate && activeStars.length > 0
                  ? ` · ${MIN_CONSTELLATION_STARS - activeStars.length} more to form a constellation`
                  : ""}
                {sessionFull ? " · session full (max 7)" : ""}
              </p>
              <div className="flex items-center gap-2">
                <button
                  type="button"
                  onClick={createConstellation}
                  disabled={!canCreate || saving}
                  className="rounded-md bg-amber-200 px-4 py-2 text-sm font-medium text-zinc-900 transition hover:bg-amber-100 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-amber-200 disabled:cursor-not-allowed disabled:bg-zinc-700 disabled:text-zinc-400"
                >
                  {forming
                    ? "Forming…"
                    : saving
                      ? "Saving…"
                      : "Create Constellation"}
                </button>
                {activeStars.length > 0 && (
                  <button
                    type="button"
                    onClick={resetSession}
                    disabled={saving}
                    className="rounded-md border border-white/30 px-3 py-2 text-xs text-white/80 transition hover:bg-white/10 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-white/60"
                  >
                    Reset session
                  </button>
                )}
              </div>
              {saveError && (
                <p className="text-xs text-red-300" role="status">
                  {saveError}
                </p>
              )}
            </div>
          </TabsContent>

          <TabsContent value="observe" className="pt-6">
            <div className="pointer-events-auto flex flex-col items-center gap-3 text-center">
              <p className="text-xs text-muted-foreground">
                {archive.length === 0
                  ? "No constellations yet."
                  : "Click a constellation to expand it. Click empty space to dismiss. Click a star to play its recording."}
              </p>
            </div>

            {selectedConstellation && (
              <div className="pointer-events-auto fixed inset-x-4 bottom-6 z-20 mx-auto max-w-md rounded-lg border border-amber-200/30 bg-zinc-950/85 p-4 shadow-2xl backdrop-blur md:inset-x-auto md:left-1/2 md:-translate-x-1/2">
                <div className="flex items-start justify-between gap-3">
                  <div className="min-w-0">
                    <p className="truncate text-sm font-medium text-amber-100">
                      {selectedConstellation.title ||
                        selectedConstellation.question_text}
                    </p>
                    <p className="mt-1 text-xs text-zinc-400">
                      {selectedConstellation.stars.length} star
                      {selectedConstellation.stars.length === 1 ? "" : "s"} ·{" "}
                      {new Date(
                        selectedConstellation.created_at,
                      ).toLocaleDateString()}
                    </p>
                    <p
                      className={`mt-2 inline-block rounded-full px-2 py-0.5 text-[10px] uppercase tracking-wider ${
                        selectedConstellation.status === "ready"
                          ? "bg-emerald-400/15 text-emerald-200"
                          : selectedConstellation.status === "failed"
                            ? "bg-red-400/15 text-red-200"
                            : "bg-amber-400/15 text-amber-200"
                      }`}
                    >
                      {STATUS_LABELS[selectedConstellation.status]}
                    </p>
                  </div>
                  <button
                    type="button"
                    onClick={() => setSelectedConstellationId(null)}
                    className="rounded-md border border-white/20 px-2 py-1 text-xs text-white/80 transition hover:bg-white/10"
                    aria-label="Close"
                  >
                    Close
                  </button>
                </div>
                {selectedConstellation.status === "ready" &&
                  selectedConstellation.synth_audio_path && (
                    <button
                      type="button"
                      onClick={() => playSynth(selectedConstellation)}
                      className="mt-3 w-full rounded-md bg-amber-200 px-3 py-2 text-sm font-medium text-zinc-900 transition hover:bg-amber-100"
                    >
                      {activeId === `synth:${selectedConstellation.id}`
                        ? "Playing synthesized…"
                        : "Play Synthesized Constellation"}
                    </button>
                  )}
              </div>
            )}
          </TabsContent>
        </Tabs>

        <audio
          ref={audioRef}
          onEnded={() => setActiveId(null)}
          className="hidden"
        />

        {showMaxPanel && (
          <div className="pointer-events-auto">
            <MaxDataPanel />
          </div>
        )}
      </div>
    </div>
  );
}
