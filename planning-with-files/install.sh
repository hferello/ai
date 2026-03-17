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
chmod +x "$TARGET"/hooks/*.sh 2>/dev/null || true

# Add hooks only if ~/.cursor/hooks.json already exists (never create it)
CURSOR_HOOKS="$HOME/.cursor/hooks.json"
HOOKS_TEMPLATE="$TARGET/hooks/hooks.json"
if [[ -f "$CURSOR_HOOKS" ]] && [[ -f "$HOOKS_TEMPLATE" ]]; then
  if command -v python3 >/dev/null 2>&1; then
    python3 -c "
import json
with open(\"$CURSOR_HOOKS\") as f:
    existing = json.load(f)
with open(\"$HOOKS_TEMPLATE\") as f:
    template = json.load(f)
hooks = existing.get('hooks', {})
for k, v in template.get('hooks', {}).items():
    if k not in hooks:
        hooks[k] = v
existing['hooks'] = hooks
with open(\"$CURSOR_HOOKS\", 'w') as f:
    json.dump(existing, f, indent=2)
"
    echo "Hooks merged into $CURSOR_HOOKS (existing hooks preserved)"
  else
    echo "Python3 required to merge hooks. Copy manually from $HOOKS_TEMPLATE"
  fi
fi

echo ""
echo "Installation complete!"
echo ""
echo "The skill is now available in Cursor. To use:"
echo "  1. Restart Cursor (or reload the window)"
echo "  2. In Agent chat, type /planning-with-files or @planning-with-files"
echo ""
echo "To initialize planning files in a project, run from project root:"
echo "  ~/.cursor/skills/planning-with-files/scripts/init-session.sh <task-name>"
echo ""
