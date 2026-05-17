# Monorepo Structure

Target directory layout for `ZCW-D3.1-Labs` after migration.

## Top Level

```
ZCW-D3.1-Labs/
├── .cursor/skills/zcw-labs-migration/
├── .github/workflows/              # Future: validate registry
├── docs/                           # Documentation (this tree)
├── labs/                           # All lab code
├── reference/                      # Read-only reference material
├── scripts/                        # Migration and audit tooling
├── labs-registry.yaml              # Machine-readable manifest
├── .gitignore
└── README.md
```

## labs/ Tree

```
labs/
├── java/
│   ├── 01-shell-console-lab/
│   ├── 02-my-first-fork/
│   ├── 03-too-large-too-small/
│   ├── 04-bluej-naive-ticket/
│   ├── 05-bluej-dream-house/
│   ├── 06-alice-and-bob/
│   ├── 07-numbers-triangles-tables/
│   ├── 08-sum-of-input/
│   ├── 09-eight-one-quiz-1/
│   ├── 10-strings-and-things/
│   ├── 11-talking-pets/
│   ├── 12-string-array-utilities/
│   ├── 13-dan-do-better-drills/
│   ├── 14-tic-tac-toe/
│   ├── 15-person-details/
│   ├── 16-tdd-animal-factory/
│   ├── 17-testing-person-class/
│   ├── 18-dicey-lab/
│   ├── 19-graded-students/
│   ├── 20-comparable-pets/
│   ├── 21-cash-machine/
│   ├── 22-phone-book/
│   ├── 23-playlist-challenge/
│   ├── 24-product-inventory/
│   └── 25-grep-catch-em-all-2/
│
├── python/
│   ├── fundamentals/
│   │   ├── part-01/
│   │   ├── part-02/
│   │   ├── ...
│   │   └── part-12/
│   ├── 13-dice-roller/
│   ├── 14-dir-tree/
│   ├── 15-py-json-yaml/
│   ├── 16-basic-stats/
│   ├── 17-data-acquisition/
│   ├── 18-rsvp-log-parser/
│   ├── 19-ntz-py/
│   ├── 20-lotto-powerball/
│   ├── 21-pandas-intro/
│   ├── 22-list-dict-exercises/
│   └── 23-jupyter-de-intro/
│
├── data-engineering/
│   ├── 01-pandas-intro/
│   ├── 02-pandas-1-2dot1/
│   ├── 03-wes-ch5-pandas/
│   ├── 04-wes-ch4-numpy/
│   ├── 05-libraries/
│   ├── 06-registered-voters-wilmington/
│   ├── 07-grep/
│   ├── 08-wes-wrangling/
│   ├── 09-noaa-locations/
│   ├── 10-pyspark-jupyter-test/
│   └── 12-jupyter-de-intro/
│
├── sql/
│   ├── 01-build-and-destroy/
│   ├── 02-give-me-the-goods/
│   ├── 03-lets-get-together/
│   ├── 04-postal-codes/
│   ├── 05-pokemon-sql/
│   └── 06-databases-are-friendly/
│
├── kafka/
│   └── 01-kafka3-data/
│
├── spark/
│   └── 01-pyspark-jupyter-test/    # symlink or note: also under data-engineering
│
└── web/
    ├── 01-css-beginnings/
    └── 02-js-for-zipcode/
```

## reference/

```
reference/
├── python-data-science-handbook/
├── spark-with-python/
└── pip-module/
```

## Per-Lab Directory Contents

Every lab directory should contain:

```
labs/java/03-too-large-too-small/
├── LAB-META.md          # Required: repo metadata + SHAs
├── README.md            # Original README from upstream (if any)
├── pom.xml              # Lab-specific files...
└── src/
```

## Naming Conventions

| Element | Convention | Example |
|---------|-----------|---------|
| Directory | `NN-kebab-case` | `03-too-large-too-small` |
| Branch prefix | `lab/<full-path>/<state>` | `lab/labs/java/03-too-large-too-small/as-is` |
| Import branch | `import/<original-repo-name>` | `import/Maven.TooLargeTooSmall` |
| Refresher work | `my-refresher/<name>-YYYY` | `my-refresher/too-large-too-small-2026` |

## .gitignore Additions

```gitignore
# Java
**/target/
**/.classpath
**/.project
**/.settings/

# Python
**/__pycache__/
**/.venv/
**/*.pyc
.ipynb_checkpoints/

# IDE
.idea/
*.iml

# OS
.DS_Store
```

## labs-registry.yaml Schema

```yaml
labs:
  - id: java-03-too-large-too-small
    original_repo: jjheffernan/Maven.TooLargeTooSmall
    parent: ZipCodeCore/TooLargeTooSmall
    path: labs/java/03-too-large-too-small
    track: java
    order: 3
    jj_commits: 5
    status: completed          # completed | unstarted | reference
    first_jj: "2022-06-23T18:30:49Z"
    last_jj: "2022-06-27T08:38:22Z"
    shas:
      as_is: null              # populated during migration
      stock: null
      refresher: null
```

## Total Counts

| Area | Labs |
|------|-----:|
| Java | 25 |
| Python | 23 |
| Data Engineering | 11 |
| SQL | 6 |
| Kafka | 1 |
| Spark | 1 |
| Web | 2 |
| Reference | 3 |
| **Total** | **72** |

*(PySpark-JupyterTest counted once under data-engineering; spark/ may alias it.)*
