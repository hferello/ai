# Initialize planning files for a new session
# Run from project root: init-session.ps1 <task-name>
# Creates planning-with-files\ if missing, then planning-with-files\<task>\ with task_plan.md, findings.md, progress.md
#
# Example: .\init-session.ps1 audit-logging  → planning-with-files\audit-logging\
# Example: .\init-session.ps1 "dark mode toggle"  → planning-with-files\dark-mode-toggle\

param(
    [Parameter(Mandatory=$true)]
    [string]$TaskName
)

$DATE = Get-Date -Format "yyyy-MM-dd"

# Root container for all planning folders
$RootDir = "planning-with-files"

# Sanitize: lowercase, spaces/hyphens/underscores to single hyphen, remove special chars
$FolderName = $TaskName.ToLower() -replace '[^a-z0-9\s\-_]', '' -replace '[\s_\-]+', '-' -replace '^-|-$', ''
if ([string]::IsNullOrEmpty($FolderName)) { $FolderName = "plan" }

# Full path: planning-with-files\<task-name>\
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

# Create progress.md if it doesn't exist
if (-not (Test-Path "$PlanDir\progress.md")) {
    @"
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
"@ | Out-File -FilePath "$PlanDir\progress.md" -Encoding UTF8
    Write-Host "Created $PlanDir\progress.md"
} else {
    Write-Host "$PlanDir\progress.md already exists, skipping"
}

Write-Host ""
Write-Host "Planning files initialized!"
Write-Host "Folder: $PlanDir\"
Write-Host "Files: task_plan.md, findings.md, progress.md"
Write-Host ""
Write-Host "Tell the AI: Read $PlanDir\task_plan.md, $PlanDir\findings.md, and $PlanDir\progress.md first."
