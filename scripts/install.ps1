[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [string]$CodexHome = $(if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }),
    [string]$ClaudeHome = $(if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { Join-Path $HOME '.claude' }),
    [switch]$SkipBackup
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = Split-Path -Parent $PSScriptRoot
$manifest = Get-Content -LiteralPath (Join-Path $repoRoot 'manifest.json') -Raw -Encoding UTF8 | ConvertFrom-Json
$codexHomeFull = [IO.Path]::GetFullPath($CodexHome)
$claudeHomeFull = [IO.Path]::GetFullPath($ClaudeHome)
$skillsTarget = Join-Path $codexHomeFull 'skills'
$claudeSkillsTarget = Join-Path $claudeHomeFull 'skills'
$timestamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$codexBackupRoot = Join-Path $codexHomeFull "harness-backups/$timestamp"
$claudeBackupRoot = Join-Path $claudeHomeFull "harness-backups/$timestamp"

function Copy-TreeFiles {
    param(
        [Parameter(Mandatory)][string]$Source,
        [Parameter(Mandatory)][string]$Target,
        [switch]$ExcludeAgents
    )

    Get-ChildItem -LiteralPath $Source -File -Recurse | ForEach-Object {
        $relative = [IO.Path]::GetRelativePath($Source, $_.FullName)
        $topLevel = ($relative -split '[\\/]')[0]
        if ($ExcludeAgents -and $topLevel -eq 'agents') {
            return
        }

        $destination = Join-Path $Target $relative
        New-Item -ItemType Directory -Path (Split-Path -Parent $destination) -Force | Out-Null
        Copy-Item -LiteralPath $_.FullName -Destination $destination -Force
    }
}

& pwsh -NoProfile -File (Join-Path $PSScriptRoot 'validate.ps1')
if ($LASTEXITCODE -ne 0) {
    throw 'Repository validation failed; installation was not started.'
}

if (-not $PSCmdlet.ShouldProcess("$codexHomeFull and $claudeHomeFull", 'Install managed agent harness assets')) {
    return
}

New-Item -ItemType Directory -Path $codexHomeFull -Force | Out-Null
New-Item -ItemType Directory -Path $skillsTarget -Force | Out-Null
New-Item -ItemType Directory -Path $claudeHomeFull -Force | Out-Null
New-Item -ItemType Directory -Path $claudeSkillsTarget -Force | Out-Null

$sourceAgents = Join-Path $repoRoot $manifest.globalInstructions
$targetAgents = Join-Path $codexHomeFull 'AGENTS.md'
if ((Test-Path -LiteralPath $targetAgents -PathType Leaf) -and -not $SkipBackup) {
    New-Item -ItemType Directory -Path $codexBackupRoot -Force | Out-Null
    Copy-Item -LiteralPath $targetAgents -Destination (Join-Path $codexBackupRoot 'AGENTS.md') -Force
}
Copy-Item -LiteralPath $sourceAgents -Destination $targetAgents -Force

$sourceClaude = Join-Path $repoRoot $manifest.claudeGlobalInstructions
$targetClaude = Join-Path $claudeHomeFull 'CLAUDE.md'
if ((Test-Path -LiteralPath $targetClaude -PathType Leaf) -and -not $SkipBackup) {
    New-Item -ItemType Directory -Path $claudeBackupRoot -Force | Out-Null
    Copy-Item -LiteralPath $targetClaude -Destination (Join-Path $claudeBackupRoot 'CLAUDE.md') -Force
}
Copy-Item -LiteralPath $sourceClaude -Destination $targetClaude -Force

foreach ($name in @($manifest.skills)) {
    if ($name -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
        throw "Unsafe skill name in manifest: $name"
    }

    $source = Join-Path $repoRoot "skills/$name"
    $target = Join-Path $skillsTarget $name
    if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md') -PathType Leaf)) {
        throw "Source skill is incomplete: $source"
    }

    if (Test-Path -LiteralPath $target -PathType Container) {
        if (-not $SkipBackup) {
            $backupSkills = Join-Path $codexBackupRoot 'skills'
            New-Item -ItemType Directory -Path $backupSkills -Force | Out-Null
            Copy-Item -LiteralPath $target -Destination (Join-Path $backupSkills $name) -Recurse -Force
        }
        Remove-Item -LiteralPath $target -Recurse -Force
    }

    Copy-Item -LiteralPath $source -Destination $target -Recurse
}

foreach ($name in @($manifest.claudeSkills)) {
    if ($name -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
        throw "Unsafe Claude Code skill name in manifest: $name"
    }

    $source = Join-Path $repoRoot "skills/$name"
    $overlay = Join-Path $repoRoot "claude-overlays/$name"
    $target = Join-Path $claudeSkillsTarget $name
    if (-not (Test-Path -LiteralPath (Join-Path $source 'SKILL.md') -PathType Leaf)) {
        throw "Claude Code source skill is incomplete: $source"
    }

    if (Test-Path -LiteralPath $target -PathType Container) {
        if (-not $SkipBackup) {
            $backupSkills = Join-Path $claudeBackupRoot 'skills'
            New-Item -ItemType Directory -Path $backupSkills -Force | Out-Null
            Copy-Item -LiteralPath $target -Destination (Join-Path $backupSkills $name) -Recurse -Force
        }
        Remove-Item -LiteralPath $target -Recurse -Force
    }

    New-Item -ItemType Directory -Path $target -Force | Out-Null
    Copy-TreeFiles -Source $source -Target $target -ExcludeAgents
    if (Test-Path -LiteralPath $overlay -PathType Container) {
        Copy-TreeFiles -Source $overlay -Target $target
    }
}

foreach ($name in @($manifest.claudeRetiredSkills.PSObject.Properties.Name)) {
    if ($name -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
        throw "Unsafe retired Claude Code skill name in manifest: $name"
    }

    $target = Join-Path $claudeSkillsTarget $name
    if (Test-Path -LiteralPath $target -PathType Container) {
        if (-not $SkipBackup) {
            $backupSkills = Join-Path $claudeBackupRoot 'retired-skills'
            New-Item -ItemType Directory -Path $backupSkills -Force | Out-Null
            Copy-Item -LiteralPath $target -Destination (Join-Path $backupSkills $name) -Recurse -Force
        }
        Remove-Item -LiteralPath $target -Recurse -Force
    }
}

Write-Host "Installed $(@($manifest.skills).Count) skills into $codexHomeFull."
Write-Host "Installed $(@($manifest.claudeSkills).Count) adapted skills and global instructions into $claudeHomeFull; retired $(@($manifest.claudeRetiredSkills.PSObject.Properties.Name).Count) superseded Claude Code skill names when present."
if (-not $SkipBackup -and (Test-Path -LiteralPath $codexBackupRoot)) {
    Write-Host "Previous Codex content was backed up to $codexBackupRoot."
}
if (-not $SkipBackup -and (Test-Path -LiteralPath $claudeBackupRoot)) {
    Write-Host "Previous Claude Code content was backed up to $claudeBackupRoot."
}

& (Join-Path $PSScriptRoot 'status.ps1') -CodexHome $codexHomeFull -ClaudeHome $claudeHomeFull
exit $LASTEXITCODE
