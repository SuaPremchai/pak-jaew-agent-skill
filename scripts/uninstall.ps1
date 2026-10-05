param(
    [ValidateSet('codex', 'claude', 'both')]
    [string]$Target = 'both',

    [ValidateSet('user', 'project')]
    [string]$Scope = 'user'
)

$ErrorActionPreference = 'Stop'

if ($Scope -eq 'user') {
    $CodexDest = Join-Path $HOME '.codex\skills\pak-jaew'
    $ClaudeDest = Join-Path $HOME '.claude\skills\pak-jaew'
} else {
    $CodexDest = Join-Path (Get-Location) '.codex\skills\pak-jaew'
    $ClaudeDest = Join-Path (Get-Location) '.claude\skills\pak-jaew'
}

function Remove-Skill([string]$Destination) {
    if (Test-Path $Destination) {
        Remove-Item -Recurse -Force $Destination
        Write-Host "Removed $Destination"
    } else {
        Write-Host "Not installed: $Destination"
    }
}

if ($Target -in @('codex', 'both')) { Remove-Skill $CodexDest }
if ($Target -in @('claude', 'both')) { Remove-Skill $ClaudeDest }
