set terminal png size 800,600
set output 'charts/idle-with-pad.png'
set title "Core Temps: idle-with-pad.txt"
set xlabel "Sample (10s intervals)"
set ylabel "Temperature (°C)"
set key left top
set grid
plot 'charts/idle-with-pad-core-temps.txt' using 0:1 with lines lw 2 title "Core 0",      '' using 0:2 with lines lw 2 title "Core 1"
