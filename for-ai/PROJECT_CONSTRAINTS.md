# Project constraints

## Project type

This repository is a Springer Nature LaTeX manuscript package for:

> Viscereality: Bioresponsive Virtual Reality for Box Breathing and Altered-State Experience

The package is manuscript source, not the Unity/Quest application or the complete reproducibility archive.

## Submission-facing artifact classes

The root currently contains:

- manuscript and supplementary LaTeX sources;
- bibliography and Springer class/style files;
- publication figures and selected editable figure sources; and
- repository metadata needed to maintain the package.

Internal AI material belongs only under `for-ai/`, except for the required root `AGENTS.md` bootstrap.

## Manuscript constraints

- Every textual project artifact is user-supervised and requires explicit item-by-item approval before editing.
- General requests to revise or improve text authorize only a numbered recommendation list, not direct edits.
- Each proposed edit must show exact current wording and exact proposed replacement wording, with rationale, consequences, risks, and verification.
- Apply only explicitly approved item numbers; never infer approval for unmentioned items.
- Preserve Springer Nature compatibility through `sn-jnl.cls` and the journal-appropriate author--year `sn-basic.bst`.
- Preserve citation-key compatibility with `references.bib`.
- Do not silently alter statistical claims, sample sizes, exclusions, preregistration deviations, author order, affiliations, declarations, or availability statements.
- The PLV quality-screening stage may use condition-level PLV values from all 47 tested participants solely to determine exclusions. After that stage, the final analytic sample is $N=39$, and every inferential protocol, including PLV condition tests, must use only those 39 participants. Participant-flow reporting must continue to state that 47 were tested, 8 were excluded, and 39 were analyzed.
- Exploratory, robustness, sensitivity, and confirmatory analyses must be labeled consistently.

## Supplement provenance

For supplementary-text provenance, the dissertation projects are the original source of truth. Publication repositories may be used as comparison evidence, but must not supersede the dissertation source.

The active Study 3 dissertation build in:

`C:/Users/gyorg/Documents/GithubWriting/Dissertation/Dissertation_scaffold`

includes:

`Dissertation_formatting/appendices/appendix_study3_supplement.tex`

which in turn includes the canonical dissertation supplement body:

`Study 3/dissertation/dissertation_adapter/sections/study3_appendix.tex`

At the observed repository checkpoint, that body is byte-identical to `Study 3/study3_appendix.tex` in the same repository and to `Study 3/study3_appendix.tex` in `Dissertation-scaffold-overleaf`. Its SHA-256 is `2996dc85a3c45bd42cb1aa4abfc6bf0ca91208e214545d2b2b30fd5a0eec5a08`.

The standalone files under `Study 3/src/supplementary/` are dissertation-repository variants, but they are not the supplement body included by the active dissertation build.

The current root `supplementary.tex` was reconstructed and subsequently expanded during this task history. It is untracked, has no byte-identical dissertation-project source, and must not be represented as a recovered dissertation original unless it is deliberately replaced and verified against the canonical dissertation appendix body.

## Supplement admissibility

- Every substantive item in the active supplementary material must have an explicit, identifiable referral in `main.tex`.
- A broad or generic mention of supplementary material is insufficient for supplementary content that the reader cannot identify from that mention.
- Unreferenced supplementary content must either receive an explicit referral in `main.tex` or be omitted from the active supplement.
- Any detected mismatch must be surfaced in every decision or recommendation involving the affected content and must remain marked as unresolved until one of the two permitted resolutions is approved and implemented.
- Adding a referral to `main.tex` and omitting content from the supplement are separate submission-facing text changes. Each requires its own numbered recommendation and explicit user approval.
- Supplement audits and external-package readiness checks must verify this main-text-to-supplement mapping.

## Authoritative reproducibility source

Authoritative repository:

`https://github.com/GeorgeFejer91/0_OSF_reproducability_package`

This external repository contains the original data, statistical pipelines, statistical outputs, figure-generation mechanisms, and generated figures used by the manuscript package.

- The repository and its research artifacts are immutable for AI agents.
- Root figures and reported statistics derived from it must not be edited.
- Analysis or figure-generation code must not be changed or used to overwrite canonical outputs.
- Read-only inspection, provenance checks, and isolated validation are permitted.
- Agents may prepare itemized recommendations, but may not implement changes to these artifacts.
- Any discrepancy between manuscript claims and the authoritative repository must be escalated to the user.
- When provenance matters, prefer a source path and Git commit hash over an unversioned statement that an artifact came from the repository.

## File-editing and safety constraints

- Preserve unrelated user changes.
- Inspect Git status before editing.
- Prefer patch-based, reviewable text edits.
- Do not execute a text patch until its individual numbered change item has been explicitly approved.
- Do not execute any write operation against the authoritative reproducibility repository or immutable source-derived figures/statistics.
- Avoid destructive Git or filesystem operations unless explicitly authorized.
- Keep temporary files and build artifacts out of the repository root.

## Verification constraints

For LaTeX changes, verify at minimum:

- unresolved local references;
- duplicate labels;
- missing bibliography keys;
- `git diff --check`; and
- compilation when a compatible LaTeX runtime is available.

If compilation cannot be performed, say so explicitly. Do not claim successful compilation based only on static checks.

## Packaging constraints

External archives must exclude at least:

- `.git/`;
- `AGENTS.md`;
- `for-ai/`;
- LaTeX auxiliary/build files;
- editor/OS metadata; and
- scratch or review-only artifacts not requested by the submission destination.

Packaging scripts must default to a preview or manifest mode when practical and must report every included file.
