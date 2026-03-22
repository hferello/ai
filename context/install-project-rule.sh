#!/bin/bash
# Copies cursor-rule.mdc into a project's .cursor/rules/context.mdc (per-repo guardrails).
# Usage: bash install-project-rule.sh [path-to-project-root]
# Default path is the current working directory.

set -e

if [[ -n "${BASH_SOURCE[0]}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
  SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
fi

RULE_SRC="$SCRIPT_DIR/cursor-rule.mdc"
PROJECT_ROOT="$(cd "${1:-.}" && pwd)"
RULE_DEST_DIR="$PROJECT_ROOT/.cursor/rules"
RULE_DEST="$RULE_DEST_DIR/context.mdc"

if [[ ! -f "$RULE_SRC" ]]; then
  echo "Error: cursor-rule.mdc not found next to this script."
  exit 1
fi

mkdir -p "$RULE_DEST_DIR"
cp "$RULE_SRC" "$RULE_DEST"
echo "Installed project rule:"
echo "  $RULE_DEST"
echo ""
echo "Commit .cursor/rules/context.mdc so everyone on the team gets the same guardrails."
