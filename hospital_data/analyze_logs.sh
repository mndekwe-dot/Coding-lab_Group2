#!/bin/bash
heart_rate_analyzer () {
	log_file="Coding-lab_Group2/hospital_data/active_logs/heart_rate.log"
	report_file="Coding-lab_Group2/hospital_data/reports/analysis_report.txt"
	if [ ! -f "$log_file" ]; then
		echo "log file not found"
	else 
		echo "Report for heart log generated on: $(date)" >> "$report_file"
		cut -d' ' -f3 "$log_file" | sort | uniq -c | awk '{print $2 " has: " $1 " entries"}' >> "$report_file"
		echo >> "$report_file"
		echo "Time stamp of the first entry: ">> "$report_file"
                head -n 1 "$log_file" | awk '{print $1, $2}' >> "$report_file"
                echo >> "$report_file"
                echo "Time stamp of the last entry: ">> "$report_file"
                tail -n 1 "$log_file" | awk '{print $1, $2}' >> "$report_file"
		echo "====================================================" >> "$report_file"
		echo "Report Generated successfully"
	fi
}

temp_analyzer () {
	log_file="Coding-lab_Group2/hospital_data/active_logs/temperature.log"
	report_file="Coding-lab_Group2/hospital_data/reports/analysis_report.txt"
        if [ ! -f "$log_file" ]; then
                echo "log file not found"
        else
		echo "Report for temperature log generated on: $(date)" >> "$report_file"
                cut -d' ' -f3 "$log_file" | sort | uniq -c | awk '{print $2 " has: " $1 " entries"}' >> "$report_file"
                echo >> "$report_file"
		echo "Time stamp of the first entry: ">> "$report_file"
                head -n 1 "$log_file" | awk '{print $1, $2}' >> "$report_file"
		echo >> "$report_file"
		echo "Time stamp of the last entry: ">> "$report_file"
                tail -n 1 "$log_file" | awk '{print $1, $2}' >> "$report_file"
		echo "====================================================" >> "$report_file"
		echo "Report Generated successfully"
	fi
}

water_usage_analyzer () {
        log_file="Coding-lab_Group2/hospital_data/active_logs/water_usage.log"
	report_file="Coding-lab_Group2/hospital_data/reports/analysis_report.txt"
        if [ ! -f "$log_file" ]; then
                echo "log file not found"
        else
		echo "Report for water usage log generated on: $(date)" >> "$report_file"
                cut -d' ' -f3 "$log_file" | sort | uniq -c | awk '{print $2 " has: " $1 " entries"}' >> "$report_file"
                echo >> "$report_file"
                echo "Time stamp of the first entry: ">> "$report_file"
                head -n 1 "$log_file" | awk '{print $1, $2}' >> "$report_file"
                echo >> "$report_file"
                echo "Time stamp of the last entry: ">> "$report_file"
                tail -n 1 "$log_file" | awk '{print $1, $2}' >> "$report_file"
		echo "====================================================" >> "$report_file"
		echo "Report Generated successfully"
        fi
}
while true; do
	echo "==================Menu================"
	echo "Select log file to analyze: "
	echo "1) Heart Rate (heart_rate.log)"
	echo "2) Temperature (temperature.log)"
	echo "3) Water Usage (water_usage.log)"
	echo "4) Exit"
	echo "======================================"
	read -p "Enter your choice: " choice
	
	case $choice in
		1) heart_rate_analyzer;;
		2) temp_analyzer;;
		3) water_usage_analyzer;;
		4)
			echo "Exiting......Good bye"
			break;;
		*) 
			echo "Please enter a number between 1-4"
	esac
done
