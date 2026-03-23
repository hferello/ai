# Update (or install) the feature skill to $env:USERPROFILE\.cursor\skills\feature\
#
# Same end state as install.ps1 — full overwrite of the installed skill.
#
# Usage:
#   .\update.ps1              Clone default repo from GitHub and install.
#   .\update.ps1 -Local       Install from this directory (use after: git pull in your clone).
#
# Environment:
#   $env:FEATURE_SKILL_REPO   Git URL (default: https://github.com/hferello/ai.git)

$ErrorActionPreference = "Stop"

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

if ($args -contains "-Local" -or $args -contains "-l") {
    Write-Host "Updating feature skill from local copy: $ScriptDir"
    & (Join-Path $ScriptDir "install.ps1")
    exit $LASTEXITCODE
}

$RepoUrl = if ($env:FEATURE_SKILL_REPO) { $env:FEATURE_SKILL_REPO } else { "https://github.com/hferello/ai.git" }
$Tmp = Join-Path $env:TEMP ("cursor-feature-skill-update-" + [guid]::NewGuid().ToString("N"))
Write-Host "Fetching latest from $RepoUrl ..."
New-Item -ItemType Directory -Path $Tmp -Force | Out-Null
try {
    git clone --depth 1 $RepoUrl (Join-Path $Tmp "repo")
    & (Join-Path $Tmp "repo\feature\install.ps1")
} finally {
    Remove-Item -Recurse -Force $Tmp -ErrorAction SilentlyContinue
}
Write-Host ""
Write-Host "Update complete. Quit and reopen Cursor to pick up changes."
