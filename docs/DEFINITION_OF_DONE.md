# Definition of Done (DoD) - Framework Standard

This checklist defines the minimum completion criteria for any `FEAT-*` or `CHG-*` work item.

A work item is "Done" only if all applicable items below are satisfied.

## 1) Scope Alignment
- Implementation matches the active feature/change document scope.
- Acceptance criteria are satisfied.
- No silent scope expansion was introduced.

## 2) Change Control
- Changes are limited to impacted components as much as possible.
- Any architecture/library/pattern change is covered by an approved entry in `docs/DECISIONS.md`.

## 3) Data and Migration
- If data model changed, migration/sql docs are created or updated.
- `docs/DATA_MODEL.md` is updated only when schema/domain contracts changed.
- Migration/setup prerequisites are explicitly reported in validation summary.

## 4) Quality Gate
- Typecheck passes (`npx tsc --noEmit`).
- Feature tests pass (as defined in active feature/change doc).
- Impacted regression tests pass (selected via `docs/TEST_STRATEGY.md`).
- Failures are fixed; requirements are not changed to bypass failures.

## 5) Test Reporting
- Final report includes:
  - commands executed
  - pass/fail/skip results
  - key failure cause (if any)
  - migration/setup status (if relevant)

## 6) Documentation Discipline
- Docs are not finalized before explicit human approval of final behavior.
- After approval, impacted docs are updated consistently (feature/change docs and related standards if needed).

## 7) Approval
- Human owner explicitly confirms the final behavior is accepted.

## 8) Release Readiness Notes
- Any known limitation, temporary fallback, or technical debt introduced in this iteration is documented.

---

## Quick Close Checklist (operator-friendly)
- [ ] Scope complete and ACs met
- [ ] No unapproved architectural drift
- [ ] Data/migration impacts handled
- [ ] `tsc` passed
- [ ] Feature tests passed
- [ ] Regression tests passed
- [ ] Results transparently reported
- [ ] Human approval received
- [ ] Impacted docs updated after approval
