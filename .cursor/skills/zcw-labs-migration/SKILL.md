---
name: zcw-labs-migration
description: >-
  Migrate Zip Code Wilmington (ZCW) cohort lab repos into the ZCW-D3.1-Labs
  monorepo. Creates as-is, stock, and refresher branch triplets per lab.
  Use when migrating labs, importing repos from jjheffernan GitHub, creating
  branch triplets, auditing lab metadata, or working with labs-registry.yaml.
---

# ZCW Labs Migration

## Context

This monorepo consolidates ~66 individual ZCW 2022.1 cohort labs from
https://github.com/jjheffernan into a single repository with documented
progression paths and three branch states per lab.

## Key Files

| File | Purpose |
|------|---------|
| `labs-registry.yaml` | Machine-readable manifest of all labs |
| `docs/migration/MIGRATION-PLAN.md` | Full migration procedure |
| `docs/migration/BRANCH-STRATEGY.md` | as-is / stock / refresher definitions |
| `docs/curriculum/PROGRESSION.md` | Learning order across subjects |
| `scripts/migrate-lab.sh` | Import one repo |
| `scripts/create-branch-triplet.sh` | Create branch triplet |
| `scripts/audit-lab.sh` | Verify lab completeness |

## Branch Definitions

- **as-is** — JJ's completed work (current HEAD of original repo)
- **stock** — State before JJ's first commit (the assignment as given)
- **refresher** — Fresh copy from upstream parent fork

Branch naming: `lab/<monorepo-path>/<state>`

## Migration Workflow

1. Look up the lab in `labs-registry.yaml` for `original_repo` and `path`
2. Run `./scripts/migrate-lab.sh <original-repo-name> <path>`
3. Run `./scripts/create-branch-triplet.sh <original-repo-name> <path>`
4. Run `./scripts/audit-lab.sh <path>`
5. Update `labs-registry.yaml` with populated SHAs
6. Follow curriculum order in `docs/curriculum/PROGRESSION.md`

## Exclusions — Do NOT Migrate

Group/capstone projects stay standalone:
- ScientificCalculator.Maven
- Django-Auto-Forum
- Notification-Rake-Project
- saleor-additive-commerce

## Migration Order

Follow phases in `docs/migration/MIGRATION-PLAN.md`:
1. Java track (25 labs)
2. Python fundamentals (23 labs)
3. Data engineering (11 labs)
4. SQL (6 labs)
5. Kafka + Web (3 labs)

## Registry Lookup

```bash
# Find a lab by original repo name
grep -A5 "Maven.TooLargeTooSmall" labs-registry.yaml
```

## Refresher Workflow

When JJ wants to re-do a lab:
1. Checkout `lab/<path>/refresher`
2. Create work branch: `my-refresher/<lab-name>-YYYY`
3. Complete exercises
4. Compare against `lab/<path>/as-is` for 2022 solutions

## Parent Org Reference

| Org | Track |
|-----|-------|
| ZCW-Java8-0 | Java fundamentals |
| ZCW-Java8-1 | Java 8.1 |
| ZCW-Data3-1 | Data 3.1 cohort |
| ZipCodeCore | Shared curriculum |
| Zipcoder | Instructor (Dolio) |
| xt0fer | Instructor (DeDeus) |
