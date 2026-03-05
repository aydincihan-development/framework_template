# Technical Decisions — <PROJECT_NAME>

This document records project-wide technical decisions.

These are default baseline decisions from the Finance Tracker framework.
Projects may change them, but any change should be recorded as a new decision entry.

## D-001 — Use Supabase for Auth and Database (Default)
- Status: Accepted
- Context: Need fast setup with built-in auth + managed Postgres.
- Decision: Use Supabase Auth and Supabase Postgres as default backend foundation.
- Consequences: Rapid delivery; managed infra dependency.

## D-002 — Use Next.js App Router as Web Framework (Default)
- Status: Accepted
- Context: Need full-stack capable React framework with strong DX.
- Decision: Use Next.js with App Router as default web framework.
- Consequences: Opinionated routing/runtime model.

## D-003 — Data Access Through `src/lib/db` Layer
- Status: Accepted
- Context: Raw queries scattered across UI reduce maintainability.
- Decision: Keep DB queries/functions in `src/lib/db`; UI consumes this layer.
- Consequences: Clear separation, easier refactor and testability.

## D-004 — Enforce User Data Isolation with RLS
- Status: Accepted
- Context: Multi-user application requires strong data isolation.
- Decision: Enable Row Level Security for user-owned tables.
- Consequences: Safer default access model; policy management required.

## D-005 — UI Platform Standard: MUI
- Status: Accepted
- Context: Multiple UI kits increase inconsistency and maintenance cost.
- Decision: Use MUI as the primary/exclusive UI component library.
- Consequences: Consistent UI language; dependency on MUI ecosystem.

## D-006 — Grid Standard: MUI X DataGrid
- Status: Accepted
- Context: List/CRUD views need reliable sorting/filter/pagination UX.
- Decision: Use MUI X DataGrid as default grid for tabular screens.
- Consequences: Less custom grid code; align test selectors with DataGrid UX.

## D-007 — Chart Standard: MUI X Charts
- Status: Accepted
- Context: Keep visual stack consistent with UI platform.
- Decision: Prefer MUI X Charts for new chart needs.
- Consequences: Fewer cross-library UI patterns.

## D-008 — Delivery Governance: Docs-Driven Flow
- Status: Accepted
- Context: AI-assisted development needs explicit controls to avoid chaos.
- Decision: Enforce Feature/CHG doc -> Precheck -> Implement -> Test Strategy -> DoD -> Approval -> Docs update flow.
- Consequences: Higher process discipline; predictable delivery and traceability.
