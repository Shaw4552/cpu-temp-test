# 🧪 CPU Temp Test: Post-Thermal Paste Application

**Author:** jshaw  
**System:** MacBookPro8,1 (Early 2011)  
**Environment:** Linux Mint 21.3 + macOS Monterey (dual boot)  
**Test Date:** June 21, 2025  
**Repository:** [github.com/Shaw4552/cpu-temp-test](https://github.com/Shaw4552/cpu-temp-test)

---

## 🎯 Purpose

This project benchmarks CPU temperatures and fan behavior **after replacing thermal paste** (Thermal Grizzly Kryonaut) and upgrading the SSD and RAM. It validates cooling performance and documents a repeatable Linux-based testing method.

---

## 🖥 System Specs

- **Model:** MacBookPro8,1 (2011)
- **CPU:** Intel Core i5-2415M (2 cores, 4 threads)
- **RAM:** 16 GB DDR3
- **Storage:** 512 GB SATA SSD
- **Thermal Paste:** 🔥 *Thermal Grizzly Kryonaut* (applied 2025-06-21)
- **Cooling Maintenance:** Heatsink cleaned, fan dusted

---

## 📊 Test Procedure

### 1. 💤 Idle Test
- System idled on desktop ~10 minutes
- CPU temps and fan RPM logged every 10 seconds

### 2. 🔥 Load Test
- 5-minute stress test:
  ```bash
  stress --cpu 2 --timeout 300
Temps and fan speed recorded throughout

3. ❄️ Cooldown Test
Post-stress cooldown monitored for ~5 minutes

Logged temperature recovery behavior

🔧 Tools Used
lm-sensors: temperature + fan data

stress: CPU stress testing

watch sensors: live monitoring

cpu-temp-test.sh: automation script

rsync: backup to NAS

📁 Folder Structure

cpu-temp-test/
├── cpu-temp-test.sh              # Automation script
├── cpu-temp-test-results.md     # Markdown summary of results
├── TEST_LOG.md                  # Rolling log of test runs
├── test-2025-06-21_16-09-38/    # Timestamped output folder
│   ├── idle-temps.txt
│   ├── load-temps.txt
│   ├── cooldown-temps.txt
│   └── results-summary.md
└── README.md                    # This file
✅ Observations (Post-Test Summary)
Condition	Temperature (°C)	Notes
Idle	~34–36°C	Improved ~10°C after repaste
Under Load	Max ~85°C	Previously reached ~100°C
Cooldown	Stabilized <50°C	Returned to idle in under 5 minutes
Fan Behavior	2000–6200 RPM	Responsive to thermal load

✅ No signs of thermal throttling

✅ System is quieter and cooler during daily use

📦 Backup & Access
Project stored at:


/mnt/FreeCloud41/Projects/cpu-temp-test/
Auto-mounted via /etc/fstab using x-systemd.automount
Credentials secured in: /etc/samba/credentials-mycloud

🗂 Git Version Control
This project is versioned with Git:

git init
git remote add origin git@github.com:Shaw4552/cpu-temp-test.git
git add .
git commit -m "Initial commit"
git push -u origin main
🚀 Next Steps & Enhancements
📈 Add visual graphs via gnuplot or matplotlib

🛠 Wrap into CLI utility

📨 Add test-complete notifications (email/desktop)

📊 Monthly thermal monitoring + trend tracking

🌐 Showcase & Promote
This project highlights:

🧰 Linux system diagnostics

⚙️ Bash scripting & automation

📉 Data logging & interpretation

📁 Git + Markdown documentation workflows

🟢 Recommended: Share on LinkedIn, add to your résumé/portfolio, and link in job applications.

Maintainer: jshaw
Machine: devbox-mint
Repository: github.com/Shaw4552/cpu-temp-test

yaml


---

### ✅ Next Git Steps (run this in your project folder):

```bash
git add README.md
git commit -m "Finalized and polished README.md"
git push
🔗 Optional: LinkedIn Post Template
Would you like me to draft a short, polished LinkedIn post next? Something like:

"Just completed a full thermal optimization test on my 2011 MacBook Pro running Linux Mint! Using Bash scripting, stress testing tools, and lm-sensors, I benchmarked CPU cooling performance before and after applying new thermal paste. The results were impressive — temps dropped by 10°C at idle and 15°C under load. Full project here: [GitHub repo]"

Let me know and I’ll write it for you.
