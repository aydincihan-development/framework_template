# AI-Driven Software Development Framework User Guide

## 1) Purpose
This document explains how this framework works for teams that want fast but controlled human + AI software development.

This is not an end-user application guide. It is an operating guide for contributors.

## 2) What this framework solves
Without process controls, AI-assisted development often creates:
- scope drift
- undocumented changes
- architecture inconsistency
- hidden regressions

This framework prevents that by making docs the source of truth and enforcing a repeatable delivery flow.

## 3) Core operating model
The framework is docs-driven.

Every implementation must follow this order:
1. Define scope in a feature/change doc (`docs/features/*.md`)
2. Run preflight and record risk/plan in `*_PRECHECK.md`
3. Implement only approved scope
4. Run quality gate (typecheck + feature tests + impacted regressions)
5. Get user approval
6. Update impacted docs only after approval

## 4) Roles and responsibilities

### Human (product/owner)
- Defines goals and priorities
- Approves scope changes
- Approves final result before docs finalization
- Decides which standards become project-wide decisions

### AI (implementation engine)
- Reads framework docs before coding
- Implements only documented scope
- Runs required validation
- Reports results transparently
- Refuses undocumented architectural drift

## 5) Source-of-truth documents
- `docs/AI_RULES.md`: non-negotiable working rules
- `docs/PRD.md`: product scope and MVP boundaries
- `docs/ARCHITECTURE.md`: architecture boundaries
- `docs/DATA_MODEL.md`: schema/domain contracts
- `docs/DECISIONS.md`: approved technical decisions
- `docs/TEST_STRATEGY.md`: test selection and reporting standard
- `docs/DEFINITION_OF_DONE.md`: completion criteria checklist for FEAT/CHG closure
- `docs/features/*.md`: feature/change scope contract
- `docs/features/*_PRECHECK.md`: pre-implementation risk and plan

## 6) Standard delivery workflow

### Step A - Scope contract
Create or update a feature/change doc:
- clear goal
- acceptance criteria
- edge cases
- impacted components
- required tests

If scope is unclear, do not code yet.

### Step B - Preflight
Use `docs/preflight_prompt` and produce `*_PRECHECK.md` including:
1. potential regressions
2. architecture drift risks
3. data model risks
4. implementation steps
5. concrete test scenarios

### Step C - Implementation
Use `docs/implement_prompt` as execution template:
- minimal changes outside impacted components
- no unapproved new dependencies/patterns
- update `DATA_MODEL` / `DECISIONS` only if truly required

### Step D - Validation
Follow `docs/TEST_STRATEGY.md`:
- run `npx tsc --noEmit`
- run feature tests
- run impacted regression tests
- report pass/fail/skip clearly

### Step E - Approval and docs finalization
After implementation and fixes are complete:
- ask for explicit user approval
- then update impacted docs

This is mandatory to avoid documenting rejected intermediate work.

### Step F - DoD closure
Before declaring work complete:
- validate against `docs/DEFINITION_OF_DONE.md`
- report DoD status in final summary
- close only when applicable DoD items are satisfied

## 7) Guardrails (anti-chaos rules)
1. Do not implement requirements that are not in the active feature/change doc.
2. Do not change architecture or add libraries without a decision record.
3. Do not mark work "done" while required tests are failing.
4. Do not hide migration/setup prerequisites in test reports.
5. Do not finalize docs before human approval of final behavior.

## 8) How to start a new feature
1. Create `docs/features/FEAT-XXXX.md` from template
2. Create `docs/features/FEAT-XXXX_PRECHECK.md`
3. Run implementation
4. Validate with `TEST_STRATEGY`
5. Get approval
6. Finalize docs

For changes on an existing feature, use `CHG-XXXX-FEAT-XXXX.md`.

## 9) Test strategy integration
Use `docs/TEST_STRATEGY.md` to answer:
- which tests are primary for this feature?
- which existing areas need regression tests?
- what is the minimum quality gate?
- how should results be reported?

This removes ad-hoc test selection and keeps quality consistent across contributors.

## 10) Migration and environment reality
Some features depend on DB migrations or environment setup.

Rule:
- include migration status in validation reports
- avoid claiming full validation if prerequisites are missing

Example:
- "Migration applied: `docs/db/<migration-file>.sql`"

## 11) Definition of success
This framework is successful when:
- delivery speed increases
- regression rate decreases
- docs and code stay synchronized
- contributors can onboard quickly and make predictable changes

## 12) When to update this guide
Update this guide when:
- workflow order changes
- approval policy changes
- test governance changes
- source-of-truth doc set changes
