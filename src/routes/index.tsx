import { createFileRoute } from "@tanstack/react-router";
import { useCallback, useEffect, useRef, useState } from "react";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Recorder } from "@/components/Recorder";
import { ActiveSessionOverlay } from "@/components/ActiveSession";
import { ConstellationArchive } from "@/components/ConstellationArchive";
import { MaxDataPanel } from "@/components/MaxDataPanel";
import {
  createConstellationFromStars,
  fetchConstellations,
  QUESTION_TEXT,
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
  component: Index,
});

function Index() {
  const [activeStars, setActiveStars] = useState<StarRow[]>([]);
  const [archive, setArchive] = useState<ConstellationWithStars[]>([]);
  const [activeId, setActiveId] = useState<string | null>(null);
  const [tab, setTab] = useState<"input" | "observe">("input");
  const [saving, setSaving] = useState(false);
  const [saveError, setSaveError] = useState<string | null>(null);
  const audioRef = useRef<HTMLAudioElement | null>(null);

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

  const handleSubmitted = (star: StarRow) => {
    setActiveStars((prev) =>
      prev.some((s) => s.id === star.id) ? prev : [...prev, star],
    );
  };

  const playStar = (star: StarRow) => {
    const el = audioRef.current;
    if (!el) return;
    try {
      el.pause();
    } catch {
      /* noop */
    }
    el.src = star.audio_url;
    el.currentTime = 0;
    setActiveId(star.id);
    el.play().catch((err) => {
      console.error(err);
      setActiveId(null);
    });
  };

  const createConstellation = async () => {
    if (activeStars.length < 3 || saving) return;
    setSaving(true);
    setSaveError(null);
    try {
      await createConstellationFromStars(activeStars.map((s) => s.id));
      setActiveStars([]);
      await reloadArchive();
      setTab("observe");
    } catch (err) {
      console.error(err);
      setSaveError(
        err instanceof Error ? err.message : "Could not save constellation.",
      );
    } finally {
      setSaving(false);
    }
  };

  const canCreate = activeStars.length >= 3;

  return (
    <div className="min-h-screen bg-zinc-950 text-zinc-100">
      <div className="mx-auto flex max-w-4xl flex-col gap-6 px-4 py-8">
        <header className="text-center">
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
          <TabsList className="mx-auto grid w-full max-w-sm grid-cols-2 bg-zinc-900">
            <TabsTrigger value="input">Input Mode</TabsTrigger>
            <TabsTrigger value="observe">
              Contemplation ({archive.length})
            </TabsTrigger>
          </TabsList>
          <TabsContent value="input" className="pt-6">
            <div className="relative mx-auto h-[60vh] min-h-[420px] w-full overflow-hidden rounded-lg border border-border/30 bg-black/40">
              <ActiveSessionOverlay
                stars={activeStars}
                onPlay={playStar}
                activeId={activeId}
              />
              <div className="relative z-10 flex h-full flex-col items-center justify-center">
                <Recorder onSubmitted={handleSubmitted} />
              </div>
            </div>
            <div className="mt-4 flex flex-col items-center gap-2">
              <p className="text-xs text-muted-foreground">
                {activeStars.length} star{activeStars.length === 1 ? "" : "s"} in
                this session
                {!canCreate && activeStars.length > 0
                  ? ` · ${3 - activeStars.length} more to form a constellation`
                  : ""}
              </p>
              <button
                type="button"
                onClick={createConstellation}
                disabled={!canCreate || saving}
                className="rounded-md bg-amber-200 px-4 py-2 text-sm font-medium text-zinc-900 transition hover:bg-amber-100 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-amber-200 disabled:cursor-not-allowed disabled:bg-zinc-700 disabled:text-zinc-400"
              >
                {saving ? "Saving…" : "Create Constellation"}
              </button>
              {saveError && (
                <p className="text-xs text-red-300" role="status">
                  {saveError}
                </p>
              )}
            </div>
          </TabsContent>
          <TabsContent value="observe" className="pt-6">
            <ConstellationArchive
              constellations={archive}
              onPlay={playStar}
              activeStarId={activeId}
            />
          </TabsContent>
        </Tabs>

        <audio
          ref={audioRef}
          onEnded={() => setActiveId(null)}
          onPause={() => setActiveId((prev) => prev)}
          className="hidden"
        />

        <MaxDataPanel />
      </div>
    </div>
  );
}
