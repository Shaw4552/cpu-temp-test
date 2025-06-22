set terminal png size 800,600
set output 'idle-core-temps.png'
set title "Idle CPU Core Temps – With Cooling Pad"
set xlabel "Sample Number (1 = 10s)"
set ylabel "Temperature (°C)"
set key left top
set grid
plot 'test-2025-06-22_cooling-pad-comparison/idle-core-temps.txt' using 0:1 with lines lw 2 title "Core 0", \
     '' using 0:2 with lines lw 2 title "Core 1"
