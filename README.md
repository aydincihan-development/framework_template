# AI-Driven Development Framework Template

This folder is a reusable starter for controlled human + AI software development.

## Quick Start
1. Copy this folder into your new repository root.
2. Run bootstrap script:
   ```bash
   ./scripts/init-framework.sh "<PROJECT_NAME>"
   ```
3. Fill baseline documents before coding:
   - `docs/PRD.md`
   - `docs/ARCHITECTURE.md`
   - `docs/DATA_MODEL.md`
   - `docs/DECISIONS.md`
4. Follow:
   - `docs/AI_RULES.md`
   - `docs/preflight_prompt`
   - `docs/implement_prompt`
   - `docs/TEST_STRATEGY.md`
   - `docs/DEFINITION_OF_DONE.md`

## What is included
- Process rules (`AI_RULES`)
- Delivery prompts (`preflight_prompt`, `implement_prompt`)
- Test governance (`TEST_STRATEGY`)
- Completion checklist (`DEFINITION_OF_DONE`)
- Feature template (`docs/features/_TEMPLATE.md`)
- Framework usage guide (`USER_GUIDE`)
- Baseline architecture/product/data/decision templates

## Recommended first adaptation
- Update naming conventions for your domain in `docs/features/_TEMPLATE.md`
- Replace sample test mappings in `docs/TEST_STRATEGY.md` with your actual test files
