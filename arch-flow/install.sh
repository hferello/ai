#!/bin/bash
# Installs this repo's arch-flow skill to ~/.cursor/skills/arch-flow/
# Trigger: /arch-flow or @arch-flow
# Run from anywhere: bash install.sh

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
  echo "Error: Could not find SKILL.md. Run this from the arch-flow skill directory."
  exit 1
fi

TARGET="$HOME/.cursor/skills/arch-flow"

echo "Installing arch-flow skill..."
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
echo "  2. In Agent chat, type /arch-flow or @arch-flow"
echo ""
echo "Optional FigJam diagrams require the Figma plugin in Cursor."
echo ""
