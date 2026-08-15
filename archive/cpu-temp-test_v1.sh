#!/bin/bash

# =============================================
# 🧪 CPU Temp Test Script with Markdown Summary
# Author: jshaw
# System: MacBookPro8,1 - Linux Mint
# =============================================

PROJECT_DIR="/mnt/FreeCloud41/Projects/cpu-temp-test"
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
LOG_DIR="$PROJECT_DIR/test-$TIMESTAMP"
mkdir -p "$LOG_DIR"

echo "📥 Phase 1: IDLE temp snapshot..."
echo "--- IDLE ---" > "$LOG_DIR/idle-temps.txt"
uptime >> "$LOG_DIR/idle-temps.txt"
sensors >> "$LOG_DIR/idle-temps.txt"
sleep 2

echo "🔥 Phase 2: LOAD test (5 mins)..."
echo "--- LOAD ---" > "$LOG_DIR/load-temps.txt"
uptime >> "$LOG_DIR/load-temps.txt"
stress --cpu 2 --timeout 300 &  # 5 minutes
STRESS_PID=$!

echo "[START of stress]" >> "$LOG_DIR/load-temps.txt"
sensors >> "$LOG_DIR/load-temps.txt"
wait $STRESS_PID
echo "[END of stress]" >> "$LOG_DIR/load-temps.txt"
sensors >> "$LOG_DIR/load-temps.txt"

echo "❄️ Phase 3: COOLDOWN (5 mins)..."
sleep 300
echo "--- COOLDOWN ---" > "$LOG_DIR/cooldown-temps.txt"
uptime >> "$LOG_DIR/cooldown-temps.txt"
sensors >> "$LOG_DIR/cooldown-temps.txt"

# 📝 Auto-generate Markdown summary
SUMMARY_FILE="$LOG_DIR/summary.md"
cat > "$SUMMARY_FILE" <<EOF
# 🧪 CPU Temperature Test Summary

**System:** MacBookPro8,1  
**User:** jshaw  
**Date:** $(date)  
**Test ID:** $TIMESTAMP

---

## 📊 Temperature Phases

| Phase    | Source File         | Notes              |
|----------|---------------------|---------------------|
| Idle     | \`idle-temps.txt\`   | Before stress test  |
| Load     | \`load-temps.txt\`   | During stress (5m)  |
| Cooldown | \`cooldown-temps.txt\` | 5m after stress     |

---

## ✅ Files Saved

- $LOG_DIR/idle-temps.txt  
- $LOG_DIR/load-temps.txt  
- $LOG_DIR/cooldown-temps.txt  
- $LOG_DIR/summary.md  

All data saved under:  
\`$LOG_DIR\`

EOF

echo "✅ Test complete. Summary written to:"
echo "$SUMMARY_FILE"
