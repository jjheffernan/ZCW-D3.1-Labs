#!/usr/bin/env bash
# generate-progress.sh — Regenerate docs/PROGRESS.md from labs-registry.yaml
# Preserves checked boxes from existing PROGRESS.md when present.
# Usage: ./scripts/generate-progress.sh

set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
exec python3 "$ROOT/scripts/generate-progress.py"
