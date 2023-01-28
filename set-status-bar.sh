#!/bin/bash

while true; do
	# Get the total amount of memory in the system
	total=$(free | awk '/Mem:/ {print $2}')
	
	# Get the amount of used memory
	used=$(free | awk '/Mem:/ {print $3}')
	
	# Calculate the percentage of used memory
	percentageMem=$((used * 100 / total))    

	# Get the battery percentage
	battery_percentage=$(acpi | grep -o "[0-9]*%" | tr -d %)

	time=$(date +%T)
    cpuUsage=$(vmstat 1 2 | tail -1 | awk '{print "CPU: " 100 - $15 "%"}')
	# Set the status bar text
	xsetroot -name "$cpuUsage | Mem: $percentageMem% | $time | Battery: $battery_percentage%"
	sleep 5
done
