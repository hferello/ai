# Initialize planning files for a new session
# Run from project root: init-session.ps1 [task-name]
# Creates features\ if missing, then features\<task>\ with task_plan.md, findings.md, progress.md, documentation.md
#
# Example: .\init-session.ps1 audit-logging  → features\audit-logging\
# Example: .\init-session.ps1 "dark mode toggle"  → features\dark-mode-toggle\
# Example: .\init-session.ps1  → features\2025-03-19-task-1\ (auto-increments per day)

param(
    [Parameter(Mandatory=$false)]
    [string]$TaskName
)

$DATE = Get-Date -Format "yyyy-MM-dd"

# Root container for all planning folders
$RootDir = "features"

# If no task name given, use {yyyy}-{mm}-{dd}-task-{N} with auto-increment
if ([string]::IsNullOrEmpty($TaskName)) {
  $DatePrefix = $DATE
  $MaxNum = 0
  if (Test-Path $RootDir) {
    $Pattern = "^$([regex]::Escape($DatePrefix))-task-(\d+)$"
    Get-ChildItem -Path $RootDir -Directory | ForEach-Object {
      if ($_.Name -match $Pattern) {
        $n = [int]$Matches[1]
        if ($n -gt $MaxNum) { $MaxNum = $n }
      }
    }
  }
  $FolderName = "$DatePrefix-task-$($MaxNum + 1)"
  $TaskName = $FolderName
} else {
  # Sanitize: lowercase, spaces/hyphens/underscores to single hyphen, remove special chars
  $FolderName = $TaskName.ToLower() -replace '[^a-z0-9\s\-_]', '' -replace '[\s_\-]+', '-' -replace '^-|-$', ''
  if ([string]::IsNullOrEmpty($FolderName)) { $FolderName = "plan" }
}

# Full path: features\<task-name>\
$PlanDir = Join-Path $RootDir $FolderName

Write-Host "Initializing planning files for: $TaskName"
Write-Host "Root folder: $RootDir\ (created if missing)"
Write-Host "Task folder: $PlanDir\"
Write-Host ""

if (-not (Test-Path $PlanDir)) {
    New-Item -ItemType Directory -Path $PlanDir -Force | Out-Null
}

# Create task_plan.md if it doesn't exist
if (-not (Test-Path "$PlanDir\task_plan.md")) {
    @"
# Task Plan: $TaskName

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
"@ | Out-File -FilePath "$PlanDir\task_plan.md" -Encoding UTF8
    Write-Host "Created $PlanDir\task_plan.md"
} else {
    Write-Host "$PlanDir\task_plan.md already exists, skipping"
}

# Create findings.md if it doesn't exist
if (-not (Test-Path "$PlanDir\findings.md")) {
    @"
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
"@ | Out-File -FilePath "$PlanDir\findings.md" -Encoding UTF8
    Write-Host "Created $PlanDir\findings.md"
} else {
    Write-Host "$PlanDir\findings.md already exists, skipping"
}

# Create documentation.md if it doesn't exist
if (-not (Test-Path "$PlanDir\documentation.md")) {
    @"
# Documentation: $TaskName

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
"@ | Out-File -FilePath "$PlanDir\documentation.md" -Encoding UTF8
    Write-Host "Created $PlanDir\documentation.md"
} else {
    Write-Host "$PlanDir\documentation.md already exists, skipping"
}

# Create progress.md if it doesn't exist
if (-not (Test-Path "$PlanDir\progress.md")) {
    @"
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
"@ | Out-File -FilePath "$PlanDir\progress.md" -Encoding UTF8
    Write-Host "Created $PlanDir\progress.md"
} else {
    Write-Host "$PlanDir\progress.md already exists, skipping"
}

# Create prd.md if it doesn't exist (Product Requirements Document)
if (-not (Test-Path "$PlanDir\prd.md")) {
    @"
# Product Requirements Document: $TaskName

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
"@ | Out-File -FilePath "$PlanDir\prd.md" -Encoding UTF8
    Write-Host "Created $PlanDir\prd.md"
} else {
    Write-Host "$PlanDir\prd.md already exists, skipping"
}

Write-Host ""
Write-Host "Planning files initialized!"
Write-Host "Folder: $PlanDir\"
Write-Host "Files: task_plan.md, findings.md, progress.md, documentation.md, prd.md"
Write-Host ""
Write-Host "Tell the AI: Read $PlanDir\task_plan.md, $PlanDir\findings.md, $PlanDir\progress.md, $PlanDir\documentation.md, and $PlanDir\prd.md first."
