# Final submission checklist

Target journal: *Virtual Reality* (Springer Nature)

Use this checklist for the submission-frozen manuscript candidate. Checked items are already implemented locally, but any item affected by later source changes must be verified again. A PDF or archive containing unresolved placeholders is not final.

## 1. Local manuscript format

- [x] Main manuscript uses the Springer Nature `sn-jnl` class.
- [x] Main manuscript uses the journal-appropriate `sn-basic` author--year bibliography style.
- [x] Main manuscript uses the Springer class `lineno` option for review line numbering.
- [x] Main declaration heading is `Statements and Declarations`.
- [ ] Replace submission-facing `Supplementary Section S#` wording with journal-compliant, specific `Online Resource 1` referrals while preserving the internal S-section destination.
- [ ] Add one concise manuscript caption describing the complete content of Online Resource 1.
- [ ] Verify that every substantive item in the supplement has a specific, identifiable main-text referral.
- [ ] Confirm that title, abstract, keywords, author order, affiliations, corresponding-author details, and declarations match the submission portal exactly.
- [ ] Obtain every author's final approval of the manuscript, author order, contributions, affiliations, funding, and declarations.

## 2. Supplementary Information / Online Resource 1

- [x] Supplement uses the Springer Nature class and `sn-basic` author--year style.
- [x] Supplement uses review line numbering.
- [x] Supplement includes the article title, journal name, all authors, affiliations, and corresponding-author email.
- [x] Supplement uses S-prefixed section, figure, table, and equation numbering.
- [x] Canonical upload filename is `ESM_1.pdf`.
- [ ] Confirm that all supplementary figures and tables are cited in the supplement and numbered consecutively.
- [ ] Confirm that every figure and table caption is self-contained, legible, and accessible.
- [ ] Check that the Online Resource 1 caption in the manuscript agrees with the actual final supplement contents.
- [ ] Confirm the final supplement contains no internal workflow language, unsupported claims, empty sections, obsolete analyses, or stale links.

## 3. Data, code, and reproducibility statements

- [x] Main manuscript contains Data Availability and Code Availability statements.
- [x] Main manuscript identifies the OSF reproducibility package.
- [ ] Run the final end-to-end reproducibility audit after manuscript and supplement formatting are frozen.
- [ ] Confirm that every reported statistic, table, and figure maps to the correct input, script, environment, output, and expected result.
- [ ] Confirm that participant data are appropriately deidentified and that consent, rights, and access conditions permit the stated sharing.
- [ ] Finalize the authoritative GitHub reproducibility commit and release tag.
- [ ] Create or finalize the immutable Zenodo archival release and version-specific DOI.
- [ ] Finalize the OSF package and confirm its DOI, public visibility, licence, documentation, and file inventory.
- [ ] Synchronize titles, creators, author order, ORCIDs, versions, licences, related identifiers, checksums, and reciprocal links across OSF, Zenodo, GitHub, the manuscript, and the supplement.
- [ ] Add or finalize formal reference-list entries for publicly archived data and software records using their persistent identifiers.
- [ ] Replace `ZENODO_VERSION_DOI`, `FINAL_SUBMISSION_COMMIT`, and any other approved placeholder with the final identifier.
- [ ] Verify every repository and DOI link while logged out.

## 4. Scientific and editorial readiness

- [ ] Review every unresolved scientific, preregistration, statistical, figure, and editorial item in `for-ai/PROJECT_STATE.md` and either resolve it or record the final maintainer decision.
- [ ] Confirm that the final analytic sample, exclusions, statistical values, Bayes-factor directions, multiplicity corrections, and interpretation match the audited reproducibility outputs.
- [ ] Confirm that preregistered, post-preregistration, exploratory, sensitivity, robustness, and descriptive analyses are labeled consistently.
- [ ] Confirm that main-text and supplementary Methods, Results, tables, figures, captions, and declarations do not contradict one another.
- [ ] Complete a final reference audit for missing, duplicate, uncited, malformed, or dataset/software references.
- [ ] Complete a final language and typography review without altering approved statistical meaning.

## 5. Canonical local build

- [x] All build, validation, packaging, and staging scripts live under `for-ai/scripts/`.
- [x] Temporary compilation state is isolated under `for-ai/build/`.
- [x] Upload-facing artifacts are staged under `output/submission/`.
- [x] Canonical main PDF name is `Manuscript.pdf`.
- [x] Canonical supplementary PDF name is `ESM_1.pdf`.
- [x] Canonical editable-source archive name is `Manuscript_Source.zip`.
- [ ] After the final source edit, run `./for-ai/scripts/build-submission-pdfs.ps1 -Final` and require success.
- [ ] Confirm the final logs contain no unresolved citations, unresolved references, duplicate labels, fatal errors, or unstable-label warnings.
- [ ] Render and visually inspect every final PDF page for clipping, overlap, blank pages, broken glyphs, unreadable figures/tables, line-number collisions, and incorrect page size.
- [ ] Confirm PDF links, bookmarks where present, fonts, page count, and file integrity.

## 6. Editable-source archive

- [x] Packaging defaults to a preview manifest.
- [x] Packaging uses successful LaTeX recorder manifests to select active dependencies.
- [x] Packaging excludes `AGENTS.md`, `for-ai/`, Git metadata, internal archives, build caches, legacy PDFs, and unused figure variants.
- [ ] Review the final source manifest manually.
- [ ] Remove the prior canonical ZIP explicitly, then run `./for-ai/scripts/new-submission-package.ps1 -Final -Create`.
- [ ] Extract `Manuscript_Source.zip` into a clean temporary directory and compile both documents from the extracted files.
- [ ] Confirm the archive contains `main.tex`, `supplementary/main.tex`, `references.bib`, `sn-jnl.cls`, `sn-basic.bst`, and every actively referenced figure.
- [ ] Confirm the archive contains no placeholder, credential, personal note, AI-control file, temporary file, or unrelated research artifact.

## 7. Final upload set

- [ ] `Manuscript.pdf` is the final review PDF generated from the frozen source.
- [ ] `ESM_1.pdf` is the final Online Resource 1 PDF generated from the frozen source.
- [ ] `Manuscript_Source.zip` compiles independently and matches the two uploaded PDFs.
- [ ] The submission portal contains the concise caption for Online Resource 1.
- [ ] File designations in the portal are correct: manuscript, editable source, and supplementary information / Online Resource.
- [ ] Portal-entered abstract, keywords, authors, affiliations, funding, declarations, and corresponding-author information match the files.
- [ ] Any required cover letter, suggested/excluded reviewers, reporting forms, permissions, or ethics documents are complete.
- [ ] Preview the assembled submission in the portal and inspect the publisher-generated PDF before authorizing submission.

## 8. Final stop conditions

Do not submit until every box below is checked:

- [ ] No unresolved placeholder remains in any uploaded file.
- [ ] No repository URL points to a mutable or mismatched version.
- [ ] No required main-text referral or Online Resource caption is missing.
- [ ] No final build, extracted-source compilation, visual inspection, or logged-out link check remains incomplete.
- [ ] No unresolved scientific or reproducibility discrepancy remains without an explicit final maintainer decision.

When all five boxes above are checked, record the final manuscript commit, GitHub reproducibility commit, Zenodo DOI, OSF DOI, PDF hashes, ZIP hash, and submission date in `for-ai/PROJECT_STATE.md`.
