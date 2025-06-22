#!/bin/bash

# 🧠 Extracts core temps from a sensors log and plots them with Gnuplot

# --- Config ---
INPUT_LOG="$1"
OUTDIR="charts"
BASENAME=$(basename "$INPUT_LOG" .txt)
TEMPFILE="${OUTDIR}/${BASENAME}-core-temps.txt"
GNUPLOT_SCRIPT="${OUTDIR}/${BASENAME}-plot.gp"
PNG_OUT="${OUTDIR}/${BASENAME}.png"

# --- Prep ---
mkdir -p "$OUTDIR"

# --- Extract Core Temps ---
grep "Core [01]:" "$INPUT_LOG" | awk '
  /Core 0:/ {core0 = substr($3,2,length($3)-4)}
  /Core 1:/ {
    core1 = substr($3,2,length($3)-4);
    print core0, core1
  }
' > "$TEMPFILE"

# --- Create Gnuplot Script ---
cat > "$GNUPLOT_SCRIPT" <<EOF
set terminal png size 800,600
set output '${PNG_OUT}'
set title "Core Temps: $(basename "$INPUT_LOG")"
set xlabel "Sample (10s intervals)"
set ylabel "Temperature (°C)"
set key left top
set grid
plot '${TEMPFILE}' using 0:1 with lines lw 2 title "Core 0", \
     '' using 0:2 with lines lw 2 title "Core 1"
EOF

# --- Plot ---
gnuplot "$GNUPLOT_SCRIPT"
echo "✅ Chart saved: $PNG_OUT"
