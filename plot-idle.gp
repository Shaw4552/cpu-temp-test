set terminal png size 800,600
set output 'idle-with-pad.png'
set title "Idle Temps - With Cooling Pad"
set xlabel "Time (10s intervals)"
set ylabel "CPU Temperature (°C)"
plot 'test-2025-06-22_cooling-pad-comparison/idle-with-pad.txt' using 0:1 with lines title "Core Temp"
