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
- [ ] Record the final authoritative reproducibility-repository commit hash.
- [ ] Confirm every manuscript statistic has one authoritative output cell or documented deterministic derivation.
- [ ] Confirm no `for-ai/` candidate output is included in the submission package.

## B. Registered frequentist pipeline

- [x] Internal candidate RM-ANCOVA implementation created at `for-ai/scripts/candidate_registered_analysis_pipeline.R`.
- [ ] Execute the candidate in the locked R environment and save internal output under `for-ai/statistical-audit/candidate-registered-results/`.
- [ ] Validate participant blocking, condition coding, numeric block-position covariate, degrees of freedom, and complete-case handling.
- [ ] Compare candidate decisions against the current mixed-effects output for PLV, 11D-ASC, 3D-ASCr, self, tracer peak, and tracer AUC.
- [ ] Have the OSF maintainer adopt and regenerate the registered RM-ANCOVA output.
- [ ] Replace every manuscript and supplement mixed-model `chi-square` statistic with the authoritative registered partial-`F` statistic.
- [ ] Remove the mixed-model departure from main Methods and Supplementary S1 after source adoption.
- [ ] Recheck every nominal and adjusted decision after replacement.

## C. Registered Bayesian pipeline

- [x] Internal candidate joint-order implementation created for EU, BS, and AVS.
- [ ] Execute with at least 100,000 posterior draws per outcome in the locked BayesFactor environment.
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
- [ ] Obtain exact item-by-item approval for the revised main Methods, main Results, S3 orientation, ICC block, and S3 Distressing summary wording.
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
- [ ] Define `naive` as recruitment-naive, not screened absence of prior VR, meditation, breathwork, or psychedelic experience, after exact wording approval.
- [ ] Decide whether exploratory order statistics remain in the main Results or move to the supplement.
- [ ] Confirm abstract, Results, Discussion, and Conclusion make the same strength of claim.

## F. Supplement audit

- [x] S1 names all currently retained analysis additions and unresolved tracer-validity limitation.
- [x] S2 PLV table and diagnostics retained unchanged except control terminology.
- [x] S3 contains every 11D-ASC dimension.
- [x] S3 separates omnibus, planned-contrast, symmetry-contrast, and directional Bayes evidence.
- [x] S3 includes the descriptive cross-study figure and qualified interpretation.
- [x] S4 includes complete composite, subscale, item, and mapping-specific exploratory screens.
- [x] S5 tracer contrast table appears under Condition contrasts rather than ASC–tracer correspondence.
- [ ] Add a compact complete condition-analysis table for all three self measures after exact table approval.
- [ ] Add item-wise blinding reporting if the authoritative pipeline produces the registered item inventory and the table receives exact approval.
- [ ] Sync the S4 pictograph-analysis outputs into the authoritative reproducibility repository.
- [ ] Replace S3 mixed-model omnibus statistics after RM-ANCOVA adoption.
- [ ] Replace S3 stepwise directional results after joint-order BF adoption.

## G. Numerical and build verification

- [ ] Automated extraction confirms every repeated numerical value is identical across main, supplement, figures, and authoritative CSVs.
- [ ] Every `p`, `q`, BF, CI, effect size, sample size, and degrees-of-freedom label maps to the intended estimand.
- [ ] All Bayes factors are reported in the evidential direction described in prose.
- [ ] Every null-evidence claim is supported by a BF or appropriate equivalence analysis, not merely a nonsignificant `p` value.
- [ ] Main and supplement compile without undefined citations, references, duplicate labels, overfull boxes, or oversized floats.
- [ ] Visually inspect every page containing a statistical table or figure.
- [ ] Confirm the source archive excludes `for-ai/`, candidate outputs, build caches, and internal audit documents.
- [ ] Mark this checklist complete only after authoritative OSF reconciliation.
