#!/usr/bin/env bash
set -euo pipefail

# CPU Temp Test Script with Optional Cooling Pad Comparison
# Original project: 2025-06-22
# Updated for portability and correct load sampling

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMPARISON_DIR="$PROJECT_DIR/test-2025-06-22_cooling-pad-comparison"

USE_PAD=""
LABEL=""

case "${1:-}" in
    --with-pad)
        USE_PAD="with-pad"
        LABEL="With Cooling Pad"
        ;;
    --without-pad)
        USE_PAD="without-pad"
        LABEL="Without Cooling Pad"
        ;;
    *)
        echo "Usage: $0 --with-pad | --without-pad"
        exit 1
        ;;
esac

for command in sensors stress; do
    if ! command -v "$command" >/dev/null 2>&1; then
        echo "Error: required command '$command' is not installed."
        exit 1
    fi
done

mkdir -p "$COMPARISON_DIR"

LOG_IDLE="$COMPARISON_DIR/idle-$USE_PAD.txt"
LOG_LOAD="$COMPARISON_DIR/load-$USE_PAD.txt"
LOG_COOLDOWN="$COMPARISON_DIR/cooldown-$USE_PAD.txt"
SUMMARY_FILE="$COMPARISON_DIR/comparison-summary.md"

# Start each run with fresh phase logs.
: > "$LOG_IDLE"
: > "$LOG_LOAD"
: > "$LOG_COOLDOWN"

echo "Starting CPU test: $LABEL"

echo "Phase 1: IDLE sampling..."
for _ in {1..60}; do
    sensors >> "$LOG_IDLE"
    echo "---" >> "$LOG_IDLE"
    sleep 10
done

echo "Phase 2: LOAD sampling..."
stress --cpu 2 --timeout 300 &
STRESS_PID=$!

for _ in {1..30}; do
    sensors >> "$LOG_LOAD"
    echo "---" >> "$LOG_LOAD"
    sleep 10
done

wait "$STRESS_PID"

echo "Phase 3: COOLDOWN sampling..."
for _ in {1..30}; do
    sensors >> "$LOG_COOLDOWN"
    echo "---" >> "$LOG_COOLDOWN"
    sleep 10
done

{
    echo "### $LABEL Test - $(date)"
    echo "- Idle: $(basename "$LOG_IDLE")"
    echo "- Load: $(basename "$LOG_LOAD")"
    echo "- Cooldown: $(basename "$LOG_COOLDOWN")"
    echo
} >> "$SUMMARY_FILE"

echo "Test complete."
echo "Results saved under: $COMPARISON_DIR"
