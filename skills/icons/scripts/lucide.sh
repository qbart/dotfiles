#!/usr/bin/env bash
# Search and fetch Lucide icons (https://lucide.dev/icons/) via the lucide-static npm package.
#
#   lucide.sh search <term...> [-n N]   rank icons by name/tag match
#   lucide.sh get <name...> [--min]     print SVG(s); --min = single line, for string constants
#   lucide.sh version                   print cached lucide-static version
#   lucide.sh refresh                   force re-download of the index
set -euo pipefail

CDN="https://unpkg.com/lucide-static"
CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/lucide-icons"
TTL_DAYS=7

mkdir -p "$CACHE"

refresh() {
  local version
  version=$(curl -fsSL "https://registry.npmjs.org/lucide-static/latest" | jq -r .version)
  curl -fsSL "$CDN@$version/tags.json" -o "$CACHE/tags.json.tmp"
  mv "$CACHE/tags.json.tmp" "$CACHE/tags.json"
  echo "$version" > "$CACHE/version"
  rm -rf "$CACHE/svg"
}

ensure_index() {
  if [[ ! -s "$CACHE/tags.json" || ! -s "$CACHE/version" ]] ||
     [[ -n $(find "$CACHE/tags.json" -mtime +"$TTL_DAYS" 2>/dev/null) ]]; then
    refresh || [[ -s "$CACHE/tags.json" ]] # fall back to stale cache when offline
  fi
}

search() {
  local limit=15 terms=()
  while (($#)); do
    case $1 in
      -n) limit=$2; shift 2 ;;
      *) terms+=("$1"); shift ;;
    esac
  done
  ((${#terms[@]})) || { echo "usage: lucide.sh search <term...> [-n N]" >&2; exit 1; }

  jq -r --argjson limit "$limit" --arg q "${terms[*]}" '
    ($q | ascii_downcase | split(" ") | map(select(length > 0))) as $words
    | to_entries
    | map(
        .key as $name | .value as $tags
        | {name: $name, tags: $tags, score: ($words | map(
            . as $w
            | if $name == $w then 10
              elif ($name | split("-") | index($w)) then 6
              elif ($name | contains($w)) then 4
              elif ($tags | index($w)) then 3
              elif ($tags | any(contains($w))) then 1
              else 0 end
          ) | add)}
      )
    | map(select(.score > 0))
    | sort_by(-.score, (.name | length), .name)
    | .[:$limit][]
    | "\(.name)\t\(.tags | join(", "))"
  ' "$CACHE/tags.json"
}

get() {
  local min=0 names=()
  while (($#)); do
    case $1 in
      --min) min=1; shift ;;
      *) names+=("$1"); shift ;;
    esac
  done
  ((${#names[@]})) || { echo "usage: lucide.sh get <name...> [--min]" >&2; exit 1; }

  local version name file rc=0
  version=$(cat "$CACHE/version")
  mkdir -p "$CACHE/svg"
  for name in "${names[@]}"; do
    file="$CACHE/svg/$name.svg"
    if [[ ! -s $file ]]; then
      # tags.json lists canonical names only; legacy aliases (e.g. home -> house) still exist as SVGs
      if ! curl -fsSL "$CDN@$version/icons/$name.svg" 2>/dev/null | sed '/^<!--.*-->$/d' > "$file.tmp" || [[ ! -s $file.tmp ]]; then
        rm -f "$file.tmp"
        echo "unknown icon: $name (try: lucide.sh search $name)" >&2
        rc=1
        continue
      fi
      mv "$file.tmp" "$file"
    fi
    if ((min)); then
      tr '\n' ' ' < "$file" | sed -E 's/[[:space:]]+/ /g; s/ ?(\/?>) ?/\1/g; s/^ //'
      echo
    else
      cat "$file"
    fi
  done
  return $rc
}

cmd=${1:-}; shift || true
case $cmd in
  search) ensure_index; search "$@" ;;
  get) ensure_index; get "$@" ;;
  version) ensure_index; cat "$CACHE/version" ;;
  refresh) refresh; cat "$CACHE/version" ;;
  *) sed -n '2,7p' "$0" | sed 's/^# \{0,1\}//'; exit 1 ;;
esac
