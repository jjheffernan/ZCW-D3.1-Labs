#!/usr/bin/env bash
# progress-stats.sh — Count sprint/migrate checkboxes in docs/PROGRESS.md
# Usage:
#   ./scripts/progress-stats.sh          # print stats to stdout
#   ./scripts/progress-stats.sh --write  # update dashboard section in PROGRESS.md

set -euo pipefail

PROGRESS="${1:-docs/PROGRESS.md}"
if [[ "${1:-}" == "--write" ]]; then
  PROGRESS="docs/PROGRESS.md"
fi

[[ -f "$PROGRESS" ]] || { echo "Missing $PROGRESS"; exit 1; }

# Only count Full Tracker data rows (filter tag in first column)
tracker=$(sed -n '/^## Full Tracker/,/^## Legend/p' "$PROGRESS" | \
  grep -E '^\| `\[filter:(java|python|data-engineering|sql|kafka|web|reference)\]' || true)

core_tracker=$(echo "$tracker" | grep -vE '^\| `\[filter:reference\]' || true)

sprint_done=$(echo "$core_tracker" | grep -cE '\| - \[x\] \| - \[[ x]\] \|' || true)
sprint_open=$(echo "$core_tracker" | grep -cE '\| - \[ \] \| - \[[ x]\] \|' || true)
sprint_total=$((sprint_done + sprint_open))

migrate_done=$(echo "$core_tracker" | grep -cE '\| - \[[ x]\] \| - \[x\] \|' || true)
migrate_open=$(echo "$core_tracker" | grep -cE '\| - \[[ x]\] \| - \[ \] \|' || true)
migrate_total=$((migrate_done + migrate_open))

ref_section=$(echo "$tracker" | grep -E '^\| `\[filter:reference\]' || true)
ref_total=$(echo "$ref_section" | wc -l | tr -d ' ')
ref_done=$(echo "$ref_section" | grep -cE '\| - \[x\] \| - \[[ x]\] \|' || true)
core2022_done=$(echo "$core_tracker" | grep -c '✅ 2022' || true)
core2022_skip=$(echo "$core_tracker" | grep -c '⬜ 2022' || true)
core_total=$((core2022_done + core2022_skip))

pct() {
  local done=$1 total=$2
  if [[ "$total" -eq 0 ]]; then echo "0"; return; fi
  echo $((done * 100 / total))
}

sprint_pct=$(pct "$sprint_done" "$sprint_total")
migrate_pct=$(pct "$migrate_done" "$migrate_total")
baseline_pct=$(pct "$core2022_done" "$core_total")
ref_pct=$(pct "$ref_done" "$ref_total")

bar() {
  local pct=$1 width=20
  local filled=$((pct * width / 100))
  local empty=$((width - filled))
  printf '%*s' "$filled" '' | tr ' ' '█'
  printf '%*s' "$empty" '' | tr ' ' '░'
}

SPRINT_BAR=$(bar "$sprint_pct")
MIGRATE_BAR=$(bar "$migrate_pct")

cat <<EOF
Progress — $(basename "$PROGRESS")
─────────────────────────────────
Sprint (re-done):     $sprint_done / $sprint_total  (${sprint_pct}%)
Migrated:             $migrate_done / $migrate_total  (${migrate_pct}%)
2022 baseline:        $core2022_done / $core_total  (${baseline_pct}%)
Reference (optional): $ref_done / $ref_total  (${ref_pct}%)

Sprint  [$SPRINT_BAR] ${sprint_pct}%
Migrate [$MIGRATE_BAR] ${migrate_pct}%
EOF

if [[ "${1:-}" == "--write" ]]; then
  TMP=$(mktemp)
  awk -v sd="$sprint_done" -v st="$sprint_total" -v sp="$sprint_pct" \
      -v md="$migrate_done" -v mt="$migrate_total" -v mp="$migrate_pct" \
      -v bd="$core2022_done" -v bt="$core_total" -v bp="$baseline_pct" \
      -v rd="$ref_done" -v rt="$ref_total" -v rp="$ref_pct" \
      -v sb="$SPRINT_BAR" -v mb="$MIGRATE_BAR" '
    /<!-- AUTO:START dashboard -->/ { inblock=1; print; next }
    /<!-- AUTO:END dashboard -->/ {
      print "| **Sprint (re-done)** | " sd " | " st " | " sp "% |"
      print "| **Migrated to monorepo** | " md " | " mt " | " mp "% |"
      print "| **2022 baseline** | " bd " | " bt " | " bp "% |"
      print "| Reference (optional) | " rd " | " rt " | " rp "% |"
      print ""
      print "**Sprint:** `" sb "` " sp "%  "
      print "**Migrate:** `" mb "` " mp "%"
      inblock=0; print; next
    }
    inblock { next }
    { print }
  ' "$PROGRESS" > "$TMP"
  mv "$TMP" "$PROGRESS"
  echo ""
  echo "Updated dashboard in $PROGRESS"
fi
