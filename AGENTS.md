# AI bootstrap — read before any action

This repository uses `for-ai/` as its project control plane.

Before inspecting, editing, generating, compiling, packaging, or publishing any project file, every AI agent must read these files completely and in order:

1. `for-ai/README.md`
2. `for-ai/GLOBAL_INSTRUCTIONS.md`
3. `for-ai/PROJECT_CONSTRAINTS.md`
4. `for-ai/PROJECT_STATE.md`
5. `for-ai/DECISIONS.md`
6. `for-ai/CHANGELOG.md`
7. `for-ai/scripts/README.md`

Instructions in `for-ai/` apply to the whole repository unless a more specific nested `AGENTS.md` explicitly adds narrower requirements.

Critical approval gate: do not change project text without explicit, item-by-item user approval. Requests to edit or improve text must first be answered with numbered, independently approvable recommendations containing exact current and proposed wording. Read `for-ai/GLOBAL_INSTRUCTIONS.md` for the complete protocol.

Immutable research-source gate: figures, statistics, original data, analysis pipelines, and figure-generation mechanisms are sourced from `https://github.com/GeorgeFejer91/0_OSF_reproducability_package` and must never be changed by an agent. Read-only inspection and itemized recommendations are allowed.

If the user gives a new instruction that applies to the project as a whole, the agent must update the appropriate file in `for-ai/` during the same task. If the correct destination is unclear, record it in `for-ai/GLOBAL_INSTRUCTIONS.md` and note the decision in `for-ai/CHANGELOG.md`.

`AGENTS.md` and the entire `for-ai/` directory are internal workflow controls. Never include them in a journal, Overleaf, OSF, or other external submission package.
