#!/usr/bin/env bash
# Update (or install) the feature skill to ~/.cursor/skills/feature/
#
# This overwrites the installed copy with the same content as install.sh — there is no separate "patch" upgrade.
#
# Usage:
#   ./update.sh              Fetch latest from GitHub (default repo) and install.
#   ./update.sh --local      Install from this directory (use after: git pull in your clone).
#
# Environment:
#   FEATURE_SKILL_REPO   Git URL (default: https://github.com/hferello/ai.git)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_URL="${FEATURE_SKILL_REPO:-https://github.com/hferello/ai.git}"

if [[ "${1:-}" == "--local" ]] || [[ "${1:-}" == "-l" ]]; then
  echo "Updating feature skill from local copy: $SCRIPT_DIR"
  exec bash "$SCRIPT_DIR/install.sh"
fi

if [[ -n "${1:-}" ]]; then
  echo "Usage: $0 [--local|--l]" >&2
  exit 1
fi

TMP="$(mktemp -d "${TMPDIR:-/tmp}/cursor-feature-skill-update.XXXXXX")"
cleanup() {
  rm -rf "$TMP"
}
trap cleanup EXIT

echo "Fetching latest from $REPO_URL ..."
git clone --depth 1 "$REPO_URL" "$TMP/repo"
bash "$TMP/repo/feature/install.sh"
echo ""
echo "Update complete. Quit and reopen Cursor to pick up changes."
