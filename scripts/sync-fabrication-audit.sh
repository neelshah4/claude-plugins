#!/bin/sh
# sync-fabrication-audit.sh — keep the bundled copies of fabrication-audit aligned
# with the canonical repo. Run before tagging any release.
#
# Canonical:  claude-fabrication-audit/skills/fabrication-audit/SKILL.md
# Bundlers:   claude-grant-reviewer, claude-icu-clinical-consult, claude-citation-verification
#
# Usage:
#   sync-fabrication-audit.sh check   report drift, change nothing (default)
#   sync-fabrication-audit.sh apply   copy canonical over each bundled copy
#
# Exits 1 on drift in check mode, so CI can gate a release on it.

set -e

MODE="${1:-check}"
ROOT="${SYNC_ROOT:-$(cd "$(dirname "$0")/../.." && pwd)}"
CANON="$ROOT/claude-fabrication-audit/skills/fabrication-audit/SKILL.md"
BUNDLERS="claude-grant-reviewer claude-icu-clinical-consult claude-citation-verification"

if [ ! -f "$CANON" ]; then
  echo "FATAL: canonical copy not found at $CANON" >&2
  echo "Set SYNC_ROOT to the directory holding all six repos." >&2
  exit 2
fi

CANON_SUM=$(shasum -a 256 "$CANON" | cut -d' ' -f1)
echo "canonical $CANON_SUM"

DRIFT=0
FOUND=0
for b in $BUNDLERS; do
  TARGET="$ROOT/$b/skills/fabrication-audit/SKILL.md"
  if [ ! -f "$TARGET" ]; then
    echo "  MISSING  $b (repo not checked out beside canonical)" >&2
    continue
  fi
  FOUND=$((FOUND + 1))
  SUM=$(shasum -a 256 "$TARGET" | cut -d' ' -f1)
  if [ "$SUM" = "$CANON_SUM" ]; then
    echo "  ok       $b"
  elif [ "$MODE" = "apply" ]; then
    cp "$CANON" "$TARGET"
    echo "  SYNCED   $b"
  else
    echo "  DRIFT    $b  ($SUM)"
    DRIFT=$((DRIFT + 1))
  fi
done

if [ "$FOUND" -eq 0 ]; then
  echo "FATAL: no bundler repos found beside canonical — nothing was checked." >&2
  exit 2
fi

if [ "$DRIFT" -gt 0 ]; then
  echo "$DRIFT of $FOUND bundled copies have drifted. Run '$0 apply' to fix." >&2
  exit 1
fi

echo "all $FOUND bundled copies match canonical"
