[CmdletBinding()]
param(
    [switch]$Create,
    [string]$OutputPath = ".\viscereality-submission.zip"
)

$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..\..")).Path
$resolvedOutput = [System.IO.Path]::GetFullPath((Join-Path $projectRoot $OutputPath))

if ([System.IO.Path]::GetExtension($resolvedOutput) -ne ".zip") {
    throw "OutputPath must name a .zip file."
}

$excludedDirectoryNames = @(".git", "for-ai", ".tex-build", "_minted-main", "_minted-supplementary")
$excludedFileNames = @("AGENTS.md", ".gitignore", "Thumbs.db", ".DS_Store")
$excludedExtensions = @(".aux", ".bbl", ".bcf", ".blg", ".fdb_latexmk", ".fls", ".lof", ".log", ".lot", ".out", ".run.xml", ".synctex.gz", ".toc", ".xdv")

$includedFiles = Get-ChildItem -LiteralPath $projectRoot -Recurse -File -Force | Where-Object {
    $file = $_
    $relative = [System.IO.Path]::GetRelativePath($projectRoot, $file.FullName)
    $segments = $relative -split '[\\/]'
    $isOutput = [System.StringComparer]::OrdinalIgnoreCase.Equals($file.FullName, $resolvedOutput)
    $hasExcludedDirectory = @($segments | Where-Object { $_ -in $excludedDirectoryNames }).Count -gt 0
    $hasExcludedName = $file.Name -in $excludedFileNames
    $hasExcludedExtension = $false
    foreach ($extension in $excludedExtensions) {
        if ($file.Name.EndsWith($extension, [System.StringComparison]::OrdinalIgnoreCase)) {
            $hasExcludedExtension = $true
            break
        }
    }
    -not ($isOutput -or $hasExcludedDirectory -or $hasExcludedName -or $hasExcludedExtension)
} | Sort-Object FullName

Write-Output "Submission manifest ($($includedFiles.Count) files):"
$includedFiles | ForEach-Object {
    [System.IO.Path]::GetRelativePath($projectRoot, $_.FullName)
}

if (-not $Create) {
    Write-Output "Preview only. Re-run with -Create to write: $resolvedOutput"
    exit 0
}

if (Test-Path -LiteralPath $resolvedOutput) {
    throw "Archive already exists: $resolvedOutput. Choose a new OutputPath or remove it explicitly."
}

Add-Type -AssemblyName System.IO.Compression.FileSystem
$archive = [System.IO.Compression.ZipFile]::Open($resolvedOutput, [System.IO.Compression.ZipArchiveMode]::Create)
try {
    foreach ($file in $includedFiles) {
        $entryName = [System.IO.Path]::GetRelativePath($projectRoot, $file.FullName).Replace('\', '/')
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile(
            $archive,
            $file.FullName,
            $entryName,
            [System.IO.Compression.CompressionLevel]::Optimal
        ) | Out-Null
    }
}
finally {
    $archive.Dispose()
}

Write-Output "Created submission archive: $resolvedOutput"
