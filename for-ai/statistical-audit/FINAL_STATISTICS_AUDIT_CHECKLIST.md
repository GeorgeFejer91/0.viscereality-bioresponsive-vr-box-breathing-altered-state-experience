# Final statistics audit checklist

Last updated: 2026-08-23

This checklist is internal. A checked item means the manuscript, supplement, and authoritative output are reconciled, not merely that a local candidate result exists.

## A. Governance and provenance

- [x] Final inferential sample is fixed at 39.
- [x] All 47 tested participants are used only for flow and PLV quality screening.
- [x] PLV reporting is frozen unless the user explicitly reopens it.
- [x] Detailed 11D-ASC statistics are confined to Supplementary S3.
- [x] Main Results use 3D-ASCr as the compact altered-state summary.
- [x] Stepwise directional Bayes factors are not presented as the registered joint-order test.
- [x] Created a complete parsimonious OSF pipeline specification and 48-row chronological segment audit under `for-ai/statistical-audit/`.
- [ ] Record the final authoritative reproducibility-repository commit hash.
- [ ] Confirm every manuscript statistic has one authoritative output cell or documented deterministic derivation.
- [ ] Confirm no `for-ai/` candidate output is included in the submission package.

## B. Registered frequentist pipeline

- [x] Internal candidate RM-ANCOVA implementation created at `for-ai/scripts/candidate_registered_analysis_pipeline.R`.
- [x] Added and executed the equivalent locked-Python candidate at `for-ai/scripts/candidate_registered_rm_ancova.py`; outputs are under `for-ai/statistical-audit/candidate-registered-results/`.
- [x] Validated participant blocking, condition coding, numeric block-position covariate, `F(2,75)` degrees of freedom, self-scale letter recoding, and complete-case handling.
- [x] Independently reproduced all 40 candidate `F` values with statsmodels (maximum absolute difference `2.14e-14`).
- [x] Compared candidate decisions with the current mixed-effects output: nominal and FDR decisions are unchanged for `40/40` outcomes.
- [ ] Have the OSF maintainer adopt and regenerate the registered RM-ANCOVA output.
- [ ] Replace manuscript and supplement mixed-model `chi-square` statistics with authoritative registered partial-`F` statistics after adoption; PLV remains frozen unless the user explicitly includes it in this replacement.
- [ ] Remove the mixed-model departure from main Methods and Supplementary S1 after source adoption.
- [ ] Recheck every nominal and adjusted decision after replacement.

## C. Registered Bayesian pipeline

- [x] Internal candidate joint-order implementation created for EU, BS, and AVS.
- [ ] Execute with at least 100,000 posterior draws per outcome in the locked BayesFactor environment.
- [x] Confirmed the locked native-Windows R backend crashes before execution; Linux x86-64 remains the required BayesFactor runtime.
- [ ] Validate that posterior columns reconstruct all three exchangeable condition effects correctly.
- [ ] Validate the encompassing-prior assumption that each strict three-condition ordering has prior probability `1/6` under the unrestricted factor prior.
- [ ] Report Monte Carlo error for the posterior order probability.
- [ ] Have the OSF maintainer adopt and regenerate the joint ordered Bayes-factor output.
- [ ] Replace the current S3 stepwise directional conclusions with the authoritative joint-order results.
- [ ] Confirm the main paper contains at most one brief qualitative referral to those lower-order registered tests.
- [ ] Verify every omnibus BF is labeled omnibus and every planned-contrast BF is labeled planned contrast.
- [ ] Verify no omnibus value is repeated as a planned-contrast value.

## D. Multiplicity and decision rules

- [x] User selected the less-conservative preregistration-first approach in principle.
- [x] Intended rule: nominal `p` values govern preregistered planned contrasts; FDR governs exploratory and post-hoc screens; adjusted `q` values remain visible as sensitivity information for preregistered multi-outcome families.
- [x] Obtain and apply exact item-by-item approval for the main multiplicity rule and the ICC interpretation.
- [ ] Apply the approved rule consistently to every confirmatory and exploratory conclusion.
- [ ] Verify that no sentence switches between nominal and adjusted thresholds opportunistically.

## E. Main article audit

- [x] PLV block retained unchanged.
- [x] Detailed 11D-ASC block removed and replaced with an S3 referral.
- [x] Main 11D paragraph no longer mixes omnibus and contrast BFs.
- [x] Exploratory pictograph coefficients removed from the main Results.
- [x] Cross-study figure and detailed comparison moved to S3.
- [x] Incorrect claim that Changed Meaning of Percepts was unaffected removed.
- [x] Confidence-weighted blinding index retained with limited emphasis.
- [ ] Finalize the compact 3D-ASCr Bayesian paragraph after RM-ANCOVA adoption.
- [x] Add the six source-locked 3D-ASCr planned-contrast Bayes factors and plain-language model comparisons.
- [x] Define `naive` as recruitment-naive, not screened absence of prior VR, meditation, breathwork, or psychedelic experience.
- [ ] Decide whether exploratory order statistics remain in the main Results or move to the supplement.
- [ ] Confirm abstract, Results, Discussion, and Conclusion make the same strength of claim.
- [ ] Remove or source-lock the repeated `no adverse events across 47` claim.
- [x] Remove equivalence-like cross-study wording from the unqualified final Discussion and Conclusion.

## F. Supplement audit

- [x] S1 names all currently retained analysis additions and unresolved tracer-validity limitation.
- [x] S2 PLV table and diagnostics retained unchanged except control terminology.
- [x] S3 contains every 11D-ASC dimension.
- [x] S3 separates omnibus, planned-contrast, symmetry-contrast, and directional Bayes evidence.
- [x] S3 includes the descriptive cross-study figure and qualified interpretation.
- [x] S4 includes complete composite, subscale, item, and mapping-specific exploratory screens.
- [x] S5 tracer contrast table appears under Condition contrasts rather than ASC–tracer correspondence.
- [ ] Add a compact complete condition-analysis table for all three self measures after exact table approval.
- [x] Keep item-wise blinding detail in the reproducibility output unless a specific item-level manuscript claim is introduced; the registered domain-level estimands are already reported.
- [ ] Add a compact complete registered omnibus table for tracer peak and AUC after authoritative RM-ANCOVA adoption.
- [x] Consolidate and execute the internal pictograph--ASC pipeline under `for-ai/`; manuscript spot checks pass at 10,000 permutations and 2,000 bootstraps.
- [ ] Sync the S4 pictograph-analysis outputs into the authoritative reproducibility repository.
- [ ] Replace S3 mixed-model omnibus statistics after RM-ANCOVA adoption.
- [ ] Replace S3 stepwise directional results after joint-order BF adoption.
- [x] Reconcile the supplement's four-study prose and five-dataset caption with the current six-profile cross-study figure and final Fincham citation.

## G. Numerical and build verification

- [ ] Automated extraction confirms every repeated numerical value is identical across main, supplement, figures, and authoritative CSVs.
- [ ] Every `p`, `q`, BF, CI, effect size, sample size, and degrees-of-freedom label maps to the intended estimand.
- [ ] All Bayes factors are reported in the evidential direction described in prose.
- [ ] Every null-evidence claim is supported by a BF or appropriate equivalence analysis, not merely a nonsignificant `p` value.
- [x] Main and supplement compile without undefined citations, references, duplicate labels, overfull boxes, or oversized floats.
- [ ] Visually inspect every page containing a statistical table or figure.
- [ ] Confirm the source archive excludes `for-ai/`, candidate outputs, build caches, and internal audit documents.
- [ ] Mark this checklist complete only after authoritative OSF reconciliation.
