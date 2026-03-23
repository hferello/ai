# Initialize planning files for a new session
# Run from project root: init-session.ps1 [task-name]
# Creates features\ if missing, then features\<task>\ by copying and rendering templates\
# (task_plan.md, findings.md, progress.md, documentation.md, prd.md).
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
$TemplateDir = Join-Path $PSScriptRoot "..\templates"

function Render-Template {
  param(
    [string]$TemplateFileName,
    [string]$DestinationPath
  )
  $src = Join-Path $TemplateDir $TemplateFileName
  if (-not (Test-Path $src)) {
    throw "Missing template file: $src"
  }
  $text = [System.IO.File]::ReadAllText($src, [System.Text.UTF8Encoding]::new($false))
  $text = $text.Replace("{{TASK_NAME}}", $TaskName)
  $text = $text.Replace("{{DATE}}", $DATE)
  $utf8NoBom = New-Object System.Text.UTF8Encoding $false
  [System.IO.File]::WriteAllText($DestinationPath, $text, $utf8NoBom)
}

Write-Host "Initializing planning files for: $TaskName"
Write-Host "Root folder: $RootDir\ (created if missing)"
Write-Host "Task folder: $PlanDir\"
Write-Host "Templates: $TemplateDir\"
Write-Host ""

if (-not (Test-Path $PlanDir)) {
    New-Item -ItemType Directory -Path $PlanDir -Force | Out-Null
}

# Create task_plan.md if it doesn't exist
if (-not (Test-Path "$PlanDir\task_plan.md")) {
    Render-Template -TemplateFileName "task_plan.md" -DestinationPath "$PlanDir\task_plan.md"
    Write-Host "Created $PlanDir\task_plan.md"
} else {
    Write-Host "$PlanDir\task_plan.md already exists, skipping"
}

# Create findings.md if it doesn't exist
if (-not (Test-Path "$PlanDir\findings.md")) {
    Render-Template -TemplateFileName "findings.md" -DestinationPath "$PlanDir\findings.md"
    Write-Host "Created $PlanDir\findings.md"
} else {
    Write-Host "$PlanDir\findings.md already exists, skipping"
}

# Create documentation.md if it doesn't exist
if (-not (Test-Path "$PlanDir\documentation.md")) {
    Render-Template -TemplateFileName "documentation.md" -DestinationPath "$PlanDir\documentation.md"
    Write-Host "Created $PlanDir\documentation.md"
} else {
    Write-Host "$PlanDir\documentation.md already exists, skipping"
}

# Create progress.md if it doesn't exist
if (-not (Test-Path "$PlanDir\progress.md")) {
    Render-Template -TemplateFileName "progress.md" -DestinationPath "$PlanDir\progress.md"
    Write-Host "Created $PlanDir\progress.md"
} else {
    Write-Host "$PlanDir\progress.md already exists, skipping"
}

# Create prd.md if it doesn't exist (Product Requirements Document)
if (-not (Test-Path "$PlanDir\prd.md")) {
    Render-Template -TemplateFileName "prd.md" -DestinationPath "$PlanDir\prd.md"
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
