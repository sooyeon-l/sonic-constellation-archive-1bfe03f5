import type { ConstellationWithStars, StarRow } from "@/lib/stars";
import { ContemplationScene } from "./ContemplationScene";

interface Props {
  constellations: ConstellationWithStars[];
  onPlay: (star: StarRow) => void;
  onPlaySynth: (c: ConstellationWithStars) => void;
  activeStarId: string | null;
}

export function ConstellationArchive(props: Props) {
  return <ContemplationScene {...props} />;
}
