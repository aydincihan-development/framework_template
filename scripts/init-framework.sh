#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat <<'EOF'
Usage:
  ./scripts/init-framework.sh "<PROJECT_NAME>"

Example:
  ./scripts/init-framework.sh "Acme Budget App"
EOF
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

if [[ $# -lt 1 ]]; then
  echo "Error: PROJECT_NAME is required."
  usage
  exit 1
fi

PROJECT_NAME="$1"
DOCS_DIR="$ROOT_DIR/docs"
FEATURES_DIR="$DOCS_DIR/features"

replace_placeholder() {
  local file="$1"
  if [[ -f "$file" ]]; then
    sed -i "s/<PROJECT_NAME>/${PROJECT_NAME//\//\\/}/g" "$file"
  fi
}

echo "Initializing framework for project: $PROJECT_NAME"

replace_placeholder "$DOCS_DIR/PRD.md"
replace_placeholder "$DOCS_DIR/ARCHITECTURE.md"
replace_placeholder "$DOCS_DIR/DATA_MODEL.md"
replace_placeholder "$DOCS_DIR/DECISIONS.md"

if [[ ! -f "$FEATURES_DIR/FEAT-0001.md" ]]; then
  cp "$FEATURES_DIR/_TEMPLATE.md" "$FEATURES_DIR/FEAT-0001.md"
  sed -i "s/FEAT-000X/FEAT-0001/g" "$FEATURES_DIR/FEAT-0001.md"
  sed -i "s/Title/Initial Feature/g" "$FEATURES_DIR/FEAT-0001.md"
fi

if [[ ! -f "$FEATURES_DIR/FEAT-0001_PRECHECK.md" ]]; then
  cat > "$FEATURES_DIR/FEAT-0001_PRECHECK.md" <<'EOF'
# FEAT-0001 PRECHECK

1) Potential regressions with existing features
- N/A (first feature) / fill as needed

2) Architectural drift risks (violations of decisions)
- Fill based on docs/DECISIONS.md

3) Data model drift risks
- Fill based on docs/DATA_MODEL.md

4) Implementation plan (steps)
1. ...
2. ...
3. ...

5) Test plan (T-1 and T-2) with concrete scenarios
- T-1:
- T-2:
EOF
fi

echo "Done."
echo "Next steps:"
echo "1) Fill docs/PRD.md, docs/ARCHITECTURE.md, docs/DATA_MODEL.md, docs/DECISIONS.md"
echo "2) Update docs/features/FEAT-0001.md scope and tests"
echo "3) Start implementation using docs/preflight_prompt and docs/implement_prompt"
