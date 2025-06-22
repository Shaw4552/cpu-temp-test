#!/bin/bash

# CPU Temp Test Script with Optional Cooling Pad Comparison
# Author: jshaw | Updated: 2025-06-22

PROJECT_DIR="/mnt/FreeCloud41/Projects/cpu-temp-test"
COMPARISON_DIR="$PROJECT_DIR/test-2025-06-22_cooling-pad-comparison"
USE_PAD=""
LABEL=""
SUMMARY_FILE="$COMPARISON_DIR/comparison-summary.md"

# Handle arguments
if [[ "$1" == "--with-pad" ]]; then
    USE_PAD="with-pad"
    LABEL="With Cooling Pad"
elif [[ "$1" == "--without-pad" ]]; then
    USE_PAD="without-pad"
    LABEL="Without Cooling Pad"
else
    echo "Usage: $0 --with-pad | --without-pad"
    exit 1
fi

echo "🧪 Starting CPU test: $LABEL"
LOG_IDLE="$COMPARISON_DIR/idle-$USE_PAD.txt"
LOG_LOAD="$COMPARISON_DIR/load-$USE_PAD.txt"
LOG_COOLDOWN="$COMPARISON_DIR/cooldown-$USE_PAD.txt"

# Phase 1: Idle
echo "📥 Phase 1: IDLE temp snapshot..."
for i in {1..60}; do
    sensors >> "$LOG_IDLE"
    echo "---" >> "$LOG_IDLE"
    sleep 10
done

# Phase 2: Load
echo "🔥 Phase 2: LOAD test (5 mins)..."
stress --cpu 2 --timeout 300
for i in {1..30}; do
    sensors >> "$LOG_LOAD"
    echo "---" >> "$LOG_LOAD"
    sleep 10
done

# Phase 3: Cooldown
echo "❄️ Phase 3: COOLDOWN (5 mins)..."
for i in {1..30}; do
    sensors >> "$LOG_COOLDOWN"
    echo "---" >> "$LOG_COOLDOWN"
    sleep 10
done

# Append results summary
echo "✅ Logging summary to: $SUMMARY_FILE"
{
    echo "### $LABEL Test - $(date)"
    echo "- Idle:    $LOG_IDLE"
    echo "- Load:    $LOG_LOAD"
    echo "- Cooldown:$LOG_COOLDOWN"
    echo ""
} >> "$SUMMARY_FILE"

echo "✅ Test complete."

