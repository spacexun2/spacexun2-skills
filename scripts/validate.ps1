[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = Split-Path -Parent $PSScriptRoot
$manifestPath = Join-Path $repoRoot 'manifest.json'
$errors = [System.Collections.Generic.List[string]]::new()

if (-not (Test-Path -LiteralPath $manifestPath -PathType Leaf)) {
    throw "Missing manifest: $manifestPath"
}

$manifest = Get-Content -LiteralPath $manifestPath -Raw -Encoding UTF8 | ConvertFrom-Json
$skillNames = @($manifest.skills)
$claudeSkillNames = @($manifest.claudeSkills)
$claudeExcludedNames = @($manifest.claudeExcludedSkills.PSObject.Properties.Name)
$claudeRetiredNames = @($manifest.claudeRetiredSkills.PSObject.Properties.Name)

if ($manifest.visibility -ne 'public') {
    $errors.Add('manifest.json visibility must be public for this repository.')
}

if ($skillNames.Count -ne @($skillNames | Sort-Object -Unique).Count) {
    $errors.Add('manifest.json contains duplicate skill names.')
}
if ($claudeSkillNames.Count -ne @($claudeSkillNames | Sort-Object -Unique).Count) {
    $errors.Add('manifest.json contains duplicate Claude Code skill names.')
}
if (@($claudeSkillNames | Where-Object { $_ -notin $skillNames }).Count -gt 0) {
    $errors.Add('Every Claude Code skill must have a canonical source in skills/.')
}
if (@($claudeSkillNames | Where-Object { $_ -in $claudeExcludedNames }).Count -gt 0) {
    $errors.Add('A skill cannot be both included and excluded for Claude Code.')
}
if (@($claudeSkillNames | Where-Object { $_ -in $claudeRetiredNames }).Count -gt 0) {
    $errors.Add('A skill cannot be both included and retired for Claude Code.')
}
if (@($claudeExcludedNames | Where-Object { $_ -in $claudeRetiredNames }).Count -gt 0) {
    $errors.Add('A skill cannot be both excluded and retired for Claude Code.')
}
if (@($skillNames | Where-Object { $_ -notin $claudeSkillNames -and $_ -notin $claudeExcludedNames }).Count -gt 0) {
    $errors.Add('Every managed skill must be included or explicitly excluded for Claude Code.')
}

$agentsPath = Join-Path $repoRoot $manifest.globalInstructions
if (-not (Test-Path -LiteralPath $agentsPath -PathType Leaf)) {
    $errors.Add("Missing global instructions: $($manifest.globalInstructions)")
}

$claudePath = Join-Path $repoRoot $manifest.claudeGlobalInstructions
if (-not (Test-Path -LiteralPath $claudePath -PathType Leaf)) {
    $errors.Add("Missing Claude Code global instructions: $($manifest.claudeGlobalInstructions)")
}

$actualSkillNames = @(
    Get-ChildItem -LiteralPath (Join-Path $repoRoot 'skills') -Directory |
        Select-Object -ExpandProperty Name |
        Sort-Object
)
$expectedSkillNames = @($skillNames | Sort-Object)
$unexpected = @($actualSkillNames | Where-Object { $_ -notin $expectedSkillNames })
$missing = @($expectedSkillNames | Where-Object { $_ -notin $actualSkillNames })

foreach ($name in $unexpected) {
    $errors.Add("Unmanaged skill directory: skills/$name")
}
foreach ($name in $missing) {
    $errors.Add("Manifest skill directory missing: skills/$name")
}

foreach ($name in $skillNames) {
    if ($name -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
        $errors.Add("Invalid lowercase skill name: $name")
        continue
    }

    $skillFile = Join-Path $repoRoot "skills/$name/SKILL.md"
    if (-not (Test-Path -LiteralPath $skillFile -PathType Leaf)) {
        $errors.Add("Missing SKILL.md: skills/$name/SKILL.md")
        continue
    }

    $text = Get-Content -LiteralPath $skillFile -Raw -Encoding UTF8
    if ($text.Contains([char]0xFFFD)) {
        $errors.Add("UTF-8 replacement character found: skills/$name/SKILL.md")
    }

    $lines = @($text -split "`r?`n")
    if ($lines.Count -lt 3 -or $lines[0].Trim() -ne '---') {
        $errors.Add("Missing YAML frontmatter: skills/$name/SKILL.md")
        continue
    }

    $closingIndex = -1
    for ($i = 1; $i -lt $lines.Count; $i++) {
        if ($lines[$i].Trim() -eq '---') {
            $closingIndex = $i
            break
        }
    }
    if ($closingIndex -lt 0) {
        $errors.Add("Unclosed YAML frontmatter: skills/$name/SKILL.md")
        continue
    }

    $declaredName = $null
    for ($i = 1; $i -lt $closingIndex; $i++) {
        if ($lines[$i] -match '^name:\s*([a-z0-9-]+)\s*$') {
            $declaredName = $Matches[1]
            break
        }
    }
    if ($declaredName -ne $name) {
        $errors.Add("Frontmatter name mismatch in skills/$name/SKILL.md: '$declaredName'")
    }
}

$overlayRoot = Join-Path $repoRoot 'claude-overlays'
$actualOverlayNames = @()
if (Test-Path -LiteralPath $overlayRoot -PathType Container) {
    $actualOverlayNames = @(
        Get-ChildItem -LiteralPath $overlayRoot -Directory |
            Select-Object -ExpandProperty Name |
            Sort-Object
    )
}
foreach ($name in $actualOverlayNames) {
    if ($name -notin $claudeSkillNames) {
        $errors.Add("Claude overlay is not in claudeSkills: claude-overlays/$name")
    }
}

foreach ($name in $claudeSkillNames) {
    if ($name -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
        $errors.Add("Invalid Claude Code skill name: $name")
        continue
    }

    $source = Join-Path $repoRoot "skills/$name"
    $overlay = Join-Path $overlayRoot $name
    $resolvedSkill = Join-Path $source 'SKILL.md'
    if (Test-Path -LiteralPath (Join-Path $overlay 'SKILL.md') -PathType Leaf) {
        $resolvedSkill = Join-Path $overlay 'SKILL.md'
    }
    if (-not (Test-Path -LiteralPath $resolvedSkill -PathType Leaf)) {
        $errors.Add("Missing resolved Claude Code SKILL.md: $name")
        continue
    }

    $resolvedText = Get-Content -LiteralPath $resolvedSkill -Raw -Encoding UTF8
    $resolvedLines = @($resolvedText -split "`r?`n")
    $resolvedName = $null
    foreach ($line in $resolvedLines) {
        if ($line -match '^name:\s*([a-z0-9-]+)\s*$') {
            $resolvedName = $Matches[1]
            break
        }
    }
    if ($resolvedName -ne $name) {
        $errors.Add("Resolved Claude Code frontmatter name mismatch for ${name}: '$resolvedName'")
    }

    if (Test-Path -LiteralPath $overlay -PathType Container) {
        Get-ChildItem -LiteralPath $overlay -File -Recurse | ForEach-Object {
            $relative = [IO.Path]::GetRelativePath($overlay, $_.FullName).Replace('\', '/')
            if (($relative -split '/')[0] -eq 'agents') {
                $errors.Add("Claude Code overlay must not contain Codex agents metadata: claude-overlays/$name/$relative")
            }
            if (-not (Test-Path -LiteralPath (Join-Path $source $relative) -PathType Leaf)) {
                $errors.Add("Claude Code overlay has no canonical source file: claude-overlays/$name/$relative")
            }
        }
    }
}

$forbiddenFiles = @(
    Get-ChildItem -LiteralPath $repoRoot -File -Recurse -Force |
        Where-Object {
            $_.Name -eq '.env' -or
            $_.Name -like '.env.*' -and $_.Name -ne '.env.example' -or
            $_.Extension -eq '.pyc' -or
            $_.Name -in @('id_rsa', 'id_ed25519')
        }
)
foreach ($file in $forbiddenFiles) {
    $relative = [IO.Path]::GetRelativePath($repoRoot, $file.FullName)
    $errors.Add("Forbidden machine or credential file: $relative")
}

$forbiddenDirs = @(
    Get-ChildItem -LiteralPath $repoRoot -Directory -Recurse -Force |
        Where-Object { $_.Name -in @('__pycache__', '.pytest_cache') }
)
foreach ($dir in $forbiddenDirs) {
    $relative = [IO.Path]::GetRelativePath($repoRoot, $dir.FullName)
    $errors.Add("Forbidden generated directory: $relative")
}

$privateKeyPattern = '-----BEGIN (?:RSA |OPENSSH |EC )?PRIVATE KEY-----'
$binaryExtensions = @('.gif', '.ico', '.jpeg', '.jpg', '.pdf', '.png', '.webp', '.zip')
Get-ChildItem -LiteralPath $repoRoot -File -Recurse -Force |
    Where-Object {
        $_.FullName -notlike "*\.git\*" -and
        $_.Extension.ToLowerInvariant() -notin $binaryExtensions
    } |
    ForEach-Object {
        try {
            $content = Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8
            if ($content -match $privateKeyPattern) {
                $relative = [IO.Path]::GetRelativePath($repoRoot, $_.FullName)
                $errors.Add("Private key material detected: $relative")
            }
            if ($content.Contains([char]0xFFFD)) {
                $relative = [IO.Path]::GetRelativePath($repoRoot, $_.FullName)
                $errors.Add("UTF-8 replacement character found: $relative")
            }
        }
        catch {
            # Non-text assets are allowed; structural checks above still apply.
        }
    }

if ($errors.Count -gt 0) {
    $errors | ForEach-Object { Write-Error $_ }
    exit 1
}

Write-Host "Validated $($skillNames.Count) Codex skills, $($claudeSkillNames.Count) Claude Code adaptations, $($manifest.globalInstructions), and $($manifest.claudeGlobalInstructions)."
exit 0
