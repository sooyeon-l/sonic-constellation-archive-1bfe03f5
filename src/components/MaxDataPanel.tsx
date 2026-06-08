import { useState } from "react";
import {
  Collapsible,
  CollapsibleContent,
  CollapsibleTrigger,
} from "@/components/ui/collapsible";
import { Button } from "@/components/ui/button";

const EXAMPLE = {
  id: "8f2c…uuid",
  audio_url: "https://…/star-audio/recordings/8f2c.webm?token=…",
  max_audio_url: null,
  audio_path: "recordings/8f2c.webm",
  mime_type: "audio/webm;codecs=opus",
  duration_seconds: 4.82,
  volume_peak: 0.71,
  volume_average: 0.18,
  x_position: 0.42,
  y_position: 0.61,
  color: "#fde68a",
  created_at: "2026-06-08T12:00:00.000Z",
};

export function MaxDataPanel() {
  const [origin, setOrigin] = useState("");
  if (typeof window !== "undefined" && !origin) setOrigin(window.location.origin);

  const all = `${origin}/api/public/stars`;
  const latest = `${origin}/api/public/stars/latest`;

  return (
    <Collapsible className="rounded-lg border border-border/30 bg-card/30 p-4">
      <CollapsibleTrigger asChild>
        <Button variant="ghost" className="w-full justify-between">
          <span>Max 9 / data endpoints</span>
          <span className="text-xs text-muted-foreground">click to toggle</span>
        </Button>
      </CollapsibleTrigger>
      <CollapsibleContent className="mt-3 space-y-3 text-sm">
        <div>
          <div className="text-xs uppercase text-muted-foreground">All stars</div>
          <div className="flex items-center gap-2">
            <code className="flex-1 break-all rounded bg-black/40 p-2 text-xs">{all}</code>
            <Button
              size="sm"
              variant="outline"
              onClick={() => navigator.clipboard.writeText(all)}
            >
              Copy
            </Button>
          </div>
        </div>
        <div>
          <div className="text-xs uppercase text-muted-foreground">Latest star</div>
          <div className="flex items-center gap-2">
            <code className="flex-1 break-all rounded bg-black/40 p-2 text-xs">{latest}</code>
            <Button
              size="sm"
              variant="outline"
              onClick={() => navigator.clipboard.writeText(latest)}
            >
              Copy
            </Button>
          </div>
        </div>
        <div>
          <div className="text-xs uppercase text-muted-foreground">Example payload</div>
          <pre className="overflow-x-auto rounded bg-black/40 p-3 text-xs">
{JSON.stringify(EXAMPLE, null, 2)}
          </pre>
        </div>
        <p className="text-xs text-muted-foreground">
          Max can poll these endpoints with a Max HTTP/network object or a small
          Node-for-Max bridge. Download/cache audio locally first, then load
          into Max playback objects such as <code>sfplay~</code> or{" "}
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