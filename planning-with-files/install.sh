#!/bin/bash
# Install planning-with-files skill to ~/.cursor/skills/ (global, all projects)
# Run from anywhere: bash install.sh
# Or: curl -fsSL https://raw.githubusercontent.com/YOUR_REPO/main/install.sh | bash

set -e

# Find script directory (works when run from skill dir, project root, or via curl)
if [[ -n "${BASH_SOURCE[0]}" ]]; then
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
else
  SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
fi

# Skill root is the parent of scripts/ (if we're in scripts/) or the dir containing SKILL.md
if [[ -f "$SCRIPT_DIR/SKILL.md" ]]; then
  SKILL_ROOT="$SCRIPT_DIR"
elif [[ -f "$SCRIPT_DIR/../SKILL.md" ]]; then
  SKILL_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
else
  echo "Error: Could not find SKILL.md. Run this from the planning-with-files skill directory."
  exit 1
fi

TARGET="$HOME/.cursor/skills/planning-with-files"

echo "Installing planning-with-files skill..."
echo "  From: $SKILL_ROOT"
echo "  To:   $TARGET"

mkdir -p "$(dirname "$TARGET")"
rm -rf "$TARGET"
cp -R "$SKILL_ROOT" "$(dirname "$TARGET")"

# Ensure scripts are executable
chmod +x "$TARGET"/scripts/*.sh 2>/dev/null || true

echo ""
echo "Installation complete!"
echo ""
echo "The skill is now available in Cursor. To use:"
echo "  1. Restart Cursor (or reload the window)"
echo "  2. In Agent chat, type /planning-with-files or @planning-with-files"
echo ""
echo "To initialize planning files in a project, run from project root:"
echo "  ~/.cursor/skills/planning-with-files/scripts/init-session.sh"
echo ""
