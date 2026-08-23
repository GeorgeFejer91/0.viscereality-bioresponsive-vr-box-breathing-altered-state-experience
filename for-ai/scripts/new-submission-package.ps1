[CmdletBinding()]
param(
    [switch]$Create,
    [switch]$Final,
    [string]$OutputPath = ".\output\submission\Manuscript_Source.zip"
)

$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..\..")).Path
$resolvedOutput = [System.IO.Path]::GetFullPath((Join-Path $projectRoot $OutputPath))
$buildRoot = Join-Path $projectRoot 'for-ai\build\submission-pdfs'
$placeholderPattern = 'OSF_PROJECT_DOI|ZENODO_VERSION_DOI|GITHUB_FINAL_COMMIT|GITHUB_RELEASE_TAG|FINAL_SUBMISSION_COMMIT'

if ([System.IO.Path]::GetExtension($resolvedOutput) -ne '.zip') {
    throw 'OutputPath must name a .zip file.'
}

$projectPrefix = $projectRoot.TrimEnd('\') + '\'
$excludedDirectoryNames = @(
    '.git',
    'for-ai',
    'output',
    '.tex-build',
    '.codex-remote-attachments',
    '$build',
    '$buildDir',
    '$out',
    'tmp'
)
$excludedFileNames = @('AGENTS.md', '.gitignore', 'Thumbs.db', '.DS_Store')
$excludedExtensions = @(
    '.aux', '.bbl', '.bcf', '.blg', '.fdb_latexmk', '.fls', '.lof', '.log',
    '.lot', '.out', '.run.xml', '.synctex.gz', '.toc', '.xdv'
)

$sourceFiles = [System.Collections.Generic.HashSet[string]]::new(
    [System.StringComparer]::OrdinalIgnoreCase
)

function Add-SubmissionSource {
    param([Parameter(Mandatory)][string]$FullPath)

    $normalizedPath = [System.IO.Path]::GetFullPath($FullPath)
    if (-not $normalizedPath.StartsWith($projectPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
        return
    }
    if (-not (Test-Path -LiteralPath $normalizedPath -PathType Leaf)) {
        return
    }

    $relative = [System.IO.Path]::GetRelativePath($projectRoot, $normalizedPath)
    $segments = $relative -split '[\\/]'
    if (@($segments | Where-Object { $_ -in $excludedDirectoryNames }).Count -gt 0) {
        return
    }
    if ([System.IO.Path]::GetFileName($relative) -in $excludedFileNames) {
        return
    }
    foreach ($extension in $excludedExtensions) {
        if ($relative.EndsWith($extension, [System.StringComparison]::OrdinalIgnoreCase)) {
            return
        }
    }

    [void]$sourceFiles.Add($normalizedPath)
}

$explicitSources = @(
    'main.tex',
    'references.bib',
    'sn-jnl.cls',
    'sn-basic.bst',
    'supplementary\main.tex'
)
foreach ($relativePath in $explicitSources) {
    $fullPath = Join-Path $projectRoot $relativePath
    if (-not (Test-Path -LiteralPath $fullPath -PathType Leaf)) {
        throw "Required submission source is missing: $relativePath"
    }
    Add-SubmissionSource -FullPath $fullPath
}

$recorderManifests = @(
    @{
        Path = (Join-Path $buildRoot 'main\main.fls')
        WorkingDirectory = $projectRoot
    },
    @{
        Path = (Join-Path $buildRoot 'supplementary\main.fls')
        WorkingDirectory = (Join-Path $projectRoot 'supplementary')
    }
)

foreach ($manifest in $recorderManifests) {
    if (-not (Test-Path -LiteralPath $manifest.Path -PathType Leaf)) {
        throw "Build recorder manifest is missing: $($manifest.Path). Run build-submission-pdfs.ps1 first."
    }

    foreach ($line in Get-Content -LiteralPath $manifest.Path) {
        if (-not $line.StartsWith('INPUT ')) {
            continue
        }
        $recordedPath = $line.Substring(6).Trim().Trim('"')
        if ([string]::IsNullOrWhiteSpace($recordedPath)) {
            continue
        }
        if ([System.IO.Path]::IsPathRooted($recordedPath)) {
            Add-SubmissionSource -FullPath $recordedPath
        }
        else {
            Add-SubmissionSource -FullPath (Join-Path $manifest.WorkingDirectory $recordedPath)
        }
    }
}

$includedFiles = $sourceFiles | Sort-Object {
    [System.IO.Path]::GetRelativePath($projectRoot, $_)
}

$textFiles = $includedFiles | Where-Object {
    [System.IO.Path]::GetExtension($_) -in @('.tex', '.bib', '.bst', '.cls')
}
$placeholderHits = Select-String -LiteralPath $textFiles -Pattern $placeholderPattern
if ($placeholderHits) {
    $message = "Unresolved submission placeholders:`n" + (($placeholderHits | ForEach-Object {
        "$($_.Path):$($_.LineNumber): $($_.Line.Trim())"
    }) -join "`n")
    if ($Final) {
        throw $message
    }
    Write-Warning $message
}

Write-Output "Submission source manifest ($($includedFiles.Count) files):"
$includedFiles | ForEach-Object {
    [System.IO.Path]::GetRelativePath($projectRoot, $_)
}

if (-not $Create) {
    Write-Output "Preview only. Re-run with -Create to write: $resolvedOutput"
    exit 0
}

if (Test-Path -LiteralPath $resolvedOutput) {
    throw "Archive already exists: $resolvedOutput. Remove it explicitly or choose another OutputPath."
}

$outputDirectory = Split-Path -Parent $resolvedOutput
New-Item -ItemType Directory -Path $outputDirectory -Force | Out-Null

Add-Type -AssemblyName System.IO.Compression.FileSystem
$archive = [System.IO.Compression.ZipFile]::Open(
    $resolvedOutput,
    [System.IO.Compression.ZipArchiveMode]::Create
)
try {
    foreach ($file in $includedFiles) {
        $entryName = [System.IO.Path]::GetRelativePath($projectRoot, $file).Replace('\', '/')
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
            $archive,
            $file,
            $entryName,
            [System.IO.Compression.CompressionLevel]::Optimal
        ) | Out-Null
    }
}
finally {
    $archive.Dispose()
}

Write-Output "Created submission source archive: $resolvedOutput"
