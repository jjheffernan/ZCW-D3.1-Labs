#!/usr/bin/env bash
# create-branch-triplet.sh — Create as-is, stock, refresher branches for a lab
# Usage: ./scripts/create-branch-triplet.sh <repo-name> <monorepo-path>
# Must be run from monorepo root after migrate-lab.sh

set -euo pipefail

REPO="${1:?Usage: create-branch-triplet.sh <repo-name> <monorepo-path>}"
LAB_PATH="${2:?Usage: create-branch-triplet.sh <repo-name> <monorepo-path>}"
OWNER="jjheffernan"

DEFAULT=$(gh api "repos/$OWNER/$REPO" --jq '.default_branch')
AS_IS=$(gh api "repos/$OWNER/$REPO/git/refs/heads/$DEFAULT" --jq '.object.sha')

FIRST_JJ=$(gh api "repos/$OWNER/$REPO/commits?author=jjheffernan&per_page=100" \
  --jq 'if length > 0 then .[-1].sha else empty end')

if [ -n "$FIRST_JJ" ]; then
  STOCK=$(gh api "repos/$OWNER/$REPO/commits/$FIRST_JJ" --jq '.parents[0].sha')
else
  STOCK="$AS_IS"
fi

PARENT=$(gh api "repos/$OWNER/$REPO" --jq '.parent.full_name // empty')
if [ -n "$PARENT" ]; then
  PARENT_DEFAULT=$(gh api "repos/$PARENT" --jq '.default_branch')
  REFRESHER=$(gh api "repos/$PARENT/git/refs/heads/$PARENT_DEFAULT" --jq '.object.sha')
else
  REFRESHER="$STOCK"
fi

PREFIX="lab/${LAB_PATH}"
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

for STATE_SHA in "as-is:$AS_IS" "stock:$STOCK" "refresher:$REFRESHER"; do
  STATE="${STATE_SHA%%:*}"
  SHA="${STATE_SHA##*:}"
  BRANCH="${PREFIX}/${STATE}"

  echo "==> Creating $BRANCH from $SHA..."

  git clone --depth=1 "https://github.com/$OWNER/$REPO.git" "$TMPDIR/clone" 2>/dev/null
  cd "$TMPDIR/clone"
  git fetch --depth=1 origin "$SHA" 2>/dev/null || true
  git checkout "$SHA" 2>/dev/null || git checkout "$DEFAULT"

  cd - > /dev/null
  rm -rf "$LAB_PATH"
  mkdir -p "$(dirname "$LAB_PATH")"
  rsync -a --exclude='.git' --exclude='target' --exclude='__pycache__' \
    "$TMPDIR/clone/" "$LAB_PATH/"

  git add "$LAB_PATH"
  git commit -m "lab($REPO): $STATE state at $SHA" --allow-empty 2>/dev/null || \
    git commit -m "lab($REPO): $STATE state at $SHA"
  git branch -f "$BRANCH" HEAD
  echo "    Created $BRANCH"
done

echo "==> Branch triplet created for $REPO"
