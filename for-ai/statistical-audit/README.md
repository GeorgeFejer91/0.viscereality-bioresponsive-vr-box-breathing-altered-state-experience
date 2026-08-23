# Statistical reporting audit control

This directory is the internal control point for reconciling manuscript statistics with the authoritative reproducibility repository.

Nothing in this directory is submission-facing or authoritative. Candidate analyses must be adopted, reviewed, executed, and published in:

`https://github.com/GeorgeFejer91/0_OSF_reproducability_package`

before their numerical results may be inserted into the manuscript, supplement, OSF package, or submission archive.

Files:

- `STATISTICAL_REPORTING_CHRONOLOGY.md`: running segment-numbered inventory of every statistical reporting block in the main article and supplement, with source-output mappings.
- `FINAL_STATISTICS_AUDIT_CHECKLIST.md`: curated completion checklist for the final manuscript-versus-pipeline audit.
- `REGISTERED_PIPELINE_EXECUTION_SUMMARY.md`: executed RM-ANCOVA evidence, decision comparison, and remaining joint-Bayes blocker.
- `NON_OSF_STATISTICS_PIPELINE_INVENTORY.md`: exhaustive list of manuscript-facing statistics pipelines absent from OSF, their internal candidates, and adoption requirements.
- `FULL_PAPER_STATISTICAL_CLAIM_AUDIT.md`: chronological main/supplement consistency audit, missing-statistics inventory, claim-support assessment, and parsimonious reporting recommendations.
- `PENDING_STATISTICAL_TEXT_APPROVAL_ITEMS.md`: exact current-versus-proposed submission-facing wording items, with rationale, consequences, risks, and verification; none is applied without item-by-item approval.
- `candidate-registered-results/`: executed internal candidate outputs. Their `ADOPTION_REQUIRED.txt` marker is mandatory; all contents remain non-authoritative.
- `non-osf-results/pictograph-asc-correspondence/`: executed internal candidate outputs for the complete S4 pictograph--ASC analysis, with an adoption-required marker.

Candidate implementation:

- `for-ai/scripts/candidate_registered_analysis_pipeline.R`
- `for-ai/scripts/candidate_registered_rm_ancova.py`
- `for-ai/scripts/pictograph_asc_correspondence_pipeline.py`

The R candidate implements the registered order-adjusted repeated-measures ANCOVA and the registered joint ordered Bayes factor for EU, BS, and AVS. The Python RM-ANCOVA candidate independently implements the same registered frequentist omnibus model and has been executed in the locked OSF Python environment. The pictograph candidate consolidates every exploratory S4 analysis and has been executed at the manuscript's full permutation/bootstrap settings. All candidates default to dry runs where applicable and refuse to write inside the authoritative repository. The Windows R backend is unusable, so the registered joint-order Bayes factors still require execution in the locked Linux x86-64 environment.
