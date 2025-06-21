pu-temp-test
markdown
Copy
Edit
# CPU Temp Test: Post-Thermal Paste Application

This project documents temperature testing of a MacBookPro8,1 (early 2011) running dual-boot Linux Mint and macOS Monterey, **after replacing the thermal paste**, upgrading the SSD and RAM.

The goal is to validate thermal improvements and long-term cooling performance using standard tools and best practices under Linux.

---

## 📋 System Info

- **Model:** MacBookPro8,1
- **CPU:** Intel Core i5 (2nd Gen)
- **RAM:** 16GB DDR3
- **SSD:** 512GB SATA III
- **OS:** Linux Mint 21.3 / macOS Monterey (dual boot)
- **Cooling:** Fresh Arctic MX-4 thermal paste applied, fan and heatsink cleaned

---

## 🧪 Test Methodology

### 1. Idle Test
- System booted and left idle on desktop for 10–15 minutes
- Logged CPU temps and fan speed every 10 seconds

### 2. Load Test
- Stress test using `stress` or `stress-ng`
- CPU usage pegged at 100% for 10–15 minutes
- Logged temperatures and fan RPM throughout

### 3. Cooldown Test
- Monitored system after stress test to observe cooldown behavior

---

## 🛠 Tools Used

- `lm-sensors`
- `psensor` (optional GUI)
- `stress` / `stress-ng`
- `watch sensors`
- `rsync` (for backing up data to NAS)

---

## 📁 Project Folder Structure

cpu-temp-test/
├── README.md # This file
├── cpu_temp_test.sh # Bash script to log and test temps
├── cpu_temp_log.csv # Logged output from tests
├── idle_temps.txt # Baseline temps at idle
├── results/
│ ├── stress_2025-06-21.csv # Timestamped test result
│ └── notes.md # Observations and interpretation

yaml
Copy
Edit

---

## ✅ Outcome & Observations

> _(To be filled in after testing)_  
- Idle temps improved by X°C  
- Max load temps sustained at Y°C (previously Z°C)  
- Fan RPM response quicker/slower  
- No thermal throttling detected

---

## 📦 Backup & Location

This project is stored on a NAS for long-term access:
/mnt/nas/Projects/cpu-temp-test/

yaml
Copy
Edit

Auto-mounted via `/etc/fstab` using secure credentials.

---

## 📅 Maintainer

**User:** jshaw  
**Machine:** devbox-mint  
**Date of test:** June 2025  
