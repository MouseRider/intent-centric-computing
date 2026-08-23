#!/usr/bin/env bash
# Lightweight repository verification script
# Checks structure, internal cross-references, and source consistency.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ERRORS=0

err() { echo "ERROR: $1"; ((ERRORS++)); }
warn() { echo "WARN:  $1"; }

echo "=== Intent-Centric Computing — Repository Verification ==="
echo ""

# 1. Required files
echo "-- Checking required files --"
REQUIRED=(
  README.md MANIFESTO.md LICENSE CONTRIBUTING.md GOVERNANCE.md roadmap.md
  articles/linkedin-beyond-apps.md
  research/landscape.md research/sources.md research/conceptual-ladder.md
  design/philosophy.md design/architecture.md design/principles.md design/open-questions.md
  scripts/verify-repo.sh
)
for f in "${REQUIRED[@]}"; do
  if [[ ! -f "$ROOT/$f" ]]; then
    err "Missing: $f"
  fi
done

# 2. No empty placeholders
echo "-- Checking for unexpanded placeholders --"
for f in "${REQUIRED[@]}"; do
  [[ -f "$ROOT/$f" ]] || continue
  if grep -qi "^.*placeholder.*to be expanded\|^.*placeholder.*to be populated" "$ROOT/$f" 2>/dev/null && [[ "$f" != scripts/* ]]; then
    err "Unexpanded placeholder in $f"
  fi
done

# 3. All URLs in sources.md
echo "-- Checking URL consistency --"
URLS_IN_SOURCES=$(grep -oP 'https?://[^\s|)>]+' "$ROOT/research/sources.md" 2>/dev/null | sort -u)
for f in "$ROOT"/MANIFESTO.md "$ROOT"/articles/linkedin-beyond-apps.md "$ROOT"/research/landscape.md; do
  [[ -f "$f" ]] || continue
  while IFS= read -r url; do
    if ! echo "$URLS_IN_SOURCES" | grep -qF "$url"; then
      warn "URL in $(basename "$f") not in sources.md: $url"
    fi
  done < <(grep -oP 'https?://[^\s|)>]+' "$f" 2>/dev/null | sort -u)
done

# 4. No git remote
echo "-- Checking publishing state --"
if [[ -d "$ROOT/.git" ]]; then
  if git -C "$ROOT" remote 2>/dev/null | grep -q .; then
    err "Git remote configured — should not be published yet"
  fi
fi

# 5. Word counts
echo "-- Word counts --"
for f in MANIFESTO.md articles/linkedin-beyond-apps.md; do
  [[ -f "$ROOT/$f" ]] || continue
  WC=$(wc -w < "$ROOT/$f")
  echo "   $f: $WC words"
done

echo ""
if [[ $ERRORS -eq 0 ]]; then
  echo "OK — $ERRORS errors."
else
  echo "FAILED — $ERRORS error(s)."
  exit 1
fi
