# Global project instructions

These instructions apply throughout this repository.

## Mandatory item-by-item approval for every text change

1. The user supervises every change to project text, including `main.tex`, `supplementary.tex`, bibliography content, captions, declarations, metadata, documentation, and other textual artifacts.
2. Do not change project text merely because the user asks to edit, revise, improve, shorten, reorganize, proofread, or fix it. Treat such a request as authorization to prepare a critically audited recommendation list only.
3. Before any text edit, present every proposed change as a separately numbered item: `Item 1`, `Item 2`, and so forth.
4. Each item must be independently approvable and contain:
   - the exact file and location;
   - the exact current wording or a tightly bounded current excerpt;
   - the exact proposed replacement wording;
   - a critical rationale;
   - the expected interpretive, statistical, structural, or formatting consequence;
   - any material risk, tradeoff, or dependency; and
   - the verification required after application.
5. Do not bundle unrelated edits into one item. Split changes whenever the user could reasonably approve one but reject another.
6. Do not apply any item until the user explicitly approves that item by number or otherwise identifies it unambiguously.
7. Approval of one item does not authorize any other item. Apply only the approved items and preserve all rejected, deferred, or unmentioned text exactly.
8. A broad response such as “make the changes” is not sufficient if the approved items are ambiguous. Ask the user to identify the item numbers.
9. If the user modifies the wording of a proposal, apply only the wording they explicitly approve. If their requested revision creates a materially different proposal, present a revised numbered item before editing.
10. After applying approved items, report which item numbers were implemented and provide a reviewable diff or exact before/after confirmation.

Read-only analysis and recommendation drafting are allowed without additional approval. Creating or updating the internal `for-ai/` control plane in direct response to an explicit project-wide instruction is authorized by that instruction, but must not be used to alter submission-facing text.

## Main-text referral required for supplementary content

1. The active supplementary material may contain a substantive item only when `main.tex` explicitly tells the reader that the identifiable item is included in, reported in, described in, or otherwise available in the supplementary material.
2. A generic reference to supplementary material does not authorize unrelated or unidentifiable supplementary content. The referral in `main.tex` must be specific enough to connect the main text to the supplementary item.
3. Whenever an agent finds supplementary content without a qualifying referral in `main.tex`, it must bring the discrepancy to the user's attention in every recommendation, decision, or review context in which that content is considered. The discrepancy must never be silently accepted or carried forward.
4. The discrepancy has only two permissible manuscript-facing resolutions: add an explicit referral to the item in `main.tex`, or omit the item from the active supplementary material.
5. Both resolutions change project text and remain subject to the mandatory item-by-item approval protocol. Present adding the main-text referral and omitting the supplementary item as separately approvable recommendations whenever both are viable.
6. Until the user approves and an agent implements one of those resolutions, do not add the unreferenced item to the active supplement. If the item is already present, flag it as unresolved and do not treat the supplement as submission-ready.
7. Apply this check whenever supplementary content is proposed, imported, retained, reorganized, reviewed, packaged, or otherwise involved in a decision.

## Immutable figures, statistics, data, and pipelines

The authoritative source repository for this project's figures, statistics, original data, analysis pipelines, and figure-generation mechanisms is:

`https://github.com/GeorgeFejer91/0_OSF_reproducability_package`

The repository name uses the spelling `reproducability`; preserve that exact URL.

1. Treat the authoritative reproducibility repository as read-only.
2. Never edit, commit, push, overwrite, regenerate, or otherwise mutate its original data, statistical outputs, analysis code, orchestration pipelines, figure-generation mechanisms, or generated figures.
3. Treat copies of its figures and statistical results in this manuscript repository as immutable source-derived artifacts. Do not edit image content, numerical values, statistical labels, or embedded data.
4. Do not rerun a pipeline in a way that overwrites canonical outputs. Read-only inspection, validation in isolated temporary locations, and comparison are allowed only when they do not mutate the source repository or canonical artifacts.
5. Suggestions are allowed. Every suggested change must follow the numbered recommendation protocol and must identify the affected upstream artifact, rationale, expected consequence, risk, and validation requirement.
6. Recommendations do not authorize implementation. Under the current project instruction, agents must not apply suggested changes to these immutable research artifacts.
7. If manuscript text conflicts with the authoritative repository, report the discrepancy. Do not silently alter the statistic, figure, source data, pipeline, or manuscript text.
8. Preserve provenance when copying or referencing artifacts. Record the source repository, source path, and commit hash when known.
9. Do not characterize locally reconstructed or manually edited material as pipeline-generated.

## Internal versus submission-facing files

1. The repository root is reserved for final or submission-facing artifacts, apart from the minimal root `AGENTS.md` bootstrap and ordinary repository metadata such as `.gitignore`.
2. Put all AI orchestration, validation, synchronization, packaging, and helper scripts in `for-ai/scripts/`.
3. Put all durable AI instructions, constraints, decisions, and internal status documentation in `for-ai/`.
4. Do not scatter AI notes, prompts, scratch files, or automation scripts across the repository root.
5. Never include `for-ai/`, `AGENTS.md`, `.git/`, build caches, or editor metadata in an external submission archive.

## Maintaining these instructions

Any future agent receiving a new user instruction that applies project-wide must update this control plane during the same task. Project-wide instructions must not remain only in chat history.

Conflicts or ambiguities must be surfaced to the user. Do not silently weaken or overwrite an existing user instruction.

## Evidence and provenance

1. Distinguish recovered source material from reconstructed or newly written material.
2. Do not describe reconstructed supplementary text as an original dissertation source.
3. When selecting among duplicate writing projects, use file-specific Git history, content hashes, and provenance—not filesystem modification time alone.
4. Do not invent statistical values, citations, analyses, author information, or submission metadata.

## Final analytic sample

1. The final analytic sample is the 39 included participants.
2. The PLV-based quality-screening stage may calculate and inspect condition-level PLV values for all 47 tested participants solely to determine the exclusion cutoff, flag participants, and establish the final analytic sample.
3. After the PLV quality-screening stage fixes the inclusion set, every inferential statistical protocol, including condition tests of PLV, must use only the 39 included participants.
4. Do not conduct, report, or retain manuscript-facing inferential or sensitivity comparisons based on all 47 participants or comparisons of the 47-participant and 39-participant inferential results.
5. Continue to report participant flow transparently: 47 participants were tested, 8 were excluded, and 39 were analyzed. This reporting and the PLV quality-screening procedure are not inferential analyses of the excluded participants.
6. References to inferential or sensitivity analyses based on all 47 tested participants must be removed from the manuscript and active supplement only after item-by-item approval.
7. The authoritative reproducibility repository remains immutable for AI agents. Agents may identify upstream files affected by this policy but must not delete, rewrite, regenerate, or otherwise modify them.

## Writing style

1. Do not use em dashes in project text. Use commas, parentheses, colons, semicolons, or separate sentences as appropriate.
2. Use present tense and active voice wherever practical when describing what the current paper does, reports, presents, includes, or interprets.
3. Reserve past tense primarily for earlier studies, completed historical events, and procedures or observations whose temporal status requires it. Use passive voice only when the actor is unknown, irrelevant, or less important than the action.

## Control-condition terminology

1. The control condition was presented in the VR headset as a dark field with a central fixation marker that also provided breathing-performance feedback.
2. Use ``dark-screen control'' as the concise manuscript label after the condition has been defined. Do not call it a ``black-screen control,'' ``black screen,'' ``blackened VR screen,'' or ``eyes-open control.''
3. Describe the fixation and performance-feedback function fully at the first methodologically appropriate definition and only where technically necessary thereafter. Do not repeatedly restate the complete display configuration.
4. Any submission-facing terminology change remains subject to the mandatory item-by-item approval protocol.

## Temporal tracer placement

1. Substantive temporal experience tracer methods, results, interpretation, and tracer-specific figures belong in the active supplement.
2. The main article should retain the scientific motivation for collecting temporal experience tracers and introduce ``psychometric time-series ratings'' as a plain-language alternative term.
3. Outside that motivation, the main article should retain one concise Methods statement explaining that the tracer results add no explanatory value beyond the questionnaire results in this study, treating the analyses as exploratory, and referring readers to the identifiable supplementary tracer section.
4. The current study-procedure figure contains a tracer label. Because source-derived figures are immutable for AI agents, any removal of that embedded label is a user or repository-maintainer action.
5. Exact submission-facing removals, replacements, captions, and supplementary insertions remain subject to item-by-item approval.

## Reproducibility-package referral

1. Retain a direct OSF reproducibility-package reference where the main Methods identifies the recreated stimulus set, administered item keys, and study materials, and also point readers from that sentence to the supplementary reproducibility map.
2. Other main-text references to detailed analyses, implementation information, or supporting outputs should point to the corresponding identifiable supplementary section rather than repeating the OSF URL or using generic ``OSF repository'' language.
3. The supplement may provide the detailed reproducibility map and immutable repository version after the final commit identifier is available.

## Blinding placement

1. Keep the blinding methods, results, and interpretation parsimonious, complete, and self-contained in `main.tex`.
2. Do not retain an additional blinding-analysis section in the active supplement.
3. Removing the current supplementary blinding section causes the subsequent reproducibility section to become Supplementary Section S5 unless another approved section is inserted before it.

## Declarations and funding facts

1. The authors have declared that they have no competing interests.
2. The BIAL Foundation award is Grant 308/22, ``Altered states of viscereality: Augmenting breathwork with bio-responsive virtual reality,'' from the 2022 Grants Programme for Scientific Research. The public project period is October 2023 to April 2026.
3. Continued development of Viscereality received Baden-W\"urttemberg Stiftung support through the Forschungswerkstatt -- Deine Idee f\"ur Morgen programme for ``Atemr\"aume: Integration atem- und herzratenbasierter Interaktionen in therapeutische VR-Umgebungen,'' with a public project period of 2026--2027.
4. Exact submission-facing declaration and funding wording remains subject to item-by-item approval.
