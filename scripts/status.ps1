[CmdletBinding()]
param(
    [string]$CodexHome = $(if ($env:CODEX_HOME) { $env:CODEX_HOME } else { Join-Path $HOME '.codex' }),
    [string]$ClaudeHome = $(if ($env:CLAUDE_CONFIG_DIR) { $env:CLAUDE_CONFIG_DIR } else { Join-Path $HOME '.claude' })
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = Split-Path -Parent $PSScriptRoot
$manifest = Get-Content -LiteralPath (Join-Path $repoRoot 'manifest.json') -Raw -Encoding UTF8 | ConvertFrom-Json
$hasDrift = $false

function Get-FileMap {
    param([Parameter(Mandatory)][string]$Root)

    $map = @{}
    if (-not (Test-Path -LiteralPath $Root -PathType Container)) {
        return $map
    }

    Get-ChildItem -LiteralPath $Root -File -Recurse | ForEach-Object {
        $relative = [IO.Path]::GetRelativePath($Root, $_.FullName).Replace('\', '/')
        $map[$relative] = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
    }
    return $map
}

function Compare-ManagedTree {
    param(
        [Parameter(Mandatory)][string]$Source,
        [Parameter(Mandatory)][string]$Target,
        [Parameter(Mandatory)][string]$Label
    )

    if (-not (Test-Path -LiteralPath $Target -PathType Container)) {
        Write-Host "[MISSING] $Label"
        $script:hasDrift = $true
        return
    }

    $sourceMap = Get-FileMap -Root $Source
    $targetMap = Get-FileMap -Root $Target
    $keys = @($sourceMap.Keys + $targetMap.Keys | Sort-Object -Unique)
    foreach ($key in $keys) {
        if (-not $targetMap.ContainsKey($key)) {
            Write-Host "[MISSING] $Label/$key"
            $script:hasDrift = $true
        }
        elseif (-not $sourceMap.ContainsKey($key)) {
            Write-Host "[EXTRA]   $Label/$key"
            $script:hasDrift = $true
        }
        elseif ($sourceMap[$key] -ne $targetMap[$key]) {
            Write-Host "[CHANGED] $Label/$key"
            $script:hasDrift = $true
        }
    }
}

function Get-ResolvedClaudeSkillMap {
    param([Parameter(Mandatory)][string]$Name)

    $map = @{}
    $source = Join-Path $repoRoot "skills/$Name"
    Get-ChildItem -LiteralPath $source -File -Recurse | ForEach-Object {
        $relative = [IO.Path]::GetRelativePath($source, $_.FullName).Replace('\', '/')
        if (($relative -split '/')[0] -ne 'agents') {
            $map[$relative] = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
        }
    }

    $overlay = Join-Path $repoRoot "claude-overlays/$Name"
    if (Test-Path -LiteralPath $overlay -PathType Container) {
        Get-ChildItem -LiteralPath $overlay -File -Recurse | ForEach-Object {
            $relative = [IO.Path]::GetRelativePath($overlay, $_.FullName).Replace('\', '/')
            $map[$relative] = (Get-FileHash -LiteralPath $_.FullName -Algorithm SHA256).Hash
        }
    }
    return $map
}

function Compare-ManagedMap {
    param(
        [Parameter(Mandatory)][hashtable]$SourceMap,
        [Parameter(Mandatory)][string]$Target,
        [Parameter(Mandatory)][string]$Label
    )

    if (-not (Test-Path -LiteralPath $Target -PathType Container)) {
        Write-Host "[MISSING] $Label"
        $script:hasDrift = $true
        return
    }

    $targetMap = Get-FileMap -Root $Target
    $keys = @($SourceMap.Keys + $targetMap.Keys | Sort-Object -Unique)
    foreach ($key in $keys) {
        if (-not $targetMap.ContainsKey($key)) {
            Write-Host "[MISSING] $Label/$key"
            $script:hasDrift = $true
        }
        elseif (-not $SourceMap.ContainsKey($key)) {
            Write-Host "[EXTRA]   $Label/$key"
            $script:hasDrift = $true
        }
        elseif ($SourceMap[$key] -ne $targetMap[$key]) {
            Write-Host "[CHANGED] $Label/$key"
            $script:hasDrift = $true
        }
    }
}

$sourceAgents = Join-Path $repoRoot $manifest.globalInstructions
$targetAgents = Join-Path $CodexHome 'AGENTS.md'
if (-not (Test-Path -LiteralPath $targetAgents -PathType Leaf)) {
    Write-Host '[MISSING] AGENTS.md'
    $hasDrift = $true
}
elseif ((Get-FileHash -LiteralPath $sourceAgents -Algorithm SHA256).Hash -ne (Get-FileHash -LiteralPath $targetAgents -Algorithm SHA256).Hash) {
    Write-Host '[CHANGED] AGENTS.md'
    $hasDrift = $true
}

$sourceClaude = Join-Path $repoRoot $manifest.claudeGlobalInstructions
$targetClaude = Join-Path $ClaudeHome 'CLAUDE.md'
if (-not (Test-Path -LiteralPath $targetClaude -PathType Leaf)) {
    Write-Host '[MISSING] Claude Code CLAUDE.md'
    $hasDrift = $true
}
elseif ((Get-FileHash -LiteralPath $sourceClaude -Algorithm SHA256).Hash -ne (Get-FileHash -LiteralPath $targetClaude -Algorithm SHA256).Hash) {
    Write-Host '[CHANGED] Claude Code CLAUDE.md'
    $hasDrift = $true
}

foreach ($name in @($manifest.skills)) {
    Compare-ManagedTree -Source (Join-Path $repoRoot "skills/$name") -Target (Join-Path $CodexHome "skills/$name") -Label "skills/$name"
}

foreach ($name in @($manifest.claudeSkills)) {
    $expected = Get-ResolvedClaudeSkillMap -Name $name
    Compare-ManagedMap -SourceMap $expected -Target (Join-Path $ClaudeHome "skills/$name") -Label "claude-skills/$name"
}

foreach ($name in @($manifest.claudeRetiredSkills.PSObject.Properties.Name)) {
    if (Test-Path -LiteralPath (Join-Path $ClaudeHome "skills/$name") -PathType Container) {
        Write-Host "[RETIRED] claude-skills/$name"
        $hasDrift = $true
    }
}

if ($hasDrift) {
    Write-Host 'Managed runtime content differs from the repository.'
    exit 1
}

Write-Host 'Managed Codex and adapted Claude Code runtime content matches the repository.'
exit 0
