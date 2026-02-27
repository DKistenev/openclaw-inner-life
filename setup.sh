#!/usr/bin/env bash
# openclaw-inner-life: Full pack installer
# Usage: bash setup.sh [workspace_dir]

set -euo pipefail

echo ""
echo "  ┌─────────────────────────────────┐"
echo "  │   openclaw-inner-life installer  │"
echo "  │   Give your agent an inner life  │"
echo "  └─────────────────────────────────┘"
echo ""

# Check prerequisites
command -v jq >/dev/null 2>&1 || { echo "ERROR: jq is required. Install with: apt install jq"; exit 1; }
command -v clawhub >/dev/null 2>&1 || { echo "ERROR: clawhub CLI required. See: docs.openclaw.ai/tools/clawhub"; exit 1; }

SKILLS=(
  "inner-life-core"
  "inner-life-reflect"
  "inner-life-memory"
  "inner-life-dream"
  "inner-life-chronicle"
  "inner-life-evolve"
)

echo "Installing ${#SKILLS[@]} skills..."
echo ""

for skill in "${SKILLS[@]}"; do
  echo "  → $skill"
  clawhub install "$skill" 2>/dev/null || echo "    (retry if timeout)"
done

echo ""
echo "Initializing state files..."

# Find the core skill's init script
INIT_SCRIPT=""
for dir in \
  "$HOME/.openclaw/workspace/skills/inner-life-core/scripts/init.sh" \
  "$HOME/.openclaw/skills/inner-life-core/scripts/init.sh" \
  "./skills/inner-life-core/scripts/init.sh"; do
  if [ -f "$dir" ]; then
    INIT_SCRIPT="$dir"
    break
  fi
done

if [ -n "$INIT_SCRIPT" ]; then
  bash "$INIT_SCRIPT" "${1:-}"
else
  echo "  WARNING: Could not find init.sh. Run manually after install:"
  echo "  bash skills/inner-life-core/scripts/init.sh"
fi

echo ""
echo "Done! Your agent now has an inner life."
echo ""
echo "Recommended cron setup:"
echo "  Brain Loop     — 3x/day         — full 9-step BRAIN protocol"
echo "  Evening Session — once/day       — reflection + chronicle + dreams"
echo "  Evolver        — 2x/week        — self-evolution proposals"
echo ""
echo "See docs/cron-templates.md for details."
echo ""
