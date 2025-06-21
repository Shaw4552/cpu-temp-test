# CPU Temperature Testing Procedure  
_Post Thermal Paste Application_  

**Date:** [Insert Date]  
**System:** MacBookPro8,1 running Linux Mint  
**Project Folder:** `/mnt/FreeCloud41/Projects/cpu-temp-test/`

---

## Purpose

To measure and document CPU temperatures under idle, load, and cooldown states after applying fresh thermal paste, following best practices for accuracy and reproducibility.

---

## Prerequisites

- `lm-sensors` installed (`sudo apt install lm-sensors`)  
- `stress` installed (`sudo apt install stress`)  
- Proper sensor detection configured (`sudo sensors-detect`)  
- Mounted NAS folder accessible with write permissions  

---

## Testing Steps

### 1. Prepare and Verify Sensors

Run the following and confirm temperature sensors output:

```bash
sensors
2. Record Idle Temperatures
Make sure the system is idle (minimal CPU activity). Then run:

bash
Copy
Edit
sensors > /mnt/FreeCloud41/Projects/cpu-temp-test/idle-temps.txt
uptime >> /mnt/FreeCloud41/Projects/cpu-temp-test/idle-temps.txt
3. Run CPU Stress Test
Run a 5-minute stress test on 2 CPU cores:

bash
Copy
Edit
stress --cpu 2 --timeout 300
Open another terminal to monitor temps live (optional):

bash
Copy
Edit
watch -n 2 sensors
4. Record Load Temperatures
Immediately after the stress test finishes:

bash
Copy
Edit
sensors > /mnt/FreeCloud41/Projects/cpu-temp-test/load-temps.txt
uptime >> /mnt/FreeCloud41/Projects/cpu-temp-test/load-temps.txt
5. Cooldown Period
Wait 5 minutes to allow CPU to cool down. Then record cooldown temps:

bash
Copy
Edit
sensors > /mnt/FreeCloud41/Projects/cpu-temp-test/cooldown-temps.txt
uptime >> /mnt/FreeCloud41/Projects/cpu-temp-test/cooldown-temps.txt
Notes
Ensure no other heavy processes are running during tests for accuracy

Use consistent ambient temperature if possible

All output files are saved in the project directory on NAS for later review

Optional Improvements
Automate testing and logging via bash script

Add timestamped logs for better time tracking

Use graphical tools for temperature visualization

End of Procedure

yaml
Copy
Edit
