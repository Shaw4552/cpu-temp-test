# CPU Temp Test: Post-Thermal Paste Application

> **Supporting Portfolio Project**
>
> This project documents an earlier Linux troubleshooting and hardware-validation exercise using repeatable thermal testing, Bash automation, sensor logging, and data comparison.

**System:** MacBookPro8,1 (Early 2011)
**Environment:** Linux Mint 21.3 + macOS Monterey (dual boot)
**Initial Test Date:** June 21, 2025
**Repository:** [github.com/Shaw4552/cpu-temp-test](https://github.com/Shaw4552/cpu-temp-test)

---

## Purpose

This project measures CPU temperatures and fan behavior after replacing thermal paste and performing basic hardware maintenance.

The goal was to validate whether the maintenance improved thermal performance and to document a repeatable Linux-based test process.

---

## System Specs

* **Model:** MacBookPro8,1 (2011)
* **CPU:** Intel Core i5-2415M
* **RAM:** 16 GB DDR3
* **Storage:** 512 GB SATA SSD
* **Thermal Paste:** Thermal Grizzly Kryonaut
* **Cooling Maintenance:** Heatsink cleaned and fan dusted

---

## Test Procedure

### 1. Idle Test

* System idled on the desktop for approximately 10 minutes.
* CPU temperature and fan behavior were recorded.

### 2. Load Test

A five-minute CPU stress test was performed:

```bash
stress --cpu 2 --timeout 300
```

Temperature data was recorded during the load period.

### 3. Cooldown Test

* Post-stress cooldown was monitored for approximately five minutes.
* Temperature recovery behavior was recorded.

---

## Tools Used

* `lm-sensors` — CPU temperature and fan data
* `stress` — CPU load generation
* `sensors` — hardware monitoring
* `cpu-temp-test.sh` — automated test collection
* `gnuplot` — result visualization
* Git — version control and test history

---

## Repository Structure

```text
cpu-temp-test/
├── cpu-temp-test.sh
├── plot-core-temps.sh
├── cpu-temp-test-results.md
├── TEST_LOG.md
├── charts/
├── archive/
│   └── cpu-temp-test_v1.sh
├── test-2025-06-21_16-09-38/
├── test-2025-06-22_cooling-pad-comparison/
└── README.md
```

The `archive/` directory preserves an earlier version of the testing script to document project progression.

---

## Initial Test Results

| Condition    |        Result | Notes                                             |
| ------------ | ------------: | ------------------------------------------------- |
| Idle         |      ~34–36°C | Approximately 10°C lower after repaste            |
| Under Load   |     Max ~85°C | Previously reached approximately 100°C            |
| Cooldown     |         <50°C | Returned toward idle range within about 5 minutes |
| Fan Behavior | 2000–6200 RPM | Responded to thermal load                         |

Observed during this test:

* no signs of thermal throttling
* lower operating temperatures after maintenance
* improved cooldown behavior

---

## Cooling Pad Comparison

A second test on June 22, 2025 compared the system with and without a Targus Chill Mat under similar test conditions.

| Condition     | With Pad | Without Pad |   Difference |
| ------------- | -------: | ----------: | -----------: |
| Idle Average  |   32.3°C |      35.1°C | ~2.8°C lower |
| Maximum Load  |   81.8°C |      85.7°C | ~3.9°C lower |
| Cooldown Time |   3m 40s |      4m 25s |  ~45s faster |

The cooling pad improved temperature margins across the measured test phases.

Raw logs and comparison data are retained in:

```text
test-2025-06-22_cooling-pad-comparison/
```

---

## Automation

The current `cpu-temp-test.sh` script supports comparison testing with:

```bash
./cpu-temp-test.sh --with-pad
```

or:

```bash
./cpu-temp-test.sh --without-pad
```

The script:

* validates required commands
* records idle temperature samples
* runs CPU load while collecting temperature data
* records cooldown samples
* stores results in the project directory
* appends a summary of the test run

---

## What This Project Demonstrates

* Linux system diagnostics
* Bash scripting
* hardware troubleshooting
* repeatable testing methodology
* sensor data collection
* result comparison
* basic data visualization
* Git-based project history
* technical documentation

---

## Project Progression

The initial version of this project used machine-specific storage paths and simpler sampling logic.

The current version retains the original test evidence while improving portability, repository hygiene, and the accuracy of load-phase data collection.
