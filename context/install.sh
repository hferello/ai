#!/bin/bash
# Installs this repo's context skill to ~/.cursor/skills/context/
# (writes docs/context.md — one product-context file per repo). Trigger: /context or @context
# The Cursor rule is per-project — use install-project-rule.sh in each repo (see README).
# Run from anywhere: bash install.sh
# If you used an older install targeting ~/.cursor/rules/context.mdc globally, remove that file after migrating to a project rule.

set -e

if [[ -n "${BASH_SOURCE[0]}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
  SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
fi

if [[ -f "$SCRIPT_DIR/SKILL.md" ]]; then
  SKILL_ROOT="$SCRIPT_DIR"
elif [[ -f "$SCRIPT_DIR/../SKILL.md" ]]; then
  SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
else
  echo "Error: Could not find SKILL.md. Run this from the context skill directory."
  exit 1
fi

TARGET="$HOME/.cursor/skills/context"

echo "Installing context skill..."
echo "  From: $SKILL_ROOT"
echo "  To:   $TARGET"

mkdir -p "$(dirname "$TARGET")"
rm -rf "$TARGET"
cp -R "$SKILL_ROOT" "$(dirname "$TARGET")"

echo ""
echo "Installation complete!"
echo ""
echo "The skill is now available in Cursor. To use:"
echo "  1. Restart Cursor (or reload the window)"
echo "  2. In Agent chat, type /context or @context"
echo ""
echo "Per-project rule (recommended): install cursor-rule.mdc into each repo's .cursor/rules/"
echo "  bash \"$SKILL_ROOT/install-project-rule.sh\" [path-to-project-root]"
echo ""
