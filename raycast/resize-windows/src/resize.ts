import { getPreferenceValues, LaunchProps, showHUD, WindowManagement } from "@raycast/api";
import { runAppleScript, showFailureToast } from "@raycast/utils";
import { columns, contains, parseRatios, Rect } from "./layout";

type Screen = { frame: Rect; visible: Rect };
type PlacedWindow = WindowManagement.Window & { bounds: Exclude<WindowManagement.Window["bounds"], "fullscreen"> };

// The Window Management API has no notion of the menu bar or Dock, so ask AppKit for each screen's visible frame.
// NSScreen uses a bottom-left origin; window bounds use a top-left origin anchored at the primary screen.
const SCREENS_SCRIPT = `
ObjC.import("AppKit");
const screens = $.NSScreen.screens.js;
const primaryHeight = screens[0].frame.size.height;
const flip = (r) => ({ x: r.origin.x, y: primaryHeight - r.origin.y - r.size.height, width: r.size.width, height: r.size.height });
JSON.stringify(screens.map((s) => ({ frame: flip(s.frame), visible: flip(s.visibleFrame) })));
`;

async function getScreens(): Promise<Screen[]> {
  return JSON.parse(await runAppleScript(SCREENS_SCRIPT, { language: "JavaScript" }));
}

function isPlaced(window: WindowManagement.Window): window is PlacedWindow {
  return window.bounds !== "fullscreen";
}

function center({ bounds }: PlacedWindow) {
  return { x: bounds.position.x + bounds.size.width / 2, y: bounds.position.y + bounds.size.height / 2 };
}

export default async function Command(props: LaunchProps<{ arguments: { ratio?: string } }>) {
  const input = props.arguments.ratio?.trim() || props.fallbackText || "";
  const ratios = parseRatios(input);
  if (!ratios) {
    await showHUD(input ? `Invalid ratio "${input}", use e.g. 1:2:1` : "Enter a ratio, e.g. 1:2:1");
    return;
  }

  const gap = Math.max(0, Number(getPreferenceValues<{ gap?: string }>().gap) || 0);

  try {
    const [screens, windows] = await Promise.all([getScreens(), WindowManagement.getWindowsOnActiveDesktop()]);
    const placed = windows.filter(isPlaced);

    // Arrange the screen that holds the active window, falling back to the primary screen.
    const active = placed.find((w) => w.active);
    const screen = (active && screens.find((s) => contains(s.frame, center(active)))) ?? screens[0];

    // Prefer the active window, then keep the API's order; finally lay them out in their current left-to-right order.
    const chosen = placed
      .filter((w) => w.positionable && w.resizable && contains(screen.frame, center(w)))
      .sort((a, b) => Number(b.active) - Number(a.active))
      .slice(0, ratios.length)
      .sort((a, b) => a.bounds.position.x - b.bounds.position.x);

    if (chosen.length === 0) {
      await showHUD("No windows to arrange on this screen");
      return;
    }

    const used = ratios.slice(0, chosen.length);
    const rects = columns(screen.visible, used, gap);

    for (const [i, window] of chosen.entries()) {
      const { x, y, width, height } = rects[i];
      await WindowManagement.setWindowBounds({
        id: window.id,
        bounds: { position: { x, y }, size: { width, height } },
      });
    }

    await showHUD(`Arranged ${chosen.length} window${chosen.length === 1 ? "" : "s"} as ${used.join(":")}`);
  } catch (error) {
    await showFailureToast(error, { title: "Could not arrange windows" });
  }
}
