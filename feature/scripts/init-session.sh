#!/bin/bash
# Initialize planning files for a new session
# Run from project root: init-session.sh [task-name]
# Creates features/ if missing, then features/<task>/ by copying and rendering templates/
# (task_plan.md, findings.md, progress.md, documentation.md, prd.md).
#
# Example: init-session.sh audit-logging  → features/audit-logging/
# Example: init-session.sh "dark mode toggle"  → features/dark-mode-toggle/
# Example: init-session.sh  → features/2025-03-19-task-1/ (auto-increments per day)

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="$SCRIPT_DIR/../templates"

DATE=$(date +%Y-%m-%d)

# Root container for all planning folders
ROOT_DIR="features"

# If no task name given, use {yyyy}-{mm}-{dd}-task-{N} with auto-increment
if [ -z "${1:-}" ]; then
  DATE_PREFIX="$DATE"
  MAX_NUM=0
  if [ -d "$ROOT_DIR" ]; then
    for dir in "$ROOT_DIR"/${DATE_PREFIX}-task-*; do
      [ -d "$dir" ] || continue
      num=$(basename "$dir" | sed 's/.*task-//')
      if [[ "$num" =~ ^[0-9]+$ ]] && [ "$num" -gt "$MAX_NUM" ]; then
        MAX_NUM=$num
      fi
    done
  fi
  FOLDER_NAME="${DATE_PREFIX}-task-$((MAX_NUM + 1))"
  TASK_NAME="$FOLDER_NAME"
else
  TASK_NAME="$1"
  # Sanitize: lowercase, spaces/hyphens/underscores to single hyphen, remove special chars
  FOLDER_NAME=$(echo "$TASK_NAME" | tr '[:upper:]' '[:lower:]' | tr -s ' _-' '-' | sed 's/[^a-z0-9-]//g' | sed 's/^-//' | sed 's/-$//')
  FOLDER_NAME="${FOLDER_NAME:-plan}"
fi

# Full path: features/<task-name>/
PLAN_DIR="$ROOT_DIR/$FOLDER_NAME"

# Render templates/{{name}} → dest; substitutes {{TASK_NAME}} and {{DATE}}
render_template() {
  local template_basename="$1"
  local dest_path="$2"
  local src_path="$TEMPLATE_DIR/$template_basename"
  if [ ! -f "$src_path" ]; then
    echo "ERROR: Missing template file: $src_path" >&2
    exit 1
  fi
  export TASK_NAME
  export DATE
  python3 -c 'import os, sys; from pathlib import Path; src, dst = sys.argv[1], sys.argv[2]; t = os.environ["TASK_NAME"]; d = os.environ["DATE"]; x = Path(src).read_text(encoding="utf-8"); Path(dst).write_text(x.replace("{{TASK_NAME}}", t).replace("{{DATE}}", d), encoding="utf-8")' "$src_path" "$dest_path"
}

echo "Initializing planning files for: $TASK_NAME"
echo "Root folder: $ROOT_DIR/ (created if missing)"
echo "Task folder: $PLAN_DIR/"
echo "Templates: $TEMPLATE_DIR/"
echo ""

# Create root container if it doesn't exist, then task folder
mkdir -p "$PLAN_DIR"

# Create task_plan.md if it doesn't exist
if [ ! -f "$PLAN_DIR/task_plan.md" ]; then
  render_template "task_plan.md" "$PLAN_DIR/task_plan.md"
  echo "Created $PLAN_DIR/task_plan.md"
else
  echo "$PLAN_DIR/task_plan.md already exists, skipping"
fi

# Create findings.md if it doesn't exist
if [ ! -f "$PLAN_DIR/findings.md" ]; then
  render_template "findings.md" "$PLAN_DIR/findings.md"
  echo "Created $PLAN_DIR/findings.md"
else
  echo "$PLAN_DIR/findings.md already exists, skipping"
fi

# Create documentation.md if it doesn't exist
if [ ! -f "$PLAN_DIR/documentation.md" ]; then
  render_template "documentation.md" "$PLAN_DIR/documentation.md"
  echo "Created $PLAN_DIR/documentation.md"
else
  echo "$PLAN_DIR/documentation.md already exists, skipping"
fi

# Create progress.md if it doesn't exist
if [ ! -f "$PLAN_DIR/progress.md" ]; then
  render_template "progress.md" "$PLAN_DIR/progress.md"
  echo "Created $PLAN_DIR/progress.md"
else
  echo "$PLAN_DIR/progress.md already exists, skipping"
fi

# Create prd.md if it doesn't exist (Product Requirements Document)
if [ ! -f "$PLAN_DIR/prd.md" ]; then
  render_template "prd.md" "$PLAN_DIR/prd.md"
  echo "Created $PLAN_DIR/prd.md"
else
  echo "$PLAN_DIR/prd.md already exists, skipping"
fi

echo ""
echo "Planning files initialized!"
echo "Path: $PLAN_DIR/"
echo "Files: task_plan.md, findings.md, progress.md, documentation.md, prd.md"
echo ""
echo "Tell the AI: Read $PLAN_DIR/task_plan.md, $PLAN_DIR/findings.md, $PLAN_DIR/progress.md, $PLAN_DIR/documentation.md, and $PLAN_DIR/prd.md first."
