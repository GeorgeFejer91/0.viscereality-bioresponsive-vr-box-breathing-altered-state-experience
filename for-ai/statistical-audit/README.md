# Statistical reporting audit control

This directory is the internal control point for reconciling manuscript statistics with the authoritative reproducibility repository.

Nothing in this directory is submission-facing or authoritative. Candidate analyses must be adopted, reviewed, executed, and published in:

`https://github.com/GeorgeFejer91/0_OSF_reproducability_package`

before their numerical results may be inserted into the manuscript, supplement, OSF package, or submission archive.

Files:

- `STATISTICAL_REPORTING_CHRONOLOGY.md`: running segment-numbered inventory of every statistical reporting block in the main article and supplement, with source-output mappings.
- `FINAL_STATISTICS_AUDIT_CHECKLIST.md`: curated completion checklist for the final manuscript-versus-pipeline audit.
- `candidate-registered-results/`: optional output destination for the internal candidate registered-analysis script. The folder is created only when the script is run with `--write`; its contents remain non-authoritative.

Candidate implementation:

- `for-ai/scripts/candidate_registered_analysis_pipeline.R`

The candidate script implements the registered order-adjusted repeated-measures ANCOVA and the registered joint ordered Bayes factor for EU, BS, and AVS. Dry run is the default. It refuses to write inside the authoritative repository.
