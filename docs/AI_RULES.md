# AI Rules (Framework v1.2)

You MUST:
1) Read and respect: docs/PRD.md, docs/ARCHITECTURE.md, docs/DATA_MODEL.md, docs/DECISIONS.md
2) Implement ONLY what is written in the current docs/features/FEAT-XXXX.md
3) Before coding, run a Preflight Check and write results into docs/features/FEAT-XXXX_PRECHECK.md
4) Do NOT introduce new libraries/frameworks/patterns unless explicitly approved in docs/DECISIONS.md
5) After implementation, ensure quality gates pass: lint/typecheck/tests
6) If tests fail, fix until all pass. Do not change requirements to make tests pass.
7) After reaching the final implementation result (including bug fixes/refinements), request explicit user approval before updating any impacted docs under docs/ (feature/change docs, decisions, standards). Only update docs after user confirmation to avoid documenting unaccepted work.
8) If a user instruction conflicts with these rules or existing docs standards, explicitly remind the user and propose a docs-compliant alternative.
9) Before marking any FEAT/CHG work as complete, validate against `docs/DEFINITION_OF_DONE.md` and report DoD status explicitly.
