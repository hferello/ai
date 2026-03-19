#!/bin/bash
# Initialize planning files for a new session
# Run from project root: init-session.sh [task-name]
# Creates features/ if missing, then features/<task>/ with task_plan.md, findings.md, progress.md, documentation.md
#
# Example: init-session.sh audit-logging  → features/audit-logging/
# Example: init-session.sh "dark mode toggle"  → features/dark-mode-toggle/
# Example: init-session.sh  → features/2025-03-19-task-1/ (auto-increments per day)

set -e

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

echo "Initializing planning files for: $TASK_NAME"
echo "Root folder: $ROOT_DIR/ (created if missing)"
echo "Task folder: $PLAN_DIR/"
echo ""

# Create root container if it doesn't exist, then task folder
mkdir -p "$PLAN_DIR"

# Create task_plan.md if it doesn't exist
if [ ! -f "$PLAN_DIR/task_plan.md" ]; then
    cat > "$PLAN_DIR/task_plan.md" << EOF
# Task Plan: $TASK_NAME

## Goal
[One sentence describing the end state]

## Current Phase
[Agent decides based on feature]

## Phases / Task Groups

[Agent adds phases or task groups as needed—e.g. Foundation, Backend, Frontend, Tests, or custom. Each with - [ ] tasks and Status: pending|in_progress|complete]

## Decisions Made
| Decision | Rationale |
|----------|-----------|

## Errors Encountered
| Error | Resolution |
|-------|------------|
EOF
    echo "Created $PLAN_DIR/task_plan.md"
else
    echo "$PLAN_DIR/task_plan.md already exists, skipping"
fi

# Create findings.md if it doesn't exist
if [ ! -f "$PLAN_DIR/findings.md" ]; then
    cat > "$PLAN_DIR/findings.md" << 'EOF'
# Findings & Decisions

## Requirements
-

## Research Findings
-

## Technical Decisions
| Decision | Rationale |
|----------|-----------|

## Issues Encountered
| Issue | Resolution |
|-------|------------|

## Resources
-
EOF
    echo "Created $PLAN_DIR/findings.md"
else
    echo "$PLAN_DIR/findings.md already exists, skipping"
fi

# Create documentation.md if it doesn't exist
if [ ! -f "$PLAN_DIR/documentation.md" ]; then
    cat > "$PLAN_DIR/documentation.md" << EOF
# Documentation: $TASK_NAME

## Overview
-

## What Was Built
-

## How It Works
-

## Usage
-

## Notes
-
EOF
    echo "Created $PLAN_DIR/documentation.md"
else
    echo "$PLAN_DIR/documentation.md already exists, skipping"
fi

# Create progress.md if it doesn't exist
if [ ! -f "$PLAN_DIR/progress.md" ]; then
    cat > "$PLAN_DIR/progress.md" << EOF
# Progress Log

## Session: $DATE

### Current Status
- **Phase/Group:** [Agent decides]
- **Started:** $DATE

### Actions Taken
-

### Test Results
| Test | Expected | Actual | Status |
|------|----------|--------|--------|

### Errors
| Error | Resolution |
|-------|------------|
EOF
    echo "Created $PLAN_DIR/progress.md"
else
    echo "$PLAN_DIR/progress.md already exists, skipping"
fi

# Create prd.md if it doesn't exist (Product Requirements Document)
if [ ! -f "$PLAN_DIR/prd.md" ]; then
    cat > "$PLAN_DIR/prd.md" << EOF
# Product Requirements Document: $TASK_NAME

## 1. Introduction/Overview
-

## 2. Goals
-

## 3. User Stories
-

## 4. Functional Requirements
-

## 5. Non-Goals (Out of Scope)
-

## 6. Design Considerations (Optional)
-

## 7. Technical Considerations (Optional)
-

## 8. Success Metrics
-

## 9. Open Questions
-
EOF
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
