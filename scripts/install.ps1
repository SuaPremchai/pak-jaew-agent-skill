param(
    [ValidateSet('codex', 'claude', 'both')]
    [string]$Target = 'both',

    [ValidateSet('user', 'project')]
    [string]$Scope = 'user'
)

$ErrorActionPreference = 'Stop'
$RootDir = Split-Path -Parent $PSScriptRoot
$SourceDir = Join-Path $RootDir 'skills\pak-jaew'

function Install-Skill([string]$Destination) {
    $Parent = Split-Path -Parent $Destination
    New-Item -ItemType Directory -Force -Path $Parent | Out-Null
    if (Test-Path $Destination) {
        Remove-Item -Recurse -Force $Destination
    }
    Copy-Item -Recurse -Force $SourceDir $Destination
    Write-Host "Installed pak-jaew -> $Destination"
}

if ($Scope -eq 'user') {
    $CodexDest = Join-Path $HOME '.codex\skills\pak-jaew'
    $ClaudeDest = Join-Path $HOME '.claude\skills\pak-jaew'
} else {
    $CodexDest = Join-Path (Get-Location) '.codex\skills\pak-jaew'
    $ClaudeDest = Join-Path (Get-Location) '.claude\skills\pak-jaew'
}

if ($Target -in @('codex', 'both')) { Install-Skill $CodexDest }
if ($Target -in @('claude', 'both')) { Install-Skill $ClaudeDest }

Write-Host ''
Write-Host 'Done. Restart the agent session if it was already open.'
Write-Host 'Try: Use pak-jaew mode=pak-jaew intensity=3 language=th'
