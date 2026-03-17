#!/bin/bash
# Initialize planning files for a new session
# Run from project root: init-session.sh <task-name>
# Creates planning-with-files/ if missing, then planning-with-files/<task>/ with task_plan.md, findings.md, progress.md, documentation.md
#
# Example: init-session.sh audit-logging  → planning-with-files/audit-logging/
# Example: init-session.sh "dark mode toggle"  → planning-with-files/dark-mode-toggle/

set -e

TASK_NAME="${1:?Usage: init-session.sh <task-name>}"
DATE=$(date +%Y-%m-%d)

# Root container for all planning folders
ROOT_DIR="planning-with-files"

# Sanitize: lowercase, spaces/hyphens/underscores to single hyphen, remove special chars
FOLDER_NAME=$(echo "$TASK_NAME" | tr '[:upper:]' '[:lower:]' | tr -s ' _-' '-' | sed 's/[^a-z0-9-]//g' | sed 's/^-//' | sed 's/-$//')
FOLDER_NAME="${FOLDER_NAME:-plan}"

# Full path: planning-with-files/<task-name>/
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
Phase 1

## Phases

### Phase 1: Requirements & Discovery
- [ ] Understand user intent
- [ ] Identify constraints
- [ ] Document in findings.md
- **Status:** in_progress

### Phase 2: Planning & Structure
- [ ] Define approach
- [ ] Create project structure
- **Status:** pending

### Phase 3: Implementation
- [ ] Execute the plan
- [ ] Write to files before executing
- **Status:** pending

### Phase 4: Testing & Verification
- [ ] Verify requirements met
- [ ] Document test results
- **Status:** pending

### Phase 5: Delivery
- [ ] Review outputs
- [ ] Deliver to user
- **Status:** pending

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
- **Phase:** 1 - Requirements & Discovery
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

echo ""
echo "Planning files initialized!"
echo "Path: $PLAN_DIR/"
echo "Files: task_plan.md, findings.md, progress.md, documentation.md"
echo ""
echo "Tell the AI: Read $PLAN_DIR/task_plan.md, $PLAN_DIR/findings.md, $PLAN_DIR/progress.md, and $PLAN_DIR/documentation.md first."
