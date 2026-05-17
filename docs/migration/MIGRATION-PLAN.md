# Migration Plan

Consolidate ~66 individual ZCW lab repos from [jjheffernan](https://github.com/jjheffernan) into this monorepo while preserving three branch states per lab.

## Scope

| Include | Exclude |
|---------|---------|
| 52 labs with JJ commits | 4 group/capstone projects |
| 18 unstarted forks | 8 personal/unrelated repos |
| 2 reference forks (optional) | ScientificCalculator.Maven (team) |
| PySpark-JupyterTest (original) | Django-Auto-Forum, Notification-Rake, saleor |

See [GITHUB-AUDIT.md](../audit/GITHUB-AUDIT.md) for full classification.

## Target Structure

```
ZCW-D3.1-Labs/
├── docs/                          # This documentation
├── labs/
│   ├── java/                      # 25 labs
│   ├── python/
│   │   └── fundamentals/          # Parts 1-12
│   ├── data-engineering/          # 12 labs
│   ├── sql/                       # 6 labs
│   ├── kafka/                     # 1 lab
│   ├── spark/                     # 1 lab
│   └── web/                       # 2 labs
├── reference/                     # Textbooks, instructor examples
├── scripts/
│   ├── migrate-lab.sh             # Import single repo
│   ├── create-branch-triplet.sh   # as-is / stock / refresher
│   └── audit-lab.sh               # Verify branch states
└── labs-registry.yaml             # Machine-readable repo manifest
```

Full path mapping: [MONOREPO-STRUCTURE.md](MONOREPO-STRUCTURE.md)

## Migration Phases

### Phase 0 — Foundation (do first)

- [x] Audit all GitHub repos
- [x] Document progression paths and timeline
- [x] Define branch strategy
- [x] Create `labs-registry.yaml` manifest
- [x] Add migration scripts to `scripts/`
- [x] Create top-level `labs/` directory scaffold
- [x] Add `.cursor/skills/zcw-labs-migration/` agent skill

### Commit Cadence

Space all commits on this repo **weekly to biweekly** (7–14 days apart). Do not batch multiple migration phases into a single day.

| Activity | Cadence |
|----------|---------|
| Documentation commits | One subject or phase per commit |
| Lab imports | One track batch per commit (e.g. Java 1a, 1b) |
| Branch triplets | Same commit as the lab import, or following commit next week |

When backdating or scheduling commits, use consistent author timestamps:

```bash
GIT_AUTHOR_DATE="2026-04-05T10:00:00" GIT_COMMITTER_DATE="2026-04-05T10:00:00" \
  git commit -m "message"
```

### Phase 1 — Java Track (25 repos)

Migrate in curriculum order. Each lab gets subdirectory + branch triplet.

| Batch | Repos | Est. time |
|-------|-------|-----------|
| 1a | Shell.Console-Lab, MyFirstFork | 30 min |
| 1b | Maven.TooLargeTooSmall, BlueJ.* | 30 min |
| 1c | Maven core (AliceAndBob → SumOfInput) | 1 hr |
| 1d | Java 8.1 (Quiz → TicTacToe) | 1 hr |
| 1e | Unstarted Maven labs (15 repos) | 1 hr |

**Validation:** Each `labs/java/NN-*/` has `README.md` with original repo link, parent fork, and branch checkout instructions.

### Phase 2 — Python Fundamentals (23 repos)

| Batch | Repos | Est. time |
|-------|-------|-----------|
| 2a | Part1–Part6 | 1 hr |
| 2b | Part7–Part12 | 1 hr |
| 2c | Applied labs + unstarted | 1 hr |

### Phase 3 — Data Engineering (12 repos)

| Batch | Repos | Est. time |
|-------|-------|-----------|
| 3a | Pandas + Wes chapters | 45 min |
| 3b | DE Labs + grep | 45 min |
| 3c | PySpark + reference | 30 min |

### Phase 4 — SQL (6 repos)

All SQL repos in one batch (~45 min).

### Phase 5 — Spark / Kafka / Web (5 repos)

Final batch (~30 min).

### Phase 6 — Cleanup

- [ ] Archive original GitHub repos (mark read-only, add monorepo link in description)
- [ ] Update [jjheffernan profile README](https://github.com/jjheffernan/jjheffernan) to point to monorepo
- [ ] Verify all branch triplets with `scripts/audit-lab.sh`
- [ ] Add CI workflow to validate registry matches disk

## Per-Lab Migration Procedure

For each repo, run:

```bash
# 1. Import repo content into monorepo subdirectory
./scripts/migrate-lab.sh <repo-name> <monorepo-path>

# 2. Create branch triplet
./scripts/create-branch-triplet.sh <repo-name> <monorepo-path>

# 3. Verify
./scripts/audit-lab.sh <monorepo-path>
```

### What `migrate-lab.sh` does

1. Clone `jjheffernan/<repo>` to a temp directory
2. Copy files into `labs/<path>/` (preserving structure, excluding `.git`)
3. Write `labs/<path>/LAB-META.md` with:
   - Original repo URL
   - Parent fork URL
   - First/last JJ commit SHAs and dates
   - JJ commit count
4. Commit to monorepo `main` on a branch named `import/<repo-name>`

### What `create-branch-triplet.sh` does

See [BRANCH-STRATEGY.md](BRANCH-STRATEGY.md).

## Git Strategy for Monorepo

The monorepo uses **per-lab branch naming** rather than per-lab git subdirectories with their own `.git`:

```
Branch naming convention:
  labs/<path>/as-is       → subtree or tagged commit with JJ's final work
  labs/<path>/stock       → subtree at pre-JJ state
  labs/<path>/refresher   → subtree from upstream parent
```

**Recommended approach:** Use `git subtree` or copy-at-commit pattern:

| Approach | Pros | Cons |
|----------|------|------|
| **Subtree per lab** | Real git history preserved | Complex branch management |
| **Copy + LAB-META.md** (recommended) | Simple, auditable | No inline git history |
| **Git submodules** | Links to original repos | 66 submodules is unwieldy |

**Recommendation:** Copy + LAB-META.md for v1. Store original commit SHAs in `labs-registry.yaml` so history is recoverable via `gh api`.

## Post-Migration GitHub Repo Cleanup

For each migrated standalone repo:

1. Update repo description: `➡️ Moved to https://github.com/jjheffernan/ZCW-D3.1-Labs/tree/main/labs/<path>`
2. Add a final commit to default branch with `MOVED.md` pointing to monorepo
3. Optionally archive the repo (Settings → Archive)

**Do NOT delete** original repos — they preserve GitHub fork relationships and commit history.

## Risk Register

| Risk | Mitigation |
|------|------------|
| Upstream parent repos deleted | `stock` and `refresher` branches committed in monorepo |
| Large notebook files bloat monorepo | Git LFS for `.ipynb` > 1MB |
| Java/Maven `target/` dirs committed | Add to `.gitignore`, strip on import |
| Duplicate repo names across orgs | Monorepo paths are namespaced by subject |

## Success Criteria

- [ ] All 66 lab repos represented in `labs/`
- [ ] Every lab has `LAB-META.md` with SHAs
- [ ] `labs-registry.yaml` validates against disk
- [ ] Branch triplets exist for all labs with JJ commits (52)
- [ ] Refresher branches exist for all 66 labs
- [ ] Group projects documented but not migrated
- [ ] Curriculum progression docs match on-disk order
