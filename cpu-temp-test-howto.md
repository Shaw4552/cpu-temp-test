📄 cpu-temp-test-howto.md
📁 Recommended path:
/path/to/cpu-temp-test/cpu-temp-test-howto.md

markdown
Copy
Edit
# 🧪 CPU Temp Test - How to Run

**System:** MacBookPro8,1
**User:** jshaw
**Location:** `/path/to/cpu-temp-test`
**Purpose:** Manually run a post-thermal-paste CPU temperature check using best practices.

---

## 📁 Script Overview

- **Script:** `cpu-temp-test.sh`
- **What it does:**
  1. Captures **idle temperatures**
  2. Runs a **5-minute stress test**
  3. Waits **5 minutes to cool down**
  4. Saves all output logs to a timestamped directory
  5. Generates a readable `summary.md`

---

## ▶️ How to Run

Open a terminal and run:

```bash
cd /path/to/cpu-temp-test
./cpu-temp-test.sh
📌 Make sure the script is executable. If not, run:

bash
Copy
Edit
chmod +x cpu-temp-test.sh
📂 Output Example
After a run, a new folder will be created:

swift
Copy
Edit
/path/to/cpu-temp-test/test-2025-06-21_15-30-00/
├── idle-temps.txt
├── load-temps.txt
├── cooldown-temps.txt
└── summary.md
Each log captures readings from the sensors tool for the respective phase.

🔧 Requirements
Ensure the following tools are installed:

bash
Copy
Edit
sudo apt install lm-sensors stress
Initialize sensors on first use:

bash
Copy
Edit
sudo sensors-detect
✅ Best Practices
Run with minimal background apps for more accurate idle readings.

Make sure fans are dust-free for reliable thermal performance.

Allow cooldown time after stress to measure passive dissipation.

Store logs on NAS for future reference and paste quality tracking.

Use consistent environmental conditions if comparing runs.

🧹 Optional Cleanup
To delete all test logs:

bash
Copy
Edit
rm -rf /path/to/cpu-temp-test/test-*/
🔒 Make sure you're deleting only test directories.

📅 Last Updated
June 21, 2025 by jshaw

yaml
Copy
Edit
