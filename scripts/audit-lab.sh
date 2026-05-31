#!/usr/bin/env bash
# audit-lab.sh — Verify a lab directory has required metadata
# Usage: ./scripts/audit-lab.sh <monorepo-path>

set -euo pipefail

LAB_PATH="${1:?Usage: audit-lab.sh <monorepo-path>}"
ERRORS=0

check() {
  if [ "$1" = "false" ]; then
    echo "  FAIL: $2"
    ERRORS=$((ERRORS + 1))
  else
    echo "  OK: $2"
  fi
}

echo "Auditing $LAB_PATH..."

[ -d "$LAB_PATH" ] && check true "directory exists" || check false "directory exists"
[ -f "$LAB_PATH/LAB-META.md" ] && check true "LAB-META.md present" || check false "LAB-META.md present"

if [ -f "$LAB_PATH/LAB-META.md" ]; then
  grep -q "as-is SHA" "$LAB_PATH/LAB-META.md" && check true "as-is SHA recorded" || check false "as-is SHA recorded"
  grep -q "stock SHA" "$LAB_PATH/LAB-META.md" && check true "stock SHA recorded" || check false "stock SHA recorded"
  grep -q "refresher SHA" "$LAB_PATH/LAB-META.md" && check true "refresher SHA recorded" || check false "refresher SHA recorded"
fi

for STATE in as-is stock refresher; do
  BRANCH="lab/${LAB_PATH}/${STATE}"
  if git show-ref --verify --quiet "refs/heads/$BRANCH" 2>/dev/null; then
    check true "branch $BRANCH exists"
  else
    check false "branch $BRANCH exists"
  fi
done

if [ "$ERRORS" -eq 0 ]; then
  echo "PASS: $LAB_PATH"
else
  echo "FAIL: $LAB_PATH ($ERRORS errors)"
  exit 1
fi
