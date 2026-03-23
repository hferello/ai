# Install feature skill to $env:USERPROFILE\.cursor\skills\ (global, all projects)
# Run from PowerShell: .\install.ps1

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Find skill root (directory containing SKILL.md)
if (Test-Path (Join-Path $ScriptDir "SKILL.md")) {
    $SkillRoot = $ScriptDir
} elseif (Test-Path (Join-Path (Split-Path -Parent $ScriptDir) "SKILL.md")) {
    $SkillRoot = Split-Path -Parent $ScriptDir
} else {
    Write-Host "Error: Could not find SKILL.md. Run this from the feature skill directory."
    exit 1
}

$Target = Join-Path $env:USERPROFILE ".cursor\skills\feature"

$SkillAbs = (Resolve-Path $SkillRoot).Path
if (Test-Path $Target) {
  $TargetAbs = (Resolve-Path $Target).Path
  if ($SkillAbs -eq $TargetAbs) {
    Write-Host "Error: Install source cannot be the same as $Target."
    Write-Host "  Clone the repo to another folder, then run install.ps1 from there, or run update.ps1 without -Local to fetch from GitHub."
    exit 1
  }
}

Write-Host "Installing feature skill..."
Write-Host "  From: $SkillRoot"
Write-Host "  To:   $Target"

$TargetParent = Split-Path -Parent $Target
if (-not (Test-Path $TargetParent)) {
    New-Item -ItemType Directory -Path $TargetParent -Force | Out-Null
}

if (Test-Path $Target) {
    Remove-Item -Path $Target -Recurse -Force
}
Copy-Item -Path $SkillRoot -Destination $TargetParent -Force

# Add hooks only if ~/.cursor/hooks.json already exists (never create it)
$CursorHooks = Join-Path $env:USERPROFILE ".cursor\hooks.json"
$HooksTemplate = Join-Path $Target "hooks\hooks.json"
if ((Test-Path $CursorHooks) -and (Test-Path $HooksTemplate)) {
    $mergedHooks = @{}
    $existing = Get-Content $CursorHooks -Raw | ConvertFrom-Json
    if ($existing.hooks) {
        $existing.hooks.PSObject.Properties | ForEach-Object { $mergedHooks[$_.Name] = $_.Value }
    }
    $template = Get-Content $HooksTemplate -Raw | ConvertFrom-Json
    $template.hooks.PSObject.Properties | ForEach-Object {
        if (-not $mergedHooks.ContainsKey($_.Name)) { $mergedHooks[$_.Name] = $_.Value }
    }
    $output = @{ hooks = $mergedHooks }
    $output | ConvertTo-Json -Depth 10 | Set-Content $CursorHooks -Encoding UTF8
    Write-Host "Hooks merged into $CursorHooks (existing hooks preserved)"
}

Write-Host ""
Write-Host "Installation complete!"
Write-Host ""
Write-Host "The skill is now available in Cursor. To use:"
Write-Host "  1. Restart Cursor (or reload the window)"
Write-Host "  2. In Agent chat, type /feature or @feature"
Write-Host ""
Write-Host "To initialize planning files in a project, run from project root:"
Write-Host "  & `"$Target\scripts\init-session.ps1`" <task-name>"
Write-Host ""
