# ZCW-D3.1-Labs

Zip Code Wilmington Cohort **2022.1** (Java 8.1 + Data 3.1) — consolidated lab monorepo.

Originally ~70 separate repos on [jjheffernan](https://github.com/jjheffernan). This repository organizes them by subject with progression paths and a three-branch strategy per lab.

## Quick Links

- [Documentation index](docs/README.md)
- [All Zipcode repos](docs/zipcode-repos/INDEX.md)
- [Migration plan](docs/migration/MIGRATION-PLAN.md)
- [Curriculum progression](docs/curriculum/PROGRESSION.md)
- [Commit timeline](docs/curriculum/TIMELINE.md)

## Branch Strategy

Each lab supports three states:

| Branch | What it is |
|--------|-----------|
| `as-is` | Your completed 2022 solution |
| `stock` | Assignment state before you committed |
| `refresher` | Fresh upstream fork to re-try exercises |

See [Branch Strategy](docs/migration/BRANCH-STRATEGY.md) for details.

## Tracks

| Track | Labs | Doc |
|-------|-----:|-----|
| Java / BlueJ / Maven | 25 | [java-track.md](docs/zipcode-repos/java-track.md) |
| Python Fundamentals | 23 | [python-fundamentals.md](docs/zipcode-repos/python-fundamentals.md) |
| Data Engineering | 11 | [data-engineering.md](docs/zipcode-repos/data-engineering.md) |
| SQL | 6 | [sql-track.md](docs/zipcode-repos/sql-track.md) |
| Kafka & Web | 3 | [spark-kafka-web.md](docs/zipcode-repos/spark-kafka-web.md) |

## External Group Projects

These stay as standalone repos:

- [Django-Auto-Forum](https://github.com/jjheffernan/Django-Auto-Forum) — capstone
- [Notification-Rake-Project](https://github.com/jjheffernan/Notification-Rake-Project) — capstone
- [ScientificCalculator.Maven](https://github.com/jjheffernan/ScientificCalculator.Maven) — team lab
- [saleor-additive-commerce](https://github.com/jjheffernan/saleor-additive-commerce) — capstone stub

## Status

| Metric | Count |
|--------|------:|
| Labs documented | 66 |
| Labs migrated to `labs/` | 0 (planning phase) |
| Completed by JJ (2022) | 52 |
| Unstarted (refresher candidates) | 18 |

## Migration

```bash
# Import a single lab
./scripts/migrate-lab.sh Maven.TooLargeTooSmall labs/java/03-too-large-too-small

# Create branch triplet
./scripts/create-branch-triplet.sh Maven.TooLargeTooSmall labs/java/03-too-large-too-small

# Verify
./scripts/audit-lab.sh labs/java/03-too-large-too-small
```

Full plan: [docs/migration/MIGRATION-PLAN.md](docs/migration/MIGRATION-PLAN.md)
