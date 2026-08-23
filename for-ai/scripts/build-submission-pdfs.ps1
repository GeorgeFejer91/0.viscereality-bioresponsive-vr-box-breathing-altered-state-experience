[CmdletBinding()]
param(
    [switch]$Final
)

$ErrorActionPreference = "Stop"

$projectRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot "..\..")).Path
$internalRoot = (Resolve-Path -LiteralPath (Join-Path $projectRoot "for-ai")).Path
$buildRoot = [System.IO.Path]::GetFullPath((Join-Path $internalRoot "build\submission-pdfs"))
$submissionRoot = [System.IO.Path]::GetFullPath((Join-Path $projectRoot "output\submission"))
$placeholderPattern = 'OSF_PROJECT_DOI|ZENODO_VERSION_DOI|GITHUB_FINAL_COMMIT|GITHUB_RELEASE_TAG|FINAL_SUBMISSION_COMMIT'

function Resolve-LaTeXTool {
    param([Parameter(Mandatory)][string]$Name)

    $command = Get-Command $Name -ErrorAction SilentlyContinue
    if ($command) {
        return $command.Source
    }

    $candidate = Join-Path $env:LOCALAPPDATA "Programs\MiKTeX\miktex\bin\x64\$Name.exe"
    if (Test-Path -LiteralPath $candidate) {
        return (Resolve-Path -LiteralPath $candidate).Path
    }

    throw "Required LaTeX tool was not found: $Name"
}

function Invoke-Checked {
    param(
        [Parameter(Mandatory)][string]$Executable,
        [Parameter(Mandatory)][string[]]$Arguments
    )

    & $Executable @Arguments | Out-Host
    if ($LASTEXITCODE -ne 0) {
        throw "Command failed with exit code ${LASTEXITCODE}: $Executable $($Arguments -join ' ')"
    }
}

function Assert-CleanLog {
    param([Parameter(Mandatory)][string]$LogPath)

    if (-not (Test-Path -LiteralPath $LogPath)) {
        throw "Expected LaTeX log was not created: $LogPath"
    }

    $fatalPatterns = @(
        'LaTeX Warning: (Citation|Reference).+undefined',
        'There were undefined (citations|references)',
        'Label\(s\) may have changed\. Rerun',
        'multiply defined',
        '^! '
    )
    $logText = Get-Content -LiteralPath $LogPath -Raw
    foreach ($pattern in $fatalPatterns) {
        if ($logText -match $pattern) {
            throw "LaTeX validation failed for $LogPath because it matched: $pattern"
        }
    }
}

function Build-LaTeXDocument {
    param(
        [Parameter(Mandatory)][string]$Label,
        [Parameter(Mandatory)][string]$WorkingDirectory,
        [Parameter(Mandatory)][string]$BuildDirectory,
        [Parameter(Mandatory)][string]$TexFile,
        [Parameter(Mandatory)][string]$PdfBaseName,
        [Parameter(Mandatory)][string]$PdfLaTeX,
        [Parameter(Mandatory)][string]$BibTeX,
        [Parameter(Mandatory)][string]$BibStyleDirectory
    )

    New-Item -ItemType Directory -Path $BuildDirectory -Force | Out-Null
    $latexArguments = @(
        '-interaction=nonstopmode',
        '-halt-on-error',
        '-file-line-error',
        '-recorder',
        "-output-directory=$BuildDirectory",
        $TexFile
    )

    Write-Host "Building ${Label}: first LaTeX pass"
    Push-Location -LiteralPath $WorkingDirectory
    $previousBibStyleInputs = $env:BSTINPUTS
    $env:BSTINPUTS = "$BibStyleDirectory;$previousBibStyleInputs"
    try {
        Invoke-Checked -Executable $PdfLaTeX -Arguments $latexArguments
        Write-Host "Building ${Label}: BibTeX"
        Invoke-Checked -Executable $BibTeX -Arguments @((Join-Path $BuildDirectory $PdfBaseName))
        Write-Host "Building ${Label}: stabilization pass 1"
        Invoke-Checked -Executable $PdfLaTeX -Arguments $latexArguments
        Write-Host "Building ${Label}: stabilization pass 2"
        Invoke-Checked -Executable $PdfLaTeX -Arguments $latexArguments
        Write-Host "Building ${Label}: stabilization pass 3"
        Invoke-Checked -Executable $PdfLaTeX -Arguments $latexArguments
    }
    finally {
        $env:BSTINPUTS = $previousBibStyleInputs
        Pop-Location
    }

    $pdfPath = Join-Path $BuildDirectory "$PdfBaseName.pdf"
    if (-not (Test-Path -LiteralPath $pdfPath)) {
        throw "Expected PDF was not created for ${Label}: $pdfPath"
    }
    Assert-CleanLog -LogPath (Join-Path $BuildDirectory "$PdfBaseName.log")
    return $pdfPath
}

$expectedBuildPrefix = $internalRoot.TrimEnd('\') + '\'
if (-not $buildRoot.StartsWith($expectedBuildPrefix, [System.StringComparison]::OrdinalIgnoreCase)) {
    throw "Refusing to use a build directory outside for-ai: $buildRoot"
}

if (Test-Path -LiteralPath $buildRoot) {
    Remove-Item -LiteralPath $buildRoot -Recurse -Force
}
New-Item -ItemType Directory -Path $buildRoot -Force | Out-Null

$pdfLaTeX = Resolve-LaTeXTool -Name 'pdflatex'
$bibTeX = Resolve-LaTeXTool -Name 'bibtex'

$mainPdf = Build-LaTeXDocument `
    -Label 'main manuscript' `
    -WorkingDirectory $projectRoot `
    -BuildDirectory (Join-Path $buildRoot 'main') `
    -TexFile 'main.tex' `
    -PdfBaseName 'main' `
    -PdfLaTeX $pdfLaTeX `
    -BibTeX $bibTeX `
    -BibStyleDirectory $projectRoot

$supplementDirectory = Join-Path $projectRoot 'supplementary'
$supplementPdf = Build-LaTeXDocument `
    -Label 'Online Resource 1' `
    -WorkingDirectory $supplementDirectory `
    -BuildDirectory (Join-Path $buildRoot 'supplementary') `
    -TexFile 'main.tex' `
    -PdfBaseName 'main' `
    -PdfLaTeX $pdfLaTeX `
    -BibTeX $bibTeX `
    -BibStyleDirectory $projectRoot

$placeholderFiles = @(
    (Join-Path $projectRoot 'main.tex'),
    (Join-Path $projectRoot 'supplementary\main.tex'),
    (Join-Path $projectRoot 'references.bib')
)
$placeholderHits = Select-String -LiteralPath $placeholderFiles -Pattern $placeholderPattern
if ($placeholderHits) {
    $message = "Unresolved submission placeholders:`n" + (($placeholderHits | ForEach-Object {
        "$($_.Path):$($_.LineNumber): $($_.Line.Trim())"
    }) -join "`n")
    if ($Final) {
        throw $message
    }
    Write-Warning $message
}

New-Item -ItemType Directory -Path $submissionRoot -Force | Out-Null
$mainTarget = Join-Path $submissionRoot 'Manuscript.pdf'
$supplementTarget = Join-Path $submissionRoot 'ESM_1.pdf'
Copy-Item -LiteralPath $mainPdf -Destination $mainTarget -Force
Copy-Item -LiteralPath $supplementPdf -Destination $supplementTarget -Force

Write-Output "Canonical submission PDFs created:"
Write-Output $mainTarget
Write-Output $supplementTarget
