#!/usr/bin/env bash
# migrate-lab.sh — Import a jjheffernan lab repo into the monorepo
# Usage: ./scripts/migrate-lab.sh <repo-name> <monorepo-path>
# Example: ./scripts/migrate-lab.sh Maven.TooLargeTooSmall labs/java/03-too-large-too-small

set -euo pipefail

REPO="${1:?Usage: migrate-lab.sh <repo-name> <monorepo-path>}"
LAB_PATH="${2:?Usage: migrate-lab.sh <repo-name> <monorepo-path>}"
OWNER="jjheffernan"
TMPDIR=$(mktemp -d)

trap 'rm -rf "$TMPDIR"' EXIT

echo "==> Cloning $OWNER/$REPO..."
gh repo clone "$OWNER/$REPO" "$TMPDIR/repo" -- --depth=1 2>/dev/null || \
  git clone --depth=1 "https://github.com/$OWNER/$REPO.git" "$TMPDIR/repo"

echo "==> Copying to $LAB_PATH..."
mkdir -p "$LAB_PATH"
rsync -a --exclude='.git' --exclude='target' --exclude='__pycache__' \
  --exclude='.ipynb_checkpoints' --exclude='.venv' \
  "$TMPDIR/repo/" "$LAB_PATH/"

echo "==> Gathering metadata..."
DEFAULT=$(gh api "repos/$OWNER/$REPO" --jq '.default_branch')
PARENT=$(gh api "repos/$OWNER/$REPO" --jq '.parent.full_name // "ORIGINAL"')
AS_IS=$(gh api "repos/$OWNER/$REPO/git/refs/heads/$DEFAULT" --jq '.object.sha')
FIRST_JJ=$(gh api "repos/$OWNER/$REPO/commits?author=jjheffernan&per_page=100" \
  --jq 'if length > 0 then .[-1] | "\(.sha)|\(.commit.author.date)" else "NONE|NONE" end')
JJ_COUNT=$(gh api "repos/$OWNER/$REPO/commits?author=jjheffernan&per_page=100" --jq 'length')

IFS='|' read -r FIRST_JJ_SHA FIRST_JJ_DATE <<< "$FIRST_JJ"

if [ "$FIRST_JJ_SHA" != "NONE" ]; then
  STOCK=$(gh api "repos/$OWNER/$REPO/commits/$FIRST_JJ_SHA" --jq '.parents[0].sha')
else
  STOCK="$AS_IS"
fi

if [ "$PARENT" != "ORIGINAL" ] && [ -n "$PARENT" ]; then
  PARENT_DEFAULT=$(gh api "repos/$PARENT" --jq '.default_branch')
  REFRESHER=$(gh api "repos/$PARENT/git/refs/heads/$PARENT_DEFAULT" --jq '.object.sha')
else
  REFRESHER="$STOCK"
fi

cat > "$LAB_PATH/LAB-META.md" << EOF
# Lab Metadata

| Field | Value |
|-------|-------|
| Original repo | https://github.com/$OWNER/$REPO |
| Parent fork | $PARENT |
| Monorepo path | \`$LAB_PATH\` |
| as-is SHA | \`$AS_IS\` |
| stock SHA | \`$STOCK\` |
| refresher SHA | \`$REFRESHER\` |
| First JJ commit | $FIRST_JJ_DATE |
| JJ commits | $JJ_COUNT |
| Migrated | $(date -u +%Y-%m-%d) |
EOF

echo "==> Done. Files in $LAB_PATH/"
echo "    Next: ./scripts/create-branch-triplet.sh $REPO $LAB_PATH"
