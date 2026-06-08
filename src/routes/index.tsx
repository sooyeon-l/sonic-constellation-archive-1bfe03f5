import { createFileRoute } from "@tanstack/react-router";
import { useCallback, useEffect, useRef, useState } from "react";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Recorder } from "@/components/Recorder";
import { Constellation } from "@/components/Constellation";
import { MaxDataPanel } from "@/components/MaxDataPanel";
import { fetchStars, QUESTION_TEXT, type StarRow } from "@/lib/stars";

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
  const [stars, setStars] = useState<StarRow[]>([]);
  const [activeId, setActiveId] = useState<string | null>(null);
  const [tab, setTab] = useState<"input" | "observe">("input");
  const audioRef = useRef<HTMLAudioElement | null>(null);

  const reload = useCallback(async () => {
    try {
      const data = await fetchStars();
      setStars(data);
    } catch (err) {
      console.error(err);
    }
  }, []);

  useEffect(() => {
    reload();
  }, [reload]);

  const handleSubmitted = (star: StarRow) => {
    setStars((prev) => {
      if (prev.some((s) => s.id === star.id)) return prev;
      return [...prev, star].sort((a, b) =>
        a.created_at.localeCompare(b.created_at),
      );
    });
    setTab("observe");
    reload();
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
            <TabsTrigger value="observe">Contemplation Mode</TabsTrigger>
          </TabsList>
          <TabsContent value="input" className="pt-6">
            <Recorder onSubmitted={handleSubmitted} />
          </TabsContent>
          <TabsContent value="observe" className="pt-6">
            <Constellation stars={stars} onPlay={playStar} activeId={activeId} />
            <p className="mt-3 text-center text-xs text-muted-foreground">
              {stars.length} {stars.length === 1 ? "star" : "stars"} · click a
              star to listen
            </p>
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
