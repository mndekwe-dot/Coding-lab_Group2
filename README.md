Hospital Monitoring System
Overview
This project manages log files for hospital monitoring devices. It simulates three types of equipment: heart rate monitors, temperature sensors, and water meters that continuously generate data. The system provides two bash scripts to archive old logs and analyze device statistics, preventing files from growing too large while helping staff quickly understand device performance without manually reading thousands of entries.
Quick Setup
# Clone and navigate
git clone https://github.com/yourusername/Coding-lab_Group2.git
cd Coding-lab_Group2

# Create directories
mkdir -p hospital_data/{active_logs,archives/{heart_data_archive,temperature_data_archive,water_data_archive},reports}

# Make scripts executable
chmod +x archive_logs.sh analyze_logs.sh

# Start simulators in separate terminals
python3 heart_monitor.py start
python3 temp_sensor.py start
python3 water_meter.py start

Directory Structure
hospital_data/
├── active_logs/          # Current device data
├── archives/             # Historical data with timestamps
└── reports/              # Analysis summaries

Task 1: Archive Logs (archive_logs.sh)
This script rotates log files to prevent unlimited growth. When run, it displays a menu to select which log to archive (heart rate, temperature, or water usage). The script then validates the file exists, creates the archive directory if needed, moves the log with a timestamp like heart_rate_2024-06-18_15:22:10.log, and creates a fresh empty log for continued monitoring.
./archive_logs.sh
# Select: 1) Heart Rate, 2) Temperature, or 3) Water Usage

Key operations: Validates input, checks file existence with [[ -f ]], creates directories with mkdir -p, generates timestamps with date, moves files with mv, and creates new logs with touch. Includes error handling for invalid choices, missing files, and permission issues.
Task 2: Analyze Logs (analyze_logs.sh)
This script generates statistical reports from log files. It presents a menu to select which log to analyze, then counts how many entries each device recorded using grep and wc -l, extracts first and last timestamps with head/tail and awk, and appends formatted results to reports/analysis_report.txt using echo and >> redirection.
./analyze_logs.sh
# Select: 1) Heart Rate, 2) Temperature, or 3) Water Usage

Sample output:
=== Analysis Report ===
Date: 2024-06-18 15:30:00
Log File: heart_rate.log

Monitor_1: 150 entries (First: 08:00:00, Last: 15:22:10)
Monitor_2: 148 entries (First: 08:00:05, Last: 15:22:15)
Total: 298 entries

Daily Workflow Example
# Morning: Check overnight data
tail -f hospital_data/active_logs/heart_rate.log

# Analyze all logs
./analyze_logs.sh  # Run three times for each log type

# View reports
cat hospital_data/reports/analysis_report.txt

# End of day: Archive logs
./archive_logs.sh  # Run three times to archive all logs

Commands Reference
Archival: date, mv, touch, mkdir, case, test
 Analysis: awk, grep, wc, head, tail, echo, >>
Troubleshooting
# Scripts won't run
chmod +x *.sh

# Simulators won't start
chmod +x *.py

# Missing directories
mkdir -p hospital_data/active_logs

Project Files
archive_logs.sh - Log rotation script
analyze_logs.sh - Statistical analysis script
heart_monitor.py - Heart rate simulator
temp_sensor.py - Temperature simulator
water_meter.py - Water meter simulator
README.md - This documentation
