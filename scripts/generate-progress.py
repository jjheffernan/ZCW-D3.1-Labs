#!/usr/bin/env python3
"""Regenerate docs/PROGRESS.md from labs-registry.yaml, preserving checkbox state."""

import re
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
YAML = ROOT / "labs-registry.yaml"
OUT = ROOT / "docs/PROGRESS.md"

TRACK_LABELS = {
    "java": "Java / BlueJ / Maven",
    "python": "Python Fundamentals",
    "data-engineering": "Data Engineering",
    "sql": "SQL",
    "kafka": "Kafka",
    "web": "Web",
    "reference": "Reference",
}
TRACK_ORDER = ["java", "python", "data-engineering", "sql", "kafka", "web", "reference"]


def parse_labs(text: str) -> list[dict]:
    labs = []
    for b in re.split(r"\n  - id: ", text)[1:]:
        def g(p):
            m = re.search(p, b)
            return m.group(1) if m else ""

        lab = {
            "id": g(r"^(\S+)"),
            "original_repo": g(r"original_repo: (\S+)"),
            "path": g(r"path: (\S+)"),
            "track": g(r"track: (\S+)"),
            "order": int(g(r"order: (\d+)") or 0),
            "status": g(r"status: (\S+)"),
        }
        lab["name"] = lab["original_repo"].split("/")[-1] if lab["original_repo"] else lab["id"]
        labs.append(lab)
    return labs


def load_existing_states(path: Path) -> dict[str, tuple[bool, bool]]:
    """Map original_repo -> (sprint_checked, migrate_checked)."""
    if not path.exists():
        return {}
    text = path.read_text()
    states = {}
    for line in text.splitlines():
        if not line.startswith("| `[filter:"):
            continue
        m = re.search(r"\[([^\]]+)\]\(https://github\.com/([^)]+)\)", line)
        if not m:
            continue
        repo = m.group(2)
        parts = [p.strip() for p in line.split("|")]
        if len(parts) < 4:
            continue
        sprint = parts[2].strip() == "- [x]"
        migrate = parts[3].strip() == "- [x]"
        states[repo] = (sprint, migrate)
    return states


def checkbox(checked: bool) -> str:
    return "- [x]" if checked else "- [ ]"


def row(lab: dict, states: dict) -> str:
    repo = lab["original_repo"]
    sprint, migrate = states.get(repo, (False, False))
    s2022 = "done" if lab["status"] == "completed" else ("skip" if lab["status"] == "unstarted" else "ref")
    sprint_filter = "sprint-done" if sprint else "sprint-open"
    tag2022 = "✅ 2022" if lab["status"] == "completed" else ("⬜ 2022" if lab["status"] == "unstarted" else "📚 ref")
    gh = f"https://github.com/{repo}"
    return (
        f"| `[filter:{lab['track']}]` `[filter:2022-{s2022}]` `[filter:{sprint_filter}]` `[filter:migrate-open]` "
        f"| {checkbox(sprint)} | {checkbox(migrate)} | {tag2022} | {lab['order']} | [{lab['name']}]({gh}) | `{lab['path']}/` |"
    )


def main():
    labs = parse_labs(YAML.read_text())
    states = load_existing_states(OUT)
    core = [l for l in labs if l["status"] != "reference"]
    ref = [l for l in labs if l["status"] == "reference"]
    done2022 = sum(1 for l in core if l["status"] == "completed")
    unstarted = sum(1 for l in core if l["status"] == "unstarted")
    sprint_done = sum(1 for l in core if states.get(l["original_repo"], (False, False))[0])

    first = next((l for t in TRACK_ORDER for l in sorted([x for x in labs if x["track"] == t and x["status"] != "reference"], key=lambda x: x["order"]) if not states.get(l["original_repo"], (False, False))[0]), None)

    lines = [
        "# ZCW Labs — Progress Tracker",
        "",
        "Track sprint completion, migration, and refresher re-tries. **Check boxes** as you go; run `./scripts/progress-stats.sh --write` to refresh percentages.",
        "",
        "## Dashboard",
        "",
        "<!-- AUTO:START dashboard -->",
        f"| Metric | Done | Total | % |",
        f"|--------|-----:|------:|--:|",
        f"| **Sprint (re-done)** | {sprint_done} | {len(core)} | {sprint_done * 100 // len(core) if core else 0}% |",
        f"| **Migrated to monorepo** | {sum(1 for l in core if states.get(l['original_repo'], (False, False))[1])} | {len(core)} | 0% |",
        f"| **2022 baseline** | {done2022} | {len(core)} | {done2022 * 100 // len(core) if core else 0}% |",
        f"| Reference (optional) | {sum(1 for l in ref if states.get(l['original_repo'], (False, False))[0])} | {len(ref)} | 0% |",
        "",
        f"**Sprint:** `{'█' * (sprint_done * 20 // len(core) if core else 0)}{'░' * (20 - sprint_done * 20 // len(core) if core else 20)}` {sprint_done * 100 // len(core) if core else 0}%  ",
        "**Migrate:** `░░░░░░░░░░░░░░░░░░░░` 0%",
        "<!-- AUTO:END dashboard -->",
        "",
        "## Sprint Settings",
        "",
        "| Field | Value |",
        "|-------|-------|",
        "| Sprint name | `2026-refresher` |",
        "| Started | _YYYY-MM-DD_ |",
        "| Target end | _YYYY-MM-DD_ |",
        "| Focus track | _all / java / python / …_ |",
        "| Notes | |",
        "",
        "## How to Filter (Ctrl+F / ⌘F)",
        "",
        "| Search term | Shows |",
        "|-------------|-------|",
        "| `[filter:sprint-open]` | Not yet re-done this sprint |",
        "| `[filter:sprint-done]` | Re-done this sprint |",
        "| `[filter:migrate-open]` | Not yet in monorepo |",
        "| `[filter:2022-skip]` | Never started in 2022 |",
        "| `[filter:2022-done]` | Done in 2022 — re-try on refresher branch |",
        "| `[filter:java]` | Java track only |",
        "| `[filter:python]` | Python track only |",
        "| `[filter:data-engineering]` | Data engineering only |",
        "| `[filter:sql]` | SQL only |",
        "",
        "**Tip:** After checking a sprint box, replace `[filter:sprint-open]` with `[filter:sprint-done]` on that row (or re-run `./scripts/generate-progress.sh`).",
        "",
        "> **Note:** `PandasIntro1` appears twice (python + data-engineering paths) — check both sprint boxes when done.",
        "",
        "## 📍 Resume Here",
        "",
        "_First unchecked sprint item in curriculum order:_",
        "",
    ]

    if first:
        lines.append(f"1. **{first['name']}** — `{first['path']}/` ({TRACK_LABELS.get(first['track'], first['track'])})")
    lines.append("")

    lines.append(f"<details><summary><strong>Queue: never started in 2022</strong> ({unstarted})</summary>")
    lines.append("")
    for t in TRACK_ORDER:
        items = [l for l in labs if l["track"] == t and l["status"] == "unstarted"]
        if not items:
            continue
        lines.append(f"### {TRACK_LABELS.get(t, t)}")
        lines.append("")
        for l in sorted(items, key=lambda x: x["order"]):
            lines.append(f"- [ ] {l['name']} — `{l['path']}/`")
        lines.append("")
    lines.append("</details>")
    lines.append("")

    lines.append(f"<details><summary><strong>Queue: re-try from 2022</strong> ({done2022})</summary>")
    lines.append("")
    lines.append("_Use `refresher` branch. Check sprint box when complete._")
    lines.append("")
    for t in TRACK_ORDER:
        items = [l for l in labs if l["track"] == t and l["status"] == "completed"]
        if not items:
            continue
        lines.append(f"### {TRACK_LABELS.get(t, t)}")
        lines.append("")
        for l in sorted(items, key=lambda x: x["order"]):
            lines.append(f"- [ ] {l['name']} — `{l['path']}/`")
        lines.append("")
    lines.append("</details>")
    lines.append("")

    lines.extend([
        "## Full Tracker",
        "",
        "**Columns:** Sprint = re-done this sprint · Migrate = imported to monorepo · 2022 = historical status",
        "",
        "| Filters | Sprint | Migrate | 2022 | # | Lab | Path |",
        "|---------|:------:|:-------:|:----:|--:|-----|------|",
    ])

    for t in TRACK_ORDER:
        items = [l for l in labs if l["track"] == t]
        if not items:
            continue
        lines.append(f"| **—— {TRACK_LABELS.get(t, t)} ——** | | | | | | |")
        for l in sorted(items, key=lambda x: x["order"]):
            lines.append(row(l, states))

    lines.extend([
        "",
        "## Legend",
        "",
        "| Symbol | Meaning |",
        "|--------|---------|",
        "| Sprint `- [ ]` | Re-complete lab on `refresher` branch this sprint |",
        "| Migrate `- [ ]` | Code imported under `labs/` |",
        "| ✅ 2022 | Completed during original cohort |",
        "| ⬜ 2022 | Forked but never committed |",
        "| 📚 ref | Optional reference material |",
        "",
        "## Recalculate Stats",
        "",
        "```bash",
        "./scripts/progress-stats.sh        # print stats",
        "./scripts/progress-stats.sh --write  # update dashboard in this file",
        "./scripts/generate-progress.sh   # rebuild from registry (keeps checkboxes)",
        "```",
        "",
    ])

    OUT.write_text("\n".join(lines))
    print(f"Wrote {OUT} ({len(core)} core, {len(ref)} reference)")


if __name__ == "__main__":
    main()
