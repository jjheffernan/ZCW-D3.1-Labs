# Branch Strategy

Every migrated lab gets three branches. This lets you compare your work, restart exercises, and see the original assignment state.

## Branch Definitions

| Branch | Name pattern | Contents | Use case |
|--------|-------------|----------|----------|
| **as-is** | `labs/<path>/as-is` | JJ's completed work — current HEAD of original repo | Reference your 2022 solutions |
| **stock** | `labs/<path>/stock` | Repo state **before** JJ's first commit | See the assignment as given |
| **refresher** | `labs/<path>/refresher` | Fresh copy from upstream parent fork | Re-do the exercise from scratch |

## Visual

```
Upstream parent (ZCW-Data3-1/Part1)
        │
        ▼ fork
   ┌─────────┐
   │  stock   │  ← state when JJ forked (before any JJ commits)
   └────┬────┘
        │ JJ commits (2022)
        ▼
   ┌─────────┐
   │  as-is   │  ← JJ's completed solution
   └─────────┘

   ┌─────────────┐
   │  refresher   │  ← re-forked from upstream (may differ from stock if upstream updated)
   └─────────────┘
```

## Determining Branch Points

### For repos WITH JJ commits

```bash
REPO="Maven.TooLargeTooSmall"
OWNER="jjheffernan"

> **Note:** Commit counts from `gh api ...&per_page=100` cap at 100. For repos with more history (e.g. Django-Auto-Forum ~185), paginate or use the `Link` header `rel="last"` page number.
FIRST_JJ=$(gh api "repos/$OWNER/$REPO/commits?author=jjheffernan&per_page=100" \
  --jq '.[-1].sha')

# Stock = parent of first JJ commit
STOCK_SHA=$(gh api "repos/$OWNER/$REPO/commits/$FIRST_JJ" \
  --jq '.parents[0].sha')

# As-is = current default branch HEAD
AS_IS_SHA=$(gh api "repos/$OWNER/$REPO/git/refs/heads/master" \
  --jq '.object.sha' 2>/dev/null || \
  gh api "repos/$OWNER/$REPO/git/refs/heads/main" --jq '.object.sha')
```

### For repos WITHOUT JJ commits (unstarted)

- `stock` = `as-is` = current fork HEAD (identical)
- `refresher` = latest from upstream parent

### For original repos (PySpark-JupyterTest)

- `stock` = first commit (repo creation)
- `as-is` = current HEAD
- `refresher` = same as stock (no upstream parent)

## Monorepo Branch Naming

Two supported patterns — pick one and stay consistent:

### Option A: Prefixed branches (recommended for single-repo workflow)

```
lab/java/03-too-large-too-small/as-is
lab/java/03-too-large-too-small/stock
lab/java/03-too-large-too-small/refresher
```

### Option B: Tagged commits on main

```
git tag lab/java/03-too-large-too-small/as-is <sha>
git tag lab/java/03-too-large-too-small/stock <sha>
git tag lab/java/03-too-large-too-small/refresher <sha>
```

**Recommendation:** Option A (branches) for active refresher work; add Option B tags later for quick checkout.

## Creating a Triplet

```bash
#!/usr/bin/env bash
# scripts/create-branch-triplet.sh
set -euo pipefail

REPO="$1"          # e.g. Maven.TooLargeTooSmall
LAB_PATH="$2"      # e.g. labs/java/03-too-large-too-small
OWNER="jjheffernan"

# Resolve default branch
DEFAULT=$(gh api "repos/$OWNER/$REPO" --jq '.default_branch')

# Get SHAs
AS_IS=$(gh api "repos/$OWNER/$REPO/git/refs/heads/$DEFAULT" --jq '.object.sha')
FIRST_JJ=$(gh api "repos/$OWNER/$REPO/commits?author=jjheffernan&per_page=100" \
  --jq 'if length > 0 then .[-1].sha else empty end')

if [ -n "$FIRST_JJ" ]; then
  STOCK=$(gh api "repos/$OWNER/$REPO/commits/$FIRST_JJ" --jq '.parents[0].sha')
else
  STOCK="$AS_IS"
fi

# Get parent for refresher
PARENT=$(gh api "repos/$OWNER/$REPO" --jq '.parent.full_name // empty')
if [ -n "$PARENT" ]; then
  PARENT_DEFAULT=$(gh api "repos/$PARENT" --jq '.default_branch')
  REFRESHER=$(gh api "repos/$PARENT/git/refs/heads/$PARENT_DEFAULT" --jq '.object.sha')
else
  REFRESHER="$STOCK"
fi

PREFIX="lab/${LAB_PATH}"

for STATE SHA in "as-is $AS_IS" "stock $STOCK" "refresher $REFRESHER"; do
  set -- $STATE
  BRANCH="${PREFIX}/$1"
  git subtree split --prefix="$LAB_PATH" -b "$BRANCH" 2>/dev/null || \
    git branch "$BRANCH" "$2" 2>/dev/null || true
  echo "Created $BRANCH → $2"
done
```

## Working with Branches

### View your 2022 solution

```bash
git checkout lab/java/03-too-large-too-small/as-is
```

### Start a refresher attempt

```bash
git checkout lab/java/03-too-large-too-small/refresher
git checkout -b my-refresher/too-large-too-small-2026
# ... do the lab ...
```

### Compare stock vs as-is

```bash
git diff lab/java/03-too-large-too-small/stock lab/java/03-too-large-too-small/as-is
```

## LAB-META.md Template

Each lab directory includes metadata:

```markdown
# Lab Metadata

| Field | Value |
|-------|-------|
| Original repo | https://github.com/jjheffernan/Maven.TooLargeTooSmall |
| Parent fork | ZipCodeCore/TooLargeTooSmall |
| as-is SHA | `abc123...` |
| stock SHA | `def456...` |
| refresher SHA | `ghi789...` |
| First JJ commit | 2022-06-23T18:30:49Z |
| Last JJ commit | 2022-06-27T08:38:22Z |
| JJ commits | 5 |
```

## Edge Cases

| Case | stock | as-is | refresher |
|------|-------|-------|-----------|
| No JJ commits | = HEAD | = HEAD | upstream parent HEAD |
| Original repo (no parent) | first commit | HEAD | = stock |
| Upstream parent deleted | fork-at-time SHA (stored in registry) | HEAD | stock (best available) |
| Team project (ScientificCalculator) | pre-JJ on standalone repo | HEAD on standalone | re-fork from team org |
