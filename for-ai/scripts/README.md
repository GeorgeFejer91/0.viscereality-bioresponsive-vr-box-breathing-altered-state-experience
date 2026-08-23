# Orchestration scripts

All project-specific helper and orchestration scripts must live in this directory.

Do not place scripts in the repository root or among submission-facing manuscript files.

## Script registry

### `build-submission-pdfs.ps1`

Compiles the main manuscript and Online Resource 1 through internal build directories and stages the canonical upload-facing PDFs. It runs one initial LaTeX pass, BibTeX, and three stabilization passes for each document. Compilation stops on command failures, missing PDFs, unresolved citations or references, unstable labels, multiply defined labels, or fatal LaTeX errors.

Usage from the repository root:

```powershell
# Review build; unresolved external-identifier placeholders produce warnings
.\for-ai\scripts\build-submission-pdfs.ps1

# Final build; unresolved placeholders stop the build before staging
.\for-ai\scripts\build-submission-pdfs.ps1 -Final
```

Canonical outputs:

- `output/submission/Manuscript.pdf`
- `output/submission/ESM_1.pdf`

All auxiliary files, recorder manifests, and logs remain under `for-ai/build/submission-pdfs/`. Successful review builds overwrite only the two canonical PDFs named above. The script does not modify manuscript sources or authoritative reproducibility artifacts.

### `new-submission-package.ps1`

Creates or previews the canonical editable-source archive from the successful LaTeX recorder manifests. It includes explicit manuscript, bibliography, class, and style sources plus project-local assets used by the two builds. It excludes internal AI controls, Git metadata, legacy PDFs, unused figure variants, temporary directories, and LaTeX build artifacts.

Usage from the repository root:

```powershell
# Preview included files without writing an archive
.\for-ai\scripts\new-submission-package.ps1

# Create the archive after reviewing the manifest
.\for-ai\scripts\new-submission-package.ps1 -Create

# Preview in strict final mode; unresolved placeholders stop the command
.\for-ai\scripts\new-submission-package.ps1 -Final

# Choose a different output path
.\for-ai\scripts\new-submission-package.ps1 -Create -OutputPath .\output\submission\Alternate_Source.zip
```

Canonical output:

- `output/submission/Manuscript_Source.zip`

Run `build-submission-pdfs.ps1` before this script so the recorder manifests describe the current successful builds. Preview mode is the default. `-Create` refuses to overwrite an existing archive.

Every future script added here must be documented in this registry with its purpose, inputs, outputs, side effects, and example usage.

Scripts that change project files must default to a dry run when practical. A script must not change textual content unless every resulting text change was presented as a numbered recommendation and explicitly approved item by item. Approval for one item cannot be treated as approval for other script-generated changes.

No script may mutate `https://github.com/GeorgeFejer91/0_OSF_reproducability_package`, its original data, analysis pipelines, statistical outputs, figure-generation mechanisms, generated figures, or source-derived copies in this repository. Validation scripts must operate read-only or use isolated temporary copies and must never overwrite canonical artifacts.

### `candidate_registered_analysis_pipeline.R`

Internal, non-authoritative candidate implementation of the two registered analyses that still require maintainer adoption in `0_OSF_reproducability_package`:

- the order-adjusted repeated-measures ANCOVA condition test for every registered outcome family; and
- the joint ordered Bayes factor comparing `symmetric > asymmetric > dark-screen control` with equal condition means for Experience of Unity, Blissful State, and Audio-Visual Synesthesia.

The script reads the authoritative master dataset but refuses to write inside the authoritative repository. Dry run is the default. `--write` saves candidate CSVs and session information only under `for-ai/statistical-audit/candidate-registered-results/`. These candidate files must not be cited in the manuscript, packaged for submission, or described as authoritative. The reproducibility-repository maintainer must review, port, run, and publish the implementation before its results can replace the currently reported statistics.

```powershell
# Dry run; prints candidate results without writing files.
Rscript .\for-ai\scripts\candidate_registered_analysis_pipeline.R `
  --package-root C:\path\to\0_OSF_reproducability_package

# Write internal candidate outputs under for-ai/ only.
Rscript .\for-ai\scripts\candidate_registered_analysis_pipeline.R `
  --package-root C:\path\to\0_OSF_reproducability_package `
  --write
```

### `candidate_registered_rm_ancova.py`

Internal, non-authoritative Python implementation of the registered
order-adjusted repeated-measures ANCOVA. It compares
`value ~ participant + numeric block position + condition` with
`value ~ participant + numeric block position`, using participant fixed effects
for repeated-measures blocking. The script asserts the final included `N=39`,
refuses OSF writes, and writes candidate results only below
`for-ai/statistical-audit/candidate-registered-results/` when `--write` is used.

```powershell
& 'C:\S3OSF\e\python.exe' .\for-ai\scripts\candidate_registered_rm_ancova.py `
  --package-root C:\path\to\0_OSF_reproducability_package `
  --write
```

The executed candidate reproduces all 40 partial-F values in an independent
statsmodels calculation and preserves every nominal and within-family FDR
decision from the current mixed-effects pipeline. The 39 non-PLV outcomes are
the adoption target; PLV remains frozen by user direction.

### `pictograph_asc_correspondence_pipeline.py`

Internal, non-authoritative consolidated pipeline for the complete exploratory
pictograph--ASC analysis reported in Supplementary Section S4. It covers:

- pooled-VR-minus-dark-screen-control Spearman change correlations for all three
  3D-ASCr composites, all 11D-ASC subscales, and all 42 ASC items;
- participant-bootstrap confidence intervals, permutation p values, and
  family-wise Benjamini--Hochberg correction;
- participant-clustered within-person sensitivity estimates;
- rank-partial Positive Effects follow-ups;
- symmetric-minus-asymmetric change correlations; and
- order-adjusted participant fixed-effects condition interactions with
  participant-clustered covariance.

The script asserts the final included `N=39`, reverse-scores the administered
Perceived Body Boundaries pictograph into the construct-facing dissolution
direction, refuses OSF writes, records input hashes and package versions, and
validates key manuscript values. Dry run is the default. `--write` saves only
under
`for-ai/statistical-audit/non-osf-results/pictograph-asc-correspondence/`.

```powershell
# Full internal execution used for the audit.
& 'C:\S3OSF\e\python.exe' .\for-ai\scripts\pictograph_asc_correspondence_pipeline.py `
  --package-root C:\path\to\0_OSF_reproducability_package `
  --permutations 10000 `
  --bootstraps 2000 `
  --write
```

These outputs are excluded from submission and remain `SOURCE SYNC REQUIRED`
until the OSF maintainer adopts and validates the pipeline.
