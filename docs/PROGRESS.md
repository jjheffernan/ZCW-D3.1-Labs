# ZCW Labs — Progress Tracker

Track sprint completion, migration, and refresher re-tries. **Check boxes** as you go; run `./scripts/progress-stats.sh` to refresh percentages.

## Dashboard

<!-- AUTO:START dashboard -->
| Metric | Done | Total | % |
|--------|-----:|------:|--:|
| **Sprint (re-done)** | 0 | 67 | 0% |
| **Migrated to monorepo** | 0 | 67 | 0% |
| **2022 baseline** | 48 | 67 | 71% |
| Reference (optional) | 0 | 3 | 0% |

**Sprint:** `░░░░░░░░░░░░░░░░░░░░` 0%  
**Migrate:** `░░░░░░░░░░░░░░░░░░░░` 0%
<!-- AUTO:END dashboard -->

## Sprint Settings

| Field | Value |
|-------|-------|
| Sprint name | `2026-refresher` |
| Started | _YYYY-MM-DD_ |
| Target end | _YYYY-MM-DD_ |
| Focus track | _all / java / python / …_ |
| Notes | |

## How to Filter (Ctrl+F / ⌘F)

| Search term | Shows |
|-------------|-------|
| `[filter:sprint-open]` | Not yet re-done this sprint |
| `[filter:sprint-done]` | Re-done this sprint (after checking box) |
| `[filter:migrate-open]` | Not yet in monorepo |
| `[filter:2022-skip]` | Never started in 2022 — do first or resume |
| `[filter:2022-done]` | Done in 2022 — re-try on refresher branch |
| `[filter:java]` | Java track only |
| `[filter:python]` | Python track only |
| `[filter:data-engineering]` | Data engineering only |
| `[filter:sql]` | SQL only |

**Tip:** After checking a sprint box, replace `[filter:sprint-open]` with `[filter:sprint-done]` on that row so Ctrl+F filters stay accurate.

> **Note:** `PandasIntro1` appears twice (python + data-engineering paths) — completing one counts toward both tracks; check both sprint boxes when done.

## 📍 Resume Here

_First unchecked sprint item in curriculum order:_

1. **Shell.Console-Lab** — `labs/java/01-shell-console-lab/` (Java / BlueJ / Maven)

<details><summary><strong>Queue: never started in 2022</strong> (19)</summary>

### Java / BlueJ / Maven

- [ ] PersonDetails.Maven — `labs/java/15-person-details/`
- [ ] Maven.TDD-AnimalFactory — `labs/java/16-tdd-animal-factory/`
- [ ] Maven.TestingPersonClass — `labs/java/17-testing-person-class/`
- [ ] DiceyLab.Maven — `labs/java/18-dicey-lab/`
- [ ] Maven.GradedStudents — `labs/java/19-graded-students/`
- [ ] Maven.ComparablePets — `labs/java/20-comparable-pets/`
- [ ] CashMachine — `labs/java/21-cash-machine/`
- [ ] PhoneBook.Maven — `labs/java/22-phone-book/`
- [ ] PlaylistChallenge — `labs/java/23-playlist-challenge/`
- [ ] Product-Inventory-Lab — `labs/java/24-product-inventory/`
- [ ] Grep.CatchEmAll2 — `labs/java/25-grep-catch-em-all-2/`

### Python Fundamentals

- [ ] PandasIntro1 — `labs/python/21-pandas-intro/`
- [ ] PyListDictExs — `labs/python/22-list-dict-exercises/`
- [ ] jupyter-notebooks.data-engineering — `labs/python/23-jupyter-de-intro/`

### Data Engineering

- [ ] PandasIntro1 — `labs/data-engineering/01-pandas-intro/`

### SQL

- [ ] SQL.PostalCodes — `labs/sql/04-postal-codes/`
- [ ] DatabasesAreFriendly — `labs/sql/06-databases-are-friendly/`

### Web

- [ ] SeeEssEssBeginnings — `labs/web/01-css-beginnings/`
- [ ] js-for-zipcode — `labs/web/02-js-for-zipcode/`

</details>

<details><summary><strong>Queue: re-try from 2022</strong> (48)</summary>

_Use `refresher` branch. Check sprint box when complete._

### Java / BlueJ / Maven

- [ ] Shell.Console-Lab — `labs/java/01-shell-console-lab/`
- [ ] MyFirstFork — `labs/java/02-my-first-fork/`
- [ ] Maven.TooLargeTooSmall — `labs/java/03-too-large-too-small/`
- [ ] BlueJ.NaiveTicket — `labs/java/04-bluej-naive-ticket/`
- [ ] BlueJ.DreamHouseDrawing — `labs/java/05-bluej-dream-house/`
- [ ] Maven.AliceAndBob — `labs/java/06-alice-and-bob/`
- [ ] Maven.NumbersTrianglesTables — `labs/java/07-numbers-triangles-tables/`
- [ ] Maven.SumOfInput — `labs/java/08-sum-of-input/`
- [ ] EightOneQuiz1 — `labs/java/09-eight-one-quiz-1/`
- [ ] StringsAndThings — `labs/java/10-strings-and-things/`
- [ ] Maven.TalkingPets — `labs/java/11-talking-pets/`
- [ ] Maven.StringArrayUtilities — `labs/java/12-string-array-utilities/`
- [ ] Maven.DanDoBetterDrills — `labs/java/13-dan-do-better-drills/`
- [ ] Maven.TicTacToe — `labs/java/14-tic-tac-toe/`

### Python Fundamentals

- [ ] PythonFundamentals.Exercises.Part1 — `labs/python/fundamentals/part-01/`
- [ ] PythonFundamentals.Exercises.Part2 — `labs/python/fundamentals/part-02/`
- [ ] PythonFundamentals.Exercises.Part3 — `labs/python/fundamentals/part-03/`
- [ ] PythonFundamentals.Exercises.Part4 — `labs/python/fundamentals/part-04/`
- [ ] PythonFundamentals.Exercises.Part5 — `labs/python/fundamentals/part-05/`
- [ ] PythonFundamentals.Exercises.Part6 — `labs/python/fundamentals/part-06/`
- [ ] PythonFundamentals.Exercises.Part7 — `labs/python/fundamentals/part-07/`
- [ ] PythonFundamentals.Exercises.Part8 — `labs/python/fundamentals/part-08/`
- [ ] PythonFundamentals.Exercises.Part9 — `labs/python/fundamentals/part-09/`
- [ ] PythonFundamentals.Exercises.Part10 — `labs/python/fundamentals/part-10/`
- [ ] PythonFundamentals.Exercises.Part11 — `labs/python/fundamentals/part-11/`
- [ ] PythonFundamentals.Exercises.Part12 — `labs/python/fundamentals/part-12/`
- [ ] DE-2d1-Dice-Roller — `labs/python/13-dice-roller/`
- [ ] DirTree — `labs/python/14-dir-tree/`
- [ ] PyJsonYaml — `labs/python/15-py-json-yaml/`
- [ ] Py-BasicStats — `labs/python/16-basic-stats/`
- [ ] PythonFundamentals.Labs.DataAcqusitionLab — `labs/python/17-data-acquisition/`
- [ ] PythonFundamentals.Labs.RSVPAgentProcessingLogParser — `labs/python/18-rsvp-log-parser/`
- [ ] ntz-py — `labs/python/19-ntz-py/`
- [ ] py-lotto-powerball — `labs/python/20-lotto-powerball/`

### Data Engineering

- [ ] Pandas1-2dot1 — `labs/data-engineering/02-pandas-1-2dot1/`
- [ ] WesCh5 — `labs/data-engineering/03-wes-ch5-pandas/`
- [ ] WesCh4-numpy — `labs/data-engineering/04-wes-ch4-numpy/`
- [ ] DataEngineering.Labs.Libraries — `labs/data-engineering/05-libraries/`
- [ ] DataEngineering.Labs.RegisteredVotersFileWilmingtonDE — `labs/data-engineering/06-registered-voters-wilmington/`
- [ ] DataEngineering.Labs.grep — `labs/data-engineering/07-grep/`
- [ ] WesWrangling — `labs/data-engineering/08-wes-wrangling/`
- [ ] DataEngineering.Labs.NOAALocations — `labs/data-engineering/09-noaa-locations/`
- [ ] PySpark-JupyterTest — `labs/data-engineering/10-pyspark-jupyter-test/`

### SQL

- [ ] SQL.BuildAndDestroy — `labs/sql/01-build-and-destroy/`
- [ ] DE.SQL.GiveMeTheGoods — `labs/sql/02-give-me-the-goods/`
- [ ] SQL.LetsGetTogether — `labs/sql/03-lets-get-together/`
- [ ] PokemonSqlLab — `labs/sql/05-pokemon-sql/`

### Kafka

- [ ] Kafka3-Data — `labs/kafka/01-kafka3-data/`

</details>

## Full Tracker

**Columns:** Sprint = re-done this sprint · Migrate = imported to monorepo · 2022 = historical status

| Filters | Sprint | Migrate | 2022 | # | Lab | Path |
|---------|:------:|:-------:|:----:|--:|-----|------|
| **—— Java / BlueJ / Maven ——** | | | | | | |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 1 | [Shell.Console-Lab](https://github.com/jjheffernan/Shell.Console-Lab) | `labs/java/01-shell-console-lab/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 2 | [MyFirstFork](https://github.com/jjheffernan/MyFirstFork) | `labs/java/02-my-first-fork/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 3 | [Maven.TooLargeTooSmall](https://github.com/jjheffernan/Maven.TooLargeTooSmall) | `labs/java/03-too-large-too-small/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 4 | [BlueJ.NaiveTicket](https://github.com/jjheffernan/BlueJ.NaiveTicket) | `labs/java/04-bluej-naive-ticket/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 5 | [BlueJ.DreamHouseDrawing](https://github.com/jjheffernan/BlueJ.DreamHouseDrawing) | `labs/java/05-bluej-dream-house/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 6 | [Maven.AliceAndBob](https://github.com/jjheffernan/Maven.AliceAndBob) | `labs/java/06-alice-and-bob/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 7 | [Maven.NumbersTrianglesTables](https://github.com/jjheffernan/Maven.NumbersTrianglesTables) | `labs/java/07-numbers-triangles-tables/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 8 | [Maven.SumOfInput](https://github.com/jjheffernan/Maven.SumOfInput) | `labs/java/08-sum-of-input/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 9 | [EightOneQuiz1](https://github.com/jjheffernan/EightOneQuiz1) | `labs/java/09-eight-one-quiz-1/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 10 | [StringsAndThings](https://github.com/jjheffernan/StringsAndThings) | `labs/java/10-strings-and-things/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 11 | [Maven.TalkingPets](https://github.com/jjheffernan/Maven.TalkingPets) | `labs/java/11-talking-pets/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 12 | [Maven.StringArrayUtilities](https://github.com/jjheffernan/Maven.StringArrayUtilities) | `labs/java/12-string-array-utilities/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 13 | [Maven.DanDoBetterDrills](https://github.com/jjheffernan/Maven.DanDoBetterDrills) | `labs/java/13-dan-do-better-drills/` |
| `[filter:java]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 14 | [Maven.TicTacToe](https://github.com/jjheffernan/Maven.TicTacToe) | `labs/java/14-tic-tac-toe/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 15 | [PersonDetails.Maven](https://github.com/jjheffernan/PersonDetails.Maven) | `labs/java/15-person-details/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 16 | [Maven.TDD-AnimalFactory](https://github.com/jjheffernan/Maven.TDD-AnimalFactory) | `labs/java/16-tdd-animal-factory/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 17 | [Maven.TestingPersonClass](https://github.com/jjheffernan/Maven.TestingPersonClass) | `labs/java/17-testing-person-class/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 18 | [DiceyLab.Maven](https://github.com/jjheffernan/DiceyLab.Maven) | `labs/java/18-dicey-lab/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 19 | [Maven.GradedStudents](https://github.com/jjheffernan/Maven.GradedStudents) | `labs/java/19-graded-students/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 20 | [Maven.ComparablePets](https://github.com/jjheffernan/Maven.ComparablePets) | `labs/java/20-comparable-pets/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 21 | [CashMachine](https://github.com/jjheffernan/CashMachine) | `labs/java/21-cash-machine/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 22 | [PhoneBook.Maven](https://github.com/jjheffernan/PhoneBook.Maven) | `labs/java/22-phone-book/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 23 | [PlaylistChallenge](https://github.com/jjheffernan/PlaylistChallenge) | `labs/java/23-playlist-challenge/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 24 | [Product-Inventory-Lab](https://github.com/jjheffernan/Product-Inventory-Lab) | `labs/java/24-product-inventory/` |
| `[filter:java]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 25 | [Grep.CatchEmAll2](https://github.com/jjheffernan/Grep.CatchEmAll2) | `labs/java/25-grep-catch-em-all-2/` |
| **—— Python Fundamentals ——** | | | | | | |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 1 | [PythonFundamentals.Exercises.Part1](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part1) | `labs/python/fundamentals/part-01/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 2 | [PythonFundamentals.Exercises.Part2](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part2) | `labs/python/fundamentals/part-02/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 3 | [PythonFundamentals.Exercises.Part3](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part3) | `labs/python/fundamentals/part-03/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 4 | [PythonFundamentals.Exercises.Part4](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part4) | `labs/python/fundamentals/part-04/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 5 | [PythonFundamentals.Exercises.Part5](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part5) | `labs/python/fundamentals/part-05/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 6 | [PythonFundamentals.Exercises.Part6](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part6) | `labs/python/fundamentals/part-06/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 7 | [PythonFundamentals.Exercises.Part7](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part7) | `labs/python/fundamentals/part-07/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 8 | [PythonFundamentals.Exercises.Part8](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part8) | `labs/python/fundamentals/part-08/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 9 | [PythonFundamentals.Exercises.Part9](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part9) | `labs/python/fundamentals/part-09/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 10 | [PythonFundamentals.Exercises.Part10](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part10) | `labs/python/fundamentals/part-10/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 11 | [PythonFundamentals.Exercises.Part11](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part11) | `labs/python/fundamentals/part-11/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 12 | [PythonFundamentals.Exercises.Part12](https://github.com/jjheffernan/PythonFundamentals.Exercises.Part12) | `labs/python/fundamentals/part-12/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 13 | [DE-2d1-Dice-Roller](https://github.com/jjheffernan/DE-2d1-Dice-Roller) | `labs/python/13-dice-roller/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 14 | [DirTree](https://github.com/jjheffernan/DirTree) | `labs/python/14-dir-tree/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 15 | [PyJsonYaml](https://github.com/jjheffernan/PyJsonYaml) | `labs/python/15-py-json-yaml/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 16 | [Py-BasicStats](https://github.com/jjheffernan/Py-BasicStats) | `labs/python/16-basic-stats/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 17 | [PythonFundamentals.Labs.DataAcqusitionLab](https://github.com/jjheffernan/PythonFundamentals.Labs.DataAcqusitionLab) | `labs/python/17-data-acquisition/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 18 | [PythonFundamentals.Labs.RSVPAgentProcessingLogParser](https://github.com/jjheffernan/PythonFundamentals.Labs.RSVPAgentProcessingLogParser) | `labs/python/18-rsvp-log-parser/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 19 | [ntz-py](https://github.com/jjheffernan/ntz-py) | `labs/python/19-ntz-py/` |
| `[filter:python]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 20 | [py-lotto-powerball](https://github.com/jjheffernan/py-lotto-powerball) | `labs/python/20-lotto-powerball/` |
| `[filter:python]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 21 | [PandasIntro1](https://github.com/jjheffernan/PandasIntro1) | `labs/python/21-pandas-intro/` |
| `[filter:python]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 22 | [PyListDictExs](https://github.com/jjheffernan/PyListDictExs) | `labs/python/22-list-dict-exercises/` |
| `[filter:python]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 23 | [jupyter-notebooks.data-engineering](https://github.com/jjheffernan/jupyter-notebooks.data-engineering) | `labs/python/23-jupyter-de-intro/` |
| **—— Data Engineering ——** | | | | | | |
| `[filter:data-engineering]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 1 | [PandasIntro1](https://github.com/jjheffernan/PandasIntro1) | `labs/data-engineering/01-pandas-intro/` |
| `[filter:data-engineering]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 2 | [Pandas1-2dot1](https://github.com/jjheffernan/Pandas1-2dot1) | `labs/data-engineering/02-pandas-1-2dot1/` |
| `[filter:data-engineering]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 3 | [WesCh5](https://github.com/jjheffernan/WesCh5) | `labs/data-engineering/03-wes-ch5-pandas/` |
| `[filter:data-engineering]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 4 | [WesCh4-numpy](https://github.com/jjheffernan/WesCh4-numpy) | `labs/data-engineering/04-wes-ch4-numpy/` |
| `[filter:data-engineering]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 5 | [DataEngineering.Labs.Libraries](https://github.com/jjheffernan/DataEngineering.Labs.Libraries) | `labs/data-engineering/05-libraries/` |
| `[filter:data-engineering]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 6 | [DataEngineering.Labs.RegisteredVotersFileWilmingtonDE](https://github.com/jjheffernan/DataEngineering.Labs.RegisteredVotersFileWilmingtonDE) | `labs/data-engineering/06-registered-voters-wilmington/` |
| `[filter:data-engineering]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 7 | [DataEngineering.Labs.grep](https://github.com/jjheffernan/DataEngineering.Labs.grep) | `labs/data-engineering/07-grep/` |
| `[filter:data-engineering]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 8 | [WesWrangling](https://github.com/jjheffernan/WesWrangling) | `labs/data-engineering/08-wes-wrangling/` |
| `[filter:data-engineering]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 9 | [DataEngineering.Labs.NOAALocations](https://github.com/jjheffernan/DataEngineering.Labs.NOAALocations) | `labs/data-engineering/09-noaa-locations/` |
| `[filter:data-engineering]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 10 | [PySpark-JupyterTest](https://github.com/jjheffernan/PySpark-JupyterTest) | `labs/data-engineering/10-pyspark-jupyter-test/` |
| **—— SQL ——** | | | | | | |
| `[filter:sql]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 1 | [SQL.BuildAndDestroy](https://github.com/jjheffernan/SQL.BuildAndDestroy) | `labs/sql/01-build-and-destroy/` |
| `[filter:sql]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 2 | [DE.SQL.GiveMeTheGoods](https://github.com/jjheffernan/DE.SQL.GiveMeTheGoods) | `labs/sql/02-give-me-the-goods/` |
| `[filter:sql]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 3 | [SQL.LetsGetTogether](https://github.com/jjheffernan/SQL.LetsGetTogether) | `labs/sql/03-lets-get-together/` |
| `[filter:sql]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 4 | [SQL.PostalCodes](https://github.com/jjheffernan/SQL.PostalCodes) | `labs/sql/04-postal-codes/` |
| `[filter:sql]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 5 | [PokemonSqlLab](https://github.com/jjheffernan/PokemonSqlLab) | `labs/sql/05-pokemon-sql/` |
| `[filter:sql]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 6 | [DatabasesAreFriendly](https://github.com/jjheffernan/DatabasesAreFriendly) | `labs/sql/06-databases-are-friendly/` |
| **—— Kafka ——** | | | | | | |
| `[filter:kafka]` `[filter:2022-done]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ✅ 2022 | 1 | [Kafka3-Data](https://github.com/jjheffernan/Kafka3-Data) | `labs/kafka/01-kafka3-data/` |
| **—— Web ——** | | | | | | |
| `[filter:web]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 1 | [SeeEssEssBeginnings](https://github.com/jjheffernan/SeeEssEssBeginnings) | `labs/web/01-css-beginnings/` |
| `[filter:web]` `[filter:2022-skip]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | ⬜ 2022 | 2 | [js-for-zipcode](https://github.com/jjheffernan/js-for-zipcode) | `labs/web/02-js-for-zipcode/` |
| **—— Reference ——** | | | | | | |
| `[filter:reference]` `[filter:2022-ref]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | 📚 ref | 1 | [Spark-with-Python](https://github.com/jjheffernan/Spark-with-Python) | `reference/spark-with-python/` |
| `[filter:reference]` `[filter:2022-ref]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | 📚 ref | 2 | [PythonDataScienceHandbook](https://github.com/jjheffernan/PythonDataScienceHandbook) | `reference/python-data-science-handbook/` |
| `[filter:reference]` `[filter:2022-ref]` `[filter:sprint-open]` `[filter:migrate-open]` | - [ ] | - [ ] | 📚 ref | 3 | [PythonFundamentals.Labs.PipModule](https://github.com/jjheffernan/PythonFundamentals.Labs.PipModule) | `reference/pip-module/` |

## Legend

| Symbol | Meaning |
|--------|---------|
| Sprint `- [ ]` | Re-complete lab on `refresher` branch this sprint |
| Migrate `- [ ]` | Code imported under `labs/` |
| ✅ 2022 | Completed during original cohort |
| ⬜ 2022 | Forked but never committed |
| 📚 ref | Optional reference material |

## Recalculate Stats

```bash
./scripts/progress-stats.sh        # print stats
./scripts/progress-stats.sh --write  # update dashboard in this file
```
