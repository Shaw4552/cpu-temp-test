# CPU Thermal Diagnostics — 2011 MacBook Pro

> Historical hardware troubleshooting and Linux diagnostics
> project, originally performed in June 2025.

## Project Overview

This project documents the investigation of overheating
on an Early 2011 MacBook Pro (MacBookPro8,1).

After experiencing excessive heat, I investigated the
system's cooling behavior, cleaned the cooling assembly,
replaced the thermal paste, and used Linux diagnostic
tools to evaluate temperatures under different workloads.

The project also includes a historical comparison using
a Targus Chill Mat cooling pad.

The original tests were conducted in June 2025.
The Bash automation was subsequently improved in
August 2026.

## System Environment

- Hardware: Apple MacBookPro8,1 (Early 2011)
- Processor: Intel Core i5-2415M
- Memory: 16 GB DDR3
- Storage: 512 GB SATA SSD
- Linux environment: Linux Mint 21.3
- Additional OS: macOS Monterey
- Thermal paste: Thermal Grizzly Kryonaut
- Cooling pad: Targus Chill Mat

## Original Problem

The MacBook Pro was experiencing overheating symptoms.

The objective was to investigate the thermal behavior,
perform cooling-system maintenance, and determine whether
the system operated more effectively afterward.

The historical repository does not contain a complete,
controlled pre-maintenance temperature baseline.

Consequently, the original overheating experience is
documented as the motivating symptom, while quantitative
post-maintenance results are reported separately.

## Troubleshooting Methodology

1. Identify the overheating symptoms.
2. Inspect the cooling system.
3. Clean the fan and heatsink.
4. Replace the thermal paste.
5. Collect temperature and fan readings using lm-sensors.
6. Apply CPU load using stress.
7. Observe cooldown behavior.
8. Compare cooling-pad configurations.
9. Document results and limitations.

## Tools

- Linux Mint
- Bash
- lm-sensors / sensors
- stress
- gnuplot
- Git and GitHub

## June 21, 2025 — Initial Test

The original Bash script collected:

- One idle temperature snapshot.
- Two load temperature snapshots.
- One cooldown temperature snapshot.

Recorded Intel CPU package temperatures:

| Phase | Recorded CPU package temperature |
|---|---|
| Idle | 62°C |
| Load | 69°C and 91°C |
| Cooldown | 56°C |

The maximum recorded CPU package temperature during
this test was 91°C.

These measurements were collected after cooling-system
maintenance and do not establish a verified
pre-maintenance improvement.

The available logs also do not independently establish
whether CPU thermal throttling occurred.

Source directory:

`test-2025-06-21_16-09-38/`

## June 22, 2025 — Cooling Pad Comparison

A historical comparison was performed using a
USB-powered Targus Chill Mat.

The surviving Intel CPU package readings include:

| Phase | Without pad | With pad |
|---|---|---|
| Idle, first reading | 62°C | 54°C |
| Load, first reading | 69°C | 80°C |
| Cooldown, first reading | 57°C | 49°C |

These values are individual recorded readings,
not phase averages or verified maximum temperatures.

### Historical Summary

The original comparison summary reported:

- 2.8°C lower average idle temperature.
- 3.9°C lower maximum load temperature.
- 45-second faster cooldown.

These historical summary values have not been
independently reproduced from the surviving Intel
CPU package measurements.

### Evidence Limitations

The preserved comparison logs contain unequal
numbers of CPU package samples:

| Phase | Without pad | With pad |
|---|---:|---:|
| Idle | 1 | 60 |
| Load | 1 | 30 |
| Cooldown | 1 | 30 |

The sample counts are not equivalent.

Environmental conditions, workload consistency,
and the original calculation methods have not been
fully established.

Therefore, the surviving records do not support
a definitive quantitative claim that the cooling
pad improved CPU performance under every condition.

Source directory:

`test-2025-06-22_cooling-pad-comparison/`

## Bash Automation

The archived script preserves the original 2025
testing approach:

`archive/cpu-temp-test_v1.sh`

The current script was improved in August 2026
to include:

- Script-relative paths.
- Dependency validation.
- Strict Bash error handling.
- Repeated sensor sampling.
- Cooling-pad condition arguments.

Example:

```bash
./cpu-temp-test.sh --with-pad
```

```bash
./cpu-temp-test.sh --without-pad
```

### Current Script Limitations

The current script writes to fixed condition-specific
filenames and overwrites previous logs for that
condition.

Its load sampling loop also runs alongside a
300-second stress process, so scheduling delays
could cause some samples to fall outside the
active stress period.

The script has not been presented as a
production-grade benchmarking framework.

Future improvements should include timestamped
run directories, workload verification, consistent
sampling intervals, and reproducible summary
calculations.

## What This Project Demonstrates

- Linux hardware diagnostics.
- CPU temperature and fan monitoring.
- Bash scripting and automation.
- Hardware maintenance and troubleshooting.
- CPU workload testing.
- Data collection and visualization.
- Evidence-based technical documentation.
- Recognition of testing limitations.
- Iterative improvement of diagnostic tooling.

## Project History

- June 21, 2025 — Initial thermal testing.
- June 22, 2025 — Cooling-pad comparison.
- June 23, 2025 — Documentation updates.
- August 15, 2026 — Script and documentation cleanup.

The original logs and archived script are retained
as historical evidence.

## Key Lesson

A successful troubleshooting process requires more
than making a hardware change.

It requires identifying the problem, collecting
reliable evidence, evaluating results, recognizing
limitations, and documenting the outcome accurately.

This project reflects both the original troubleshooting
work and the subsequent improvement of the
testing methodology.
