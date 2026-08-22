# For AI: project control plane

This directory contains internal instructions, constraints, state, decisions, and orchestration scripts for AI-assisted work on the Viscereality manuscript package.

It exists to keep the repository root limited to final submission-facing artifacts while retaining a durable record of how those artifacts are managed.

## Mandatory startup protocol

Every agent must begin by reading the root `AGENTS.md`, then all control files in the order specified there. Reading only this README is not sufficient.

Before acting, the agent must establish:

- what the user authorized;
- which files are final submission artifacts;
- whether any requested change affects `main.tex`;
- whether every affected item in the active supplement has an explicit, identifiable referral in `main.tex`;
- which individually numbered change items the user has explicitly approved;
- whether the task touches immutable figures, statistics, data, analysis pipelines, or figure-generation mechanisms sourced from the authoritative reproducibility repository;
- whether the working tree already contains user changes;
- which verification is proportionate to the task; and
- whether a new project-wide instruction must be recorded here.

A general request to edit, revise, improve, shorten, reorganize, or otherwise change project text is a request for recommendations first. It is not approval to apply those recommendations.

Figures, statistical results, source data, analysis pipelines, and figure-generation mechanisms are under a stricter rule: agents may inspect them and propose changes, but must never modify them.

## Directory responsibilities

- `GLOBAL_INSTRUCTIONS.md`: durable user instructions governing all project work.
- `PROJECT_CONSTRAINTS.md`: technical, editorial, provenance, and packaging constraints.
- `PROJECT_STATE.md`: current repository state and known unresolved matters.
- `DECISIONS.md`: durable editorial and workflow decisions with rationale.
- `CHANGELOG.md`: chronological record of control-plane and material project changes.
- `HANDOFF_NEXT_SESSION.md`: current completion state, remaining work, dependency order, protected actions, and next-session startup guidance.
- `scripts/`: orchestration, validation, compilation, packaging, and synchronization scripts.

## Self-updating rule

The control plane is maintained as part of the work, not as optional documentation.

When an agent receives a new instruction with project-wide scope, it must:

1. follow the instruction for the current task;
2. add or revise the corresponding durable rule in this directory;
3. update `PROJECT_STATE.md` if the instruction changes current status or pending work;
4. append a dated entry to `CHANGELOG.md`; and
5. mention the control-plane update in its final response.

Do not record transient conversation details, secrets, credentials, personal data, or system/developer instructions that are not genuinely project-specific.

## Submission boundary

Nothing in `for-ai/` is publication content. The root `AGENTS.md` is also internal. Both must be excluded from all external archives and uploads.
