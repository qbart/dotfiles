---
name: icons
allowed-tools: Bash(${CLAUDE_SKILL_DIR}/scripts/lucide.sh *)
description: Find and fetch Lucide icons (https://lucide.dev/icons/) as raw SVG. Use whenever the user asks for an icon, or whenever code being written needs one — a button, nav item, status indicator, empty state, inline SVG in HTML/templates, or an SVG string embedded in a constant (Go, TS/JS, Python, etc.). Suggests matching icon names, then returns the real SVG markup, optionally minified to a single line for string constants.
---

# Lucide icons

Icons come from the `lucide-static` npm package (the same source lucide.dev renders), via
`${CLAUDE_SKILL_DIR}/scripts/lucide.sh`. The script caches the name/tag index in
`~/.cache/lucide-icons` (refreshed weekly) and caches each fetched SVG.

**Never write Lucide SVG paths from memory.** Always fetch them with the script, since guessed path data looks plausible but renders wrong.

## Workflow

1. **Search** for candidates by intent words (synonyms help):

   ```bash
   ${CLAUDE_SKILL_DIR}/scripts/lucide.sh search delete remove -n 10
   ```

   Output is `name<TAB>tags`, best match first. Matching ranks exact name > name segment > name substring > tag.

2. **Suggest** 2–5 good options to the user with a short note on each and a link
   `https://lucide.dev/icons/<name>` so they can preview. If the need is unambiguous (e.g. "close
   button" → `x`), skip asking and just pick one, mentioning alternatives in one line.

3. **Fetch** the SVG:

   ```bash
   ${CLAUDE_SKILL_DIR}/scripts/lucide.sh get trash-2            # pretty, multi-line
   ${CLAUDE_SKILL_DIR}/scripts/lucide.sh get trash-2 x --min    # one line each, for string constants
   ```

   `get` also accepts legacy alias names (e.g. `home`, `alert-circle`) but prefer the canonical
   names that `search` returns. A missing name exits non-zero.

## Embedding as a string constant

Use `--min`. The SVG uses double quotes for attributes, so pick a string literal that does not
need escaping:

- Go: raw string with backticks `` const IconTrash = `<svg ...>` ``
- TS/JS: backticks or single quotes
- Python: single quotes or `"""..."""`
- If the language forces double quotes, escape `"` as `\"`.

Name constants after the icon (`IconTrash2`, `ICON_CHEVRON_DOWN`) and, if several are added,
group them together in one place, matching the project's existing conventions if any.

## Adjusting the SVG

Default attributes: `width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"`.

- **Size**: change `width`/`height` only, and keep `viewBox="0 0 24 24"`. Or drop width/height and size it via CSS.
- **Color**: leave `stroke="currentColor"` so it inherits text color, unless a fixed color is requested.
- **Stroke**: `stroke-width` of 1.5 looks lighter and 2 is the default. To keep the stroke constant when scaling, add `vector-effect="non-scaling-stroke"` to the children or let CSS handle it.
- **Class**: the `class="lucide lucide-<name>"` attribute can be kept, replaced, or removed to fit the project's styling, and Tailwind classes can go here.
- **Accessibility**: decorative icons should get `aria-hidden="true"`. Standalone meaningful icons need `role="img"` plus `aria-label` (or a `<title>`).

Only change attributes the user or the codebase calls for, and otherwise keep the fetched markup as is.

## Other commands

- `${CLAUDE_SKILL_DIR}/scripts/lucide.sh version`: the cached lucide-static version
- `${CLAUDE_SKILL_DIR}/scripts/lucide.sh refresh`: force re-downloading the index, e.g. when an icon on lucide.dev isn't found

Lucide is ISC-licensed, so no attribution is required in output.
