import { useCallback, useEffect, useState } from "react";
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from "@/components/ui/collapsible";
import { Button } from "@/components/ui/button";

const GET_ENDPOINTS = [
  {
    label: "Pending constellations (Max polls this)",
    path: "/api/public/constellations/pending",
  },
  { label: "All constellations", path: "/api/public/constellations" },
  { label: "Latest star", path: "/api/public/stars/latest" },
] as const;

const POST_ENDPOINTS = [
  "/api/public/constellations/:id/mark-synthesizing",
  "/api/public/constellations/:id/mark-ready",
  "/api/public/constellations/:id/mark-failed",
] as const;

type Health = "checking" | "json" | "not-json" | "error";

interface ConstellationJson {
  id: string;
  status?: string;
  synth_audio_url?: string | null;
  stars?: { audio_url?: string }[];
}

function isSignedUrl(url: string | undefined | null): boolean {
  if (!url) return false;
  return url.includes("?token=") || url.includes("/object/sign/");
}

export function MaxDataPanel() {
  const [origin, setOrigin] = useState("");
  const [health, setHealth] = useState<Record<string, Health>>({});
  const [pendingPreview, setPendingPreview] = useState<string | null>(null);
  const [warnings, setWarnings] = useState<string[]>([]);

  useEffect(() => {
    if (typeof window !== "undefined") setOrigin(window.location.origin);
  }, []);

  const runChecks = useCallback(async () => {
    const nextHealth: Record<string, Health> = {};
    for (const e of GET_ENDPOINTS) nextHealth[e.path] = "checking";
    setHealth({ ...nextHealth });

    const nextWarnings: string[] = [];
    let allConstellations: ConstellationJson[] = [];

    await Promise.all(
      GET_ENDPOINTS.map(async (e) => {
        try {
          const res = await fetch(e.path, {
            headers: { Accept: "application/json" },
          });
          const text = await res.text();
          let parsed: unknown = null;
          try {
            parsed = JSON.parse(text);
            nextHealth[e.path] = "json";
          } catch {
            nextHealth[e.path] = "not-json";
            if (text.trimStart().toLowerCase().startsWith("<!doctype")) {
              nextWarnings.push(
                `${e.path} returned the HTML shell instead of JSON.`,
              );
            }
            return;
          }
          if (e.path === "/api/public/constellations" && Array.isArray(parsed)) {
            allConstellations = parsed as ConstellationJson[];
          }
          if (
            e.path === "/api/public/stars/latest" &&
            parsed &&
            typeof parsed === "object" &&
            isSignedUrl((parsed as { audio_url?: string }).audio_url)
          ) {
            nextWarnings.push(
              "Latest star audio_url is a signed/temporary URL — enable public buckets for stable URLs.",
            );
          }
        } catch {
          nextHealth[e.path] = "error";
        }
      }),
    );

    const pending = allConstellations.filter(
      (c) => c.status === "pending_synthesis",
    );
    setPendingPreview(
      pending.length > 0
        ? JSON.stringify(pending[pending.length - 1], null, 2)
        : null,
    );

    const signedStar = allConstellations.some((c) =>
      (c.stars ?? []).some((s) => isSignedUrl(s.audio_url)),
    );
    if (signedStar) {
      nextWarnings.push(
        "Some star audio_urls are signed/temporary URLs (contain a token). Enable public buckets so Max gets stable URLs.",
      );
    }
    const readyMissingSynth = allConstellations.filter(
      (c) => c.status === "ready" && !c.synth_audio_url,
    );
    if (readyMissingSynth.length > 0) {
      nextWarnings.push(
        `${readyMissingSynth.length} constellation(s) are marked ready but have no synth_audio_url.`,
      );
    }

    setHealth({ ...nextHealth });
    setWarnings(nextWarnings);
  }, []);

  useEffect(() => {
    runChecks();
  }, [runChecks]);

  const healthIcon = (h: Health | undefined) => {
    if (h === "json") return <span className="text-emerald-300">✓ JSON</span>;
    if (h === "not-json") return <span className="text-red-300">✗ not JSON</span>;
    if (h === "error") return <span className="text-red-300">✗ unreachable</span>;
    return <span className="text-muted-foreground">…</span>;
  };

  return (
    <Collapsible className="rounded-lg border border-border/30 bg-card/30 p-4">
      <CollapsibleTrigger asChild>
        <Button variant="ghost" className="w-full justify-between">
          <span>Max 9 integration</span>
          <span className="text-xs text-muted-foreground">click to toggle</span>
        </Button>
      </CollapsibleTrigger>
      <CollapsibleContent className="mt-3 space-y-3 text-sm">
        {GET_ENDPOINTS.map((e) => {
          const url = `${origin}${e.path}`;
          return (
            <div key={e.path}>
              <div className="flex items-center justify-between text-xs uppercase text-muted-foreground">
                <span>{e.label}</span>
                <span className="normal-case">{healthIcon(health[e.path])}</span>
              </div>
              <div className="flex items-center gap-2">
                <code className="flex-1 break-all rounded bg-black/40 p-2 text-xs">
                  {url}
                </code>
                <Button
                  size="sm"
                  variant="outline"
                  onClick={() => navigator.clipboard.writeText(url)}
                >
                  Copy
                </Button>
              </div>
            </div>
          );
        })}

        <div className="flex items-center justify-between">
          <span className="text-xs text-muted-foreground">
            Health checks verify each endpoint returns raw JSON (not the HTML
            shell).
          </span>
          <Button size="sm" variant="outline" onClick={runChecks}>
            Re-run checks
          </Button>
        </div>

        {warnings.length > 0 && (
          <div className="rounded border border-red-400/30 bg-red-400/10 p-3 text-xs text-red-200">
            <div className="mb-1 font-medium">Warnings</div>
            <ul className="list-disc space-y-1 pl-4">
              {warnings.map((w) => (
                <li key={w}>{w}</li>
              ))}
            </ul>
          </div>
        )}

        <div>
          <div className="text-xs uppercase text-muted-foreground">
            Status endpoints (POST, Max worker only)
          </div>
          <div className="mt-1 space-y-1">
            {POST_ENDPOINTS.map((p) => (
              <code key={p} className="block break-all rounded bg-black/40 p-2 text-xs">
                POST {origin}
                {p}
              </code>
            ))}
          </div>
          <p className="mt-2 rounded border border-amber-300/30 bg-amber-300/5 p-2 text-xs text-amber-100/90">
            POST status endpoints require the{" "}
            <code>X-Max-Worker-Secret</code> header (set in Node-for-Max; the
            secret value is never shown here). Invalid transitions return 409
            JSON: pending_synthesis → synthesizing → ready/failed.
          </p>
        </div>

        <div>
          <div className="text-xs uppercase text-muted-foreground">
            Latest pending constellation
          </div>
          {pendingPreview ? (
            <pre className="max-h-64 overflow-auto rounded bg-black/40 p-3 text-xs">
              {pendingPreview}
            </pre>
          ) : (
            <p className="rounded bg-black/40 p-2 text-xs text-muted-foreground">
              No pending constellations right now.
            </p>
          )}
        </div>

        <p className="text-xs text-muted-foreground">
          Max worker loop: poll <code>/constellations/pending</code> → POST{" "}
          <code>mark-synthesizing</code> → render a WAV locally → upload it to
          storage at <code>star-audio/synthesized/&#123;id&#125;.wav</code> →
          POST <code>mark-ready</code> with the public WAV URL. Download/cache
          star audio locally first, then load into <code>sfplay~</code> or{" "}
          <code>buffer~</code>/<code>groove~</code>. Prefer{" "}
          <code>max_audio_url</code> (WAV/AIFF) when present; otherwise{" "}
          <code>audio_url</code> (webm/opus).
        </p>
        <div className="rounded border border-amber-300/30 bg-amber-300/5 p-3 text-xs text-amber-100/90">
          <div className="mb-1 font-medium text-amber-200">Max / audio compatibility</div>
          <ul className="list-disc space-y-1 pl-4">
            <li>
              <code>audio_url</code> is currently <code>audio/webm;codecs=opus</code>.
              Max's <code>sfplay~</code> and <code>buffer~</code> do <em>not</em>
              decode webm/opus natively — download the file, then transcode to
              WAV/AIFF (e.g. via <code>ffmpeg -i in.webm out.wav</code>) before
              loading into a buffer.
            </li>
            <li>
              A Node-for-Max bridge can do the fetch + ffmpeg step on the fly
              and hand a local <code>.wav</code> path to <code>buffer~</code>.
            </li>
            <li>
              <code>max_audio_url</code> is reserved for a future server-side
              WAV/AIFF render of each recording. When present, prefer it and
              skip the transcode step entirely.
            </li>
          </ul>
        </div>
      </CollapsibleContent>
    </Collapsible>
  );
}