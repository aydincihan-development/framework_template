# Database Migrations Guide

Use this folder to store SQL migration files referenced by features/changes.

Recommended naming:
- `001-<initial-schema>.sql`
- `002-<next-change>.sql`

Rules:
- Every schema change must be linked from the related `FEAT/CHG` doc.
- Validation reports must include migration status (applied / not applied).
- Keep migrations additive and reviewable.
