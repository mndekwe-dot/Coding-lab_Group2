#!/bin/bash
# code below prints text in which the user will have to choose a monitor from.
echo "Select log to archive:"
echo "1) Heart Rate"
echo "2) Temperature"
echo "3) Water Usage"

read -p "Enter choice (1-3): " choice # This code  reads the user input choice.

# this reads the user input and returns the archive_dir corresponding to what choice is made,and if no choice is made, it returns an invalid choice and exits 

case $choice in 
    1)
        log_file="active_logs/heart_rate.log"
        archive_dir="archived_logs/heart_data_archive"
        ;;
    2)
        log_file="active_logs/temperature.log"
        archive_dir="archived_logs/temperature_data_archive"
        ;;
    3)
        log_file="active_logs/water_usage.log"
        archive_dir="archived_logs/water_usage_archive"
        ;;
    *)
        echo "Invalid choice!"
        exit 1
        ;;
esac

#if statement checks if no log  found and exit

if [ ! -f "$log_file" ]; then
    echo "Log file $log_file not found!"
    exit 1
fi
#if statement check if no directory found and if not, it create new one.

if [ ! -d "$archive_dir" ]; then
    echo "Archive directory $archive_dir does not exist. Creating it..."
    mkdir -p "$archive_dir"
fi

timestamp=$(date +%F_%H-%M-%S) #this specify format of time we want
base_name=$(basename "$log_file" .log) 
mv "$log_file" "$archive_dir/${base_name}_${timestamp}.log"
touch "$log_file"

echo "Successfully archived to $archive_dir/${base_name}_${timestamp}.log"
