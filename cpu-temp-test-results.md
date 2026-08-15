# 🧪 CPU Temperature Test Results (Post-Thermal Paste)

**System:** MacBookPro8,1 (Linux Mint dual boot)  
**User:** jshaw  
**Test Date:** June 21, 2025  
**Project Path:** `/path/to/cpu-temp-test/`

---

## 🧰 Tools Used

- `sensors` (lm-sensors)
- `stress` (CPU stress testing)
- `uptime` (system load snapshot)
- Manual temperature logging across 3 phases

---

## 📊 Temperature Summary

| Phase      | Core 0 / Core 1 Temps | Package Temp | Fan Speed | Notes                |
|------------|------------------------|--------------|-----------|----------------------|
| **Idle**   | 49°C / 52°C            | 53°C         | ~1999 RPM | Before stress test   |
| **Load**   | 69°C / 69°C            | 69°C         | ~6067 RPM | During stress (5 min)|
| **Cooldown**| 53°C / 57°C           | 57°C         | ~1997 RPM | 5 mins after stress  |

🧊 **Thermal paste reapplication successful.** Temps are within safe operating limits with good recovery time.

---

## 🗂 Saved Logs

All logs are located in `/path/to/cpu-temp-test/`:

- `idle-temps.txt`
- `load-temps.txt`
- `cooldown-temps.txt`

---

## ✅ Observations

- Fan responds appropriately to load  
- No signs of throttling or instability  
- Ambient room temperature: [OPTIONAL: insert if measured]  
- Heatpipe/thermal compound reapplication appears effective

---

## 📌 Next Steps / To-Do

- [ ] Automate this test with a shell script  
- [ ] Create chart from logs (e.g., using gnuplot or LibreOffice Calc)  
- [ ] Add test to post-maintenance checklist

---

**Generated manually from live system observations.**
