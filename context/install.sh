#!/bin/bash
# Installs this repo's context skill to ~/.cursor/skills/context/ and the always-on rule to ~/.cursor/rules/context.mdc
# (writes docs/context.md — one product-context file per repo). Trigger: /context or @context
# Run from anywhere: bash install.sh
# If you used an older install targeting ~/.cursor/skills/spec and spec.mdc, remove those after verifying this one works.

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

RULE_SRC="$SKILL_ROOT/cursor-rule.mdc"
RULE_DEST="$HOME/.cursor/rules/context.mdc"
if [[ -f "$RULE_SRC" ]]; then
  mkdir -p "$HOME/.cursor/rules"
  cp "$RULE_SRC" "$RULE_DEST"
  echo ""
  echo "Installed always-on Cursor rule (honors docs/context.md per project):"
  echo "  $RULE_DEST"
fi

echo ""
echo "Installation complete!"
echo ""
echo "The skill is now available in Cursor. To use:"
echo "  1. Restart Cursor (or reload the window)"
echo "  2. In Agent chat, type /context or @context"
echo ""
