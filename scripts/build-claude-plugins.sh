#!/bin/bash
# build-claude-plugins.sh
#
# Purpose: Keep the Claude Code plugins in `plugins/` in sync with the single
# source of truth - the root `context/` and `feature/` skill folders (which are
# also the Cursor skills). You edit the root skill, run this script, and commit.
#
# What it does, per skill:
#   1. Wipes and recreates plugins/<name>/skills/<name>/ (the generated copy).
#   2. Copies SKILL.md plus any references/, scripts/, templates/ directories.
#      Cursor-only files (install.sh, update.sh, *.ps1, package.sh, README.md,
#      Cursor hooks/) are deliberately NOT copied - the plugin uses Claude-native
#      install (marketplace) and Claude-format hooks instead.
#   3. Rewrites Cursor-specific absolute paths in SKILL.md to the Claude plugin
#      variable ${CLAUDE_PLUGIN_ROOT}, and softens the "no hooks in Cursor" note.
#
# It does NOT touch the curated plugin wrappers (plugin.json, Claude hooks) or
# the root marketplace.json — those are hand-maintained and rarely change.
#
# Run from anywhere: bash scripts/build-claude-plugins.sh

set -euo pipefail

# Resolve repo root as the parent of this script's directory.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

# Skills to package as Claude plugins. Each name maps to a root folder and a
# plugin folder of the same name.
SKILLS=(context feature)

echo "Building Claude Code plugins from root skills..."
echo "  Repo root: $REPO_ROOT"
echo ""

for name in "${SKILLS[@]}"; do
  SRC="$REPO_ROOT/$name"
  DEST="$REPO_ROOT/plugins/$name/skills/$name"

  if [[ ! -f "$SRC/SKILL.md" ]]; then
    echo "  SKIP $name - no SKILL.md at $SRC"
    continue
  fi

  echo "  Generating plugin skill: $name"
  echo "    From: $SRC"
  echo "    To:   $DEST"

  # Fresh copy every run so deletions in the source propagate.
  rm -rf "$DEST"
  mkdir -p "$DEST"

  # Always copy the skill entrypoint.
  cp "$SRC/SKILL.md" "$DEST/SKILL.md"

  # Copy the supporting bundles that exist for this skill.
  for sub in references scripts templates; do
    if [[ -d "$SRC/$sub" ]]; then
      cp -R "$SRC/$sub" "$DEST/$sub"
    fi
  done

  # Make bundled scripts executable (they self-resolve their own dir at runtime).
  if [[ -d "$DEST/scripts" ]]; then
    chmod +x "$DEST"/scripts/*.sh 2>/dev/null || true
  fi

  # Rewrite Cursor-specific references across generated markdown to the Claude
  # plugin path variable. Then apply SKILL.md-only wording tweaks.
  python3 - "$DEST" "$name" <<'PY'
import sys
from pathlib import Path

dest_dir = Path(sys.argv[1])
name = sys.argv[2]
skill_md = dest_dir / "SKILL.md"

# 1) Cursor install path -> Claude plugin path. Scripts live under the skill
#    folder inside the plugin, so the plugin-root-relative path is
#    ${CLAUDE_PLUGIN_ROOT}/skills/<name>/...
for md_path in dest_dir.rglob("*.md"):
    text = md_path.read_text(encoding="utf-8")
    text = text.replace(
        f"~/.cursor/skills/{name}",
        f"${{CLAUDE_PLUGIN_ROOT}}/skills/{name}",
    )
    md_path.write_text(text, encoding="utf-8")

# 2) SKILL.md-only: soften Cursor-specific "no hooks" framing. Claude Code
#    ships hooks here, but manual discipline still matters as a fallback.
text = skill_md.read_text(encoding="utf-8")

text = text.replace(
    "## CRITICAL: Manual Discipline (No Hooks in Cursor)",
    "## CRITICAL: Manual Discipline (hooks are a safety net)",
)
text = text.replace(
    "Cursor does not support automatic hooks. You must **manually** follow these rules:",
    "This plugin ships Claude Code hooks that nudge you automatically, but they are only a safety net - you must still **manually** follow these rules:",
)

skill_md.write_text(text, encoding="utf-8")
print("    Rewrote markdown paths and skill notes")
PY

  echo ""
done

echo "Done. Generated skill copies under plugins/*/skills/."
echo "Curated files (plugin.json, hooks, marketplace.json) were left untouched."
