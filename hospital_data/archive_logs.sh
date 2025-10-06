#!/bin/bash

echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"

read -p "Enter choice (1-3): " choice

case $choice in
    1)
        log_file="hospital_data/active_logs/heart_rate.log"
        archive_dir="hospital_data/heart_data_archive"
        ;;
    2)
        log_file="hospital_data/active_logs/temperature.log"
        archive_dir="hospital_data/temperature_data_archive"
        ;;
    3)
        log_file="hospital_data/active_logs/water_usage.log"
        archive_dir="hospital_data/water_usage_archive"
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac

if [ ! -f "$log_file" ]; then
    echo "Log file $log_file not found!"
    exit 1
fi

if [ ! -d "$archive_dir" ]; then
    echo "Archive directory $archive_dir does not exist. Creating it..."
    mkdir -p "$archive_dir"
fi

timestamp=$(date +%F_%H-%M-%S)
base_name=$(basename "$log_file" .log)
mv "$log_file" "$archive_dir/${base_name}_${timestamp}.log"
touch "$log_file"

echo "Successfully archived to $archive_dir/${base_name}_${timestamp}.log"

