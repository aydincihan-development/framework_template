# Architecture — <PROJECT_NAME>

## 1) System Overview 
- Frontend: Next.js (App Router)
- Backend services: Supabase (Auth + Postgres)
- UI platform: MUI
- Grid standard: MUI X DataGrid
- Chart standard: MUI X Charts

If your new project needs different choices, add/update entries in `docs/DECISIONS.md`.

## 2) Runtime Components
- Web application (Next.js)
- Auth provider (default: Supabase Auth)
- Data store (default: Supabase Postgres)
- RLS/access policies for user-owned data

## 3) Layer Boundaries
- UI layer: `src/app`, `src/components`
- Domain layer: `src/lib/domain`
- Data access layer: `src/lib/db`

Rule:
- Keep raw queries inside data-access layer; do not scatter data calls across UI files.

## 4) Security and Access
- Identity from auth provider
- User-scoped data ownership via `user_id` (or equivalent)
- RLS (or equivalent access control) required for user-owned tables

## 5) Delivery Architecture
Each feature/change follows:
1. Scope doc (`docs/features/*.md`)
2. Precheck (`*_PRECHECK.md`)
3. Implementation
4. Validation (`docs/TEST_STRATEGY.md`)
5. Closure (`docs/DEFINITION_OF_DONE.md`)

## 6) Deployment Model
- App hosting: Vercel (default) or equivalent
- Backend hosting: managed DB/Auth provider
- Environment managed with `.env.local` and deployment env vars

## 7) Scalability Considerations
- Index for ownership + common sort/filter fields
- Prefer server-side pagination/filtering for large lists
- Move heavy aggregations to DB-side queries when needed
