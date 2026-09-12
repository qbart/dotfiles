# Resize Windows

Arrange the windows on the current screen side by side, with widths in the proportions you type.

`1:2:1` makes three columns: a quarter, a half, and a quarter of the screen.

## Setup (macOS)

```sh
npm install
npm run dev
```

`npm run dev` imports the extension into Raycast. Once it is imported you can stop the dev server; the command stays installed.

Window moving uses Raycast's Window Management API, which requires **Raycast Pro**.

## Usage

**As a command with an argument:** search for "Resize Windows" (or give it an alias such as `rs` in Raycast Settings → Extensions), press <kbd>Tab</kbd>, type `1:2:1`, press <kbd>Enter</kbd>.

**As a fallback command** (closest to `:resize 1:2:1`): in Raycast's root search, open the action panel and choose "Manage Fallback Commands", then add Resize Windows and move it to the top. Now typing `:resize 1:2:1` and pressing <kbd>Enter</kbd> runs it, provided nothing else in Raycast matches the text.

## Which windows get arranged

- Only windows on the screen that holds the active window, on the current desktop.
- Fullscreen windows and windows that can't be moved or resized are skipped.
- If there are more windows than ratio parts, the active window is always included and the rest are taken in the order Raycast reports them.
- The chosen windows keep their current left-to-right order.
- If there are fewer windows than parts, the extra parts are dropped (`1:2:1` with two windows becomes `1:2`).
- The menu bar and Dock are respected.

## Preferences

- **Gap**: pixels between windows and around the screen edges (default `0`).
