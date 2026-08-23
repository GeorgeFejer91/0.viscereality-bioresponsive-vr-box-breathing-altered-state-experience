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

## Mandatory GitHub checkpoint before each approved item

1. Before implementing any separately approved project-text item, create a reviewable Git checkpoint containing the repository state that exists immediately before that item and successfully push the checkpoint to the configured GitHub remote.
2. Treat each approved item independently. When multiple items are approved together, push the pre-item state before implementing Item 1, then commit and push the resulting state before implementing Item 2, and continue in the same sequence.
3. Do not implement an approved item if the required pre-item commit or GitHub push fails. Report the failure and leave the item unapplied.
4. Never discard, overwrite, revert, or silently absorb unrelated user changes to create a checkpoint. Inspect the working tree, identify what the checkpoint contains, and preserve the complete reviewable history.
5. Report the checkpoint commit identifier and pushed branch when implementing each approved item.
6. This checkpoint rule does not authorize changes to immutable research artifacts or the authoritative reproducibility repository.

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

1. Apply these rules to all project prose, including every proposed replacement and other prose recommendation presented for approval.
2. Write for the reader. Present each point in the order needed to understand it, make the relevance clear, and state the intended meaning directly rather than making the reader infer it.
3. Use present tense and active voice when describing what the current paper does, reports, presents, includes, argues, or interprets. Treat these as actions the paper performs now, not actions the authors completed in the past.
4. Describe previous studies in the past tense and passive voice. Use the tense and voice required for accuracy when reporting completed procedures, observations, or historical events that do not concern the current paper's present actions.
5. Keep prose concise, concrete, grounded, and down to earth. Remove throat-clearing, inflated claims, unnecessary qualifiers, superfluous repetition, and any sentence that does not advance the reader's understanding.
6. Avoid an overabundance of positive or promotional adjectives. Use evaluative language only when evidence supports it and the distinction matters.
7. Do not use em dashes in project text. Use commas, parentheses, colons, semicolons, or separate sentences as appropriate.
8. Avoid repeating the same distinctive word, phrase, sentence pattern, or explanation across the paper. Check nearby text and the wider manuscript when drafting a suggestion, and vary nontechnical wording where this improves the prose without changing meaning.
9. Preserve exact repetition when methodological clarity, defined terminology, instrument names, condition labels, statistical labels, or other technical conventions require consistent wording. Do not replace a precise established term merely to create superficial variety.
10. State result interpretations directly. Do not introduce them with self-narrating labels such as ``in plain terms.''
11. When an order test is not statistically reliable, write that there was no reliable evidence that the outcome or result was influenced by the order in which participants underwent the three conditions. Do not convert a nonsignificant order test into a categorical claim that order had no influence.
12. When describing a hypothesized or observed increase in positively valenced experience, do not use ``bias'' or ``biased.'' Use neutral wording such as ``increase,'' ``enhance,'' or ``produce stronger positively valenced experiences,'' according to the evidence and context. Reserve ``bias'' for genuine technical meanings, such as an explicitly directional model parameter or systematic measurement bias.

## Table formatting

1. Apply the Table S1 layout as the default formatting standard for every table in the main article and supplement.
2. Set each table to use the full available text width and distribute intercolumn spacing evenly and symmetrically across that width.
3. Centre every column heading and body entry horizontally within its column.
4. Keep column headings and body entries on a single line. Do not use fixed-width paragraph columns that introduce avoidable wrapping or hyphenation.
5. Fit each table within the page width without clipping or horizontal overflow. Adjust the column structure and intercolumn spacing before reducing the type size, and preserve legibility.

6. Compile and visually inspect every formatted table at final page size. Confirm centred alignment, balanced spacing, single-line cells, clear rules, and exact fit within the text block.
7. If a table is too information-dense to meet all of these requirements legibly, present the necessary exception for explicit user approval before implementing it.

## Bayes-factor reporting language

1. Identify the direction of every reported Bayes factor and the two models or hypotheses being compared. Use $\mathrm{BF}_{10}$ for evidence of the specified effect model relative to its null model and $\mathrm{BF}_{01}$ for the inverse comparison.
2. Follow each Bayes factor with a concise plain-language interpretation. State that the observed data or pattern are approximately $x$ times more likely under one specified model than under the other.
3. Do not state that a hypothesis itself is $x$ times more likely, and do not convert a Bayes factor into a posterior probability, unless prior model probabilities have been explicitly specified and the conversion is warranted.
4. Keep the interpretation relative. A Bayes factor compares only the named models; it is not absolute evidence that an effect exists or does not exist.
5. Report the numerical Bayes factor rather than relying only on categorical labels such as anecdotal, moderate, strong, or extreme. Values close to 1 indicate that the data do not clearly distinguish the compared models.
6. Prefer Bayes factors greater than or equal to 1 in the evidential direction being described. When the data favor the null model, report $\mathrm{BF}_{01}$ rather than a fractional $\mathrm{BF}_{10}$ when this improves readability.
7. Distinguish omnibus, planned-contrast, directional, and robustness Bayes factors explicitly. Never describe an omnibus Bayes factor as evidence from a paired contrast, or a set of stepwise directional comparisons as one joint ordered-model test.
8. Report the prior family and scale, model definitions, and software package and version once in the appropriate Methods, table note, or reproducibility description. Do not repeat these implementation details after every result.
9. A change of software package is not, by itself, a substantive analytic deviation when the same statistical model, hypotheses, priors, and estimand are reproduced. Record the software used for reproducibility without foregrounding the substitution in the scientific narrative. Actual changes to the model, priors, hypotheses, or estimand remain analytically substantive.
10. Do not interpret a nonsignificant $p$ value as evidence for the null model. Use the corresponding Bayes factor or another appropriate equivalence procedure when making an evidence-of-absence claim.

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
6. The preregistration's description of continuous in-block tracer ratings is closed by user direction. Report the implemented retrospective post-block tracer procedure accurately, but do not add a deviation disclosure, treat the description difference as unresolved, or repeatedly raise it unless the user explicitly reopens the issue.

## Reproducibility-package referral

1. Retain a direct OSF reproducibility-package reference where the main Methods identifies the recreated stimulus set, administered item keys, and study materials, and also point readers from that sentence to the supplementary reproducibility map.
2. Other main-text references to detailed analyses, implementation information, or supporting outputs should point to the corresponding identifiable supplementary section rather than repeating the OSF URL or using generic ``OSF repository'' language.
3. The supplement may provide the detailed reproducibility map and immutable repository version after the final commit identifier is available.

## Local-first submission sequencing

1. Complete manuscript, supplement, bibliography, source-package, naming, compilation, and visual-formatting work inside this repository before publishing the final reproducibility package externally.
2. Treat uploads or final releases to OSF, Zenodo, and the authoritative GitHub reproducibility repository as end-stage maintainer actions. Do not make or simulate those releases during manuscript-formatting work.
3. Use explicit, uniquely searchable placeholders for external identifiers that do not yet exist. Candidate placeholder classes are the OSF project DOI, Zenodo version DOI, GitHub final commit, and GitHub release tag. Any insertion or replacement in submission-facing text remains subject to exact item-by-item approval.
4. Keep deferred external-release work and the final reproducibility audit in the dedicated submission-formatting to-do list in `PROJECT_STATE.md`.
5. Do not treat placeholder-bearing manuscript or supplementary files as submission-ready. Replace and verify every placeholder only after the final reproducibility audit and external archival records are complete.

## Build and upload-artifact orchestration

1. Keep every build, validation, staging, packaging, and file-renaming script under `for-ai/scripts/`, and keep all temporary compilation state under `for-ai/`.
2. Produce upload-facing artifacts only under `output/submission/`. Do not place orchestration scripts, logs, auxiliary files, manifests, or temporary build trees there.
3. The canonical review PDF names are `Manuscript.pdf` for the main article and `ESM_1.pdf` for Online Resource 1. Orchestration must copy only successfully compiled, validated PDFs to those names.
4. Treat `output/pdf/main-article.pdf` and `output/pdf/supplementary-materials.pdf` as legacy local outputs once the canonical orchestrator is approved and implemented. Do not package them for submission.
5. The upload-facing source archive must be named `Manuscript_Source.zip`, contain only the editable sources and assets needed by Springer, and exclude `AGENTS.md`, `for-ai/`, Git metadata, temporary files, build artifacts, internal archives, and review-only files.
6. Build and packaging commands must default to a safe preview or validation mode where practical, fail on missing expected artifacts or unresolved placeholders at final-release mode, and report the exact files they produce or include.

## Blinding placement

1. Keep the blinding methods, results, and interpretation parsimonious, complete, and self-contained in `main.tex`.
2. Do not retain an additional blinding-analysis section in the active supplement.
3. Removing the current supplementary blinding section causes the subsequent reproducibility section to become Supplementary Section S5 unless another approved section is inserted before it.

## Declarations and funding facts

1. The authors have declared that they have no competing interests.
2. The BIAL Foundation award is Grant 308/22, ``Altered states of viscereality: Augmenting breathwork with bio-responsive virtual reality,'' from the 2022 Grants Programme for Scientific Research. The public project period is October 2023 to April 2026.
3. Continued development of Viscereality received Baden-W\"urttemberg Stiftung support through the Forschungswerkstatt -- Deine Idee f\"ur Morgen programme for ``Atemr\"aume: Integration atem- und herzratenbasierter Interaktionen in therapeutische VR-Umgebungen,'' with a public project period of 2026--2027.
4. Exact submission-facing declaration and funding wording remains subject to item-by-item approval.

## Altered-state reporting hierarchy

1. Use the post-preregistration 3D-ASCr composites as the sole detailed altered-state analysis in the main article.
2. Keep enough main-text Methods language to identify the preregistered 11D-ASC measurement, disclose that the 3D-ASCr scoring system became available only after preregistration, explain why its level of aggregation matches the paper's explanatory scope, and refer readers explicitly to Supplementary Section S3.
3. Move substantive 11D-ASC results and lower-order subscale interpretation out of the main Results and Discussion and into Supplementary Section S3 after exact item-by-item approval.
4. Supplementary Section S3 must report every analysis promised for the 11D-ASC in the preregistration, together with transparent disclosure of any implemented deviations. It must include all 11 subscales, the condition analysis, both planned contrasts, parallel Bayesian analyses, and the preregistered directional ordering checks for Experience of Unity, Blissful State, and Audio-Visual Synesthesia.
5. The main 3D-ASCr reporting should mirror the general analysis structure used for the 11D-ASC where scientifically defensible, but preregistered subscale-specific directional predictions must not be relabeled as preregistered composite-level predictions.
6. Supplementary Section S3 should include a parsimonious, explicitly descriptive decomposition showing which constituent 11D-ASC subscales account arithmetically for each 3D-ASCr composite difference. Do not describe this deterministic decomposition as causal, independent, or inferential evidence.
7. Older manuscript and dissertation versions may be used as source material, but numerical claims must be checked against the immutable authoritative outputs before being proposed for transfer. Do not copy known mixed Bayesian statistics or inaccurate lower-order interpretations unchanged.
8. All submission-facing wording and table insertions remain subject to the mandatory item-by-item approval protocol and the immutable research-artifact gate.
9. Structure Supplementary Section S3 hierarchically under the three 3D-ASCr composites. Within each composite subsection, present every constituent 11D-ASC dimension under a consistent bold run-in heading using its full name.
10. Each lower-order dimension block should follow the same reporting order: condition descriptives, implemented order-adjusted omnibus result, preregistered RM-ANOVA sensitivity, pooled-VR-versus-control contrast, symmetric-versus-asymmetric contrast, Bayesian omnibus and planned contrasts, directional result when preregistered, and descriptive contribution to its parent composite.
11. Each lower-order dimension block should close with a direct substantive summary of the condition pattern and a cautious statement about the exploratory order checks. The primary omnibus condition test adjusts for presentation position but does not itself test an order effect; distinguish it from the exploratory order-main-effect and condition-by-order tests.
12. In reader-facing interpretive prose, describe the 11D-ASC dimensions as ``fine-grained subscales'' or ``more granular subscales'' rather than ``lower-order'' subscales. Retain ``lower-order'' only when technically necessary to describe a psychometric hierarchy or source terminology.
11. Complete the S3 structure, Methods correspondence, and Results correspondence before proposing or editing the altered-states Discussion. Discussion relocation and interpretation are deliberately deferred.
12. Title Supplementary Section S3 ``11D-ASC: Altered States of Consciousness Rating Scale'' so readers can immediately identify it as the relocated complete analysis of the preregistered 11 dimensions. Use ``11D-ASC'' rather than ``11-ASC'' as the standard instrument abbreviation.

## Preregistration knowledge base

1. The preserved source registration is `for-ai/preregistration/Study3_AsPredicted_Preregistration_262545.pdf`; its SHA-256 is `B8DA2B50E976E14C3A552D32194B659ECB66CC62A23284DD3610FF7729FB913D`.
2. The durable commitment and departure ledger is `for-ai/preregistration/PREREGISTRATION_AND_DEVIATIONS.md`.
3. Read that ledger before any task involving study design, hypotheses, outcomes, exclusions, sample size, analysis status, statistical models, temporal tracers, blinding, or preregistration claims.
4. Keep preregistered, post-preregistration, exploratory, robustness, sensitivity, and descriptive work explicitly distinct. Accurate reporting of an implemented method does not by itself resolve an undisclosed departure.
5. Update the ledger, `PROJECT_STATE.md`, and `CHANGELOG.md` whenever a preregistration-related discrepancy is resolved, newly discovered, or changed.
6. The preserved PDF is an immutable byte-identical source copy and must remain excluded from external submission packages with the rest of `for-ai/`.

## Submission review line numbering

1. Use the Springer Nature class's built-in `lineno` option for both the main manuscript and the active supplementary document during submission review.
2. Keep this as a document-class option rather than adding a separate line-numbering implementation.
3. Any submission-facing source edit needed to activate the option remains subject to the item-by-item approval protocol.

## Cross-repository figure filename contract

1. The exact filenames used by active `\includegraphics` commands in `main.tex` and `supplementary/main.tex` are the controlling names for the corresponding canonical figure exports in the authoritative reproducibility repository.
2. A canonical pipeline export, its numeric prefix, the manuscript copy, figure manifests, generated registries, and reviewer-scope records must all use the same exact filename.
3. Never allow a source-only numbering scheme or historical alias to diverge from the active manuscript asset name.
4. If a figure is renamed or renumbered in either repository, update every affected reference and registry in both repositories in the same task, then verify that every active TeX reference resolves to the identically named canonical export.
