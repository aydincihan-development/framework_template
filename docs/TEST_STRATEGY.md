# Test Strategy (Framework Governance v1)

## Purpose
Standardize how we select, run, and report tests after implementing a feature (`FEAT-*`) or change request (`CHG-*`) so AI-assisted development remains predictable and low-chaos as the project grows.

This document is a process standard. It does not replace feature-specific test requirements in `docs/features/*.md`; it defines how to execute and report them consistently.

## Scope
Applies to:
- All feature implementations (`FEAT-*`)
- All change requests (`CHG-*`)
- AI-assisted and human-driven changes

Includes:
- Minimum quality gate
- Feature test vs regression test selection rules
- Initial feature/change -> test file mapping
- Result reporting format

Excludes:
- CI pipeline implementation details
- Unit/integration test framework design (future)

## Core Principles
1. Run the tests that prove the new behavior works.
2. Run the tests most likely to catch regressions in impacted areas.
3. Report exactly what was run and what passed/failed/skipped.
4. Do not hide failures behind vague summaries.
5. If a feature depends on setup/migration, state that dependency explicitly in the test report.

## Minimum Quality Gate (Default)
Unless the current feature/change doc explicitly defines a different gate, the default completion gate is:

1. `npx tsc --noEmit`
2. Playwright tests for the implemented feature/change (direct validation)
3. Playwright regression tests for impacted existing features

Optional additions (case by case):
- `lint` (when lint rules are stable and enforced)
- broader E2E suite runs for cross-cutting changes

## Test Selection Rules

### A) Feature Tests (Direct Validation)
Run the Playwright test file(s) that directly validate the current feature/change.

Examples:
- FEAT-000X Core Workflow -> `tests/<core>.spec.ts`
- FEAT-000Y Navigation/UI Shell -> `tests/<navigation>.spec.ts`
- FEAT-000Z Reporting/Dashboard -> `tests/<dashboard>.spec.ts`

### B) Regression Tests (Impacted Areas)
Add regression tests based on what the implementation touched, not just the feature title.

Use this checklist:
- Auth/session flow touched? -> include auth-related specs
- Navigation/layout shell touched? -> include navigation-related specs
- Core CRUD/data query touched? -> include domain CRUD specs
- Dashboard/reporting touched? -> include reporting/dashboard specs
- Taxonomy/category/tag logic touched? -> include taxonomy specs and related CRUD regressions

### C) Docs-Only / Governance Changes
For docs-only changes:
- Do not run application E2E by default
- Validate with:
  - document completeness against change requirements
  - pilot usage scenario (manual process validation)

If the governance change modifies executable scripts/configs, then run impacted automated checks.

## Setup / Migration-Dependent Features
Some features require DB setup or migrations before tests can validate real behavior.

Rule:
- If a feature depends on a migration, the final test report must say whether the migration was applied.
- Test reports must not imply “feature is fully validated” if setup prerequisites were missing.

Recommended wording:
- `Migration status: Applied (docs/db/<migration-file>.sql)`
- or `Migration status: Not applied (feature tests may not reflect final behavior)`

## Initial Test Mapping (v1)

This table is intentionally lightweight and should evolve as new features/tests are added.

| Feature / Change | Primary Test File(s) | Typical Regression Tests | Notes |
|---|---|---|---|
| FEAT-0001 Authentication | `tests/auth.spec.ts` | `tests/navigation.spec.ts` | Adjust to your auth boundaries |
| FEAT-0002 Core CRUD | `tests/<domain>.spec.ts` | `tests/auth.spec.ts`, `tests/navigation.spec.ts` | Core data flows often impact multiple areas |
| FEAT-0003 Dashboard/Reports | `tests/dashboard.spec.ts` | `tests/<domain>.spec.ts`, `tests/navigation.spec.ts` | Validate data contract and UI shell impact |
| FEAT-0004 Navigation Shell | `tests/navigation.spec.ts` | `tests/<domain>.spec.ts`, `tests/dashboard.spec.ts` | Layout changes can regress many pages |
| CHG-000X Existing Feature Change | `tests/<affected>.spec.ts` | impacted feature specs | Pick by touched components, not title only |

## Test Execution Order (Recommended)
For faster feedback and lower debugging cost:

1. `npx tsc --noEmit`
2. Primary feature/change Playwright tests
3. Impacted regression Playwright tests
4. Optional broader suite (if cross-cutting)

Why this order:
- Type errors fail fast
- Feature tests confirm intended behavior first
- Regression tests confirm no collateral damage

## Test Result Reporting Format (Final Response Template)
Use this structure in implementation summaries.

### Required fields
- What was run
- Result per command (`passed` / `failed` / `skipped`)
- Key failure summary (if any)
- Setup/migration status (if relevant)
- Net status (feature validation + regression status)
- DoD status reference (`docs/DEFINITION_OF_DONE.md`)

### Example
```text
Validation Results
- npx tsc --noEmit ✅
- npx playwright test tests/<primary>.spec.ts ✅
- npx playwright test tests/<regression-1>.spec.ts ✅
- npx playwright test tests/<regression-2>.spec.ts ✅

Migration status
- Applied: docs/db/<migration-file>.sql

Net status
- Feature tests passed
- Required regressions passed
- One skipped test remains an existing known skip (not introduced by this change)
```

## Handling Failures
If any required test fails:
1. Fix the implementation (preferred)
2. Re-run the relevant test(s)
3. Re-run impacted regressions if the fix touches shared code
4. Report the final status transparently

Do not:
- Declare success while required tests are failing
- Change requirements to avoid failing tests
- Hide skipped/failing tests in summaries

## Maintenance Rule (Lightweight)
Update `docs/TEST_STRATEGY.md` when any of the following happens:
- A new feature gets a new Playwright test file
- A change introduces a recurring regression test dependency pattern
- The minimum quality gate changes
- A setup dependency (e.g. migrations) repeatedly affects validation practice

Keep updates small:
- Add or adjust one mapping row / note
- Avoid rewriting the whole document unless the process itself changed

## Current Test Inventory (Reference)
- `tests/auth.spec.ts`
- `tests/<domain>.spec.ts`
- `tests/dashboard.spec.ts`
- `tests/navigation.spec.ts`
- `tests/<feature-specific>.spec.ts`

Non-standard / debug tests:
- `tests/debug_*.spec.ts` (debug-only; not part of default quality gate)
