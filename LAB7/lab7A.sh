#!/bin/bash
# Shell Script for Monitoring Memory Usage
# Usage: ./memory_monitor.sh
# Function to display memory usage
display_memory_usage() {
    echo "Current Memory Usage:"
    free -h
    echo ""
}

# Function to monitor and log memory usage every 10 seconds into memory_log.txt
monitor_and_log_memory_usage() {
    echo "Monitoring and logging memory usage every 10 seconds. Press [CTRL+C] to stop."
    while true; do
        
        # Get memory usage details
        memory_info=$(free -h)
        
        # Log memory usage with timestamp to memory_log.txt
        echo "$timestamp - $memory_info" >> memory_log.txt
        
        # Wait for 10 seconds before logging again
        sleep 10
    done
}

# Displaying options to the user
echo "Dynamic Memory Monitor"
echo "1. Display current memory usage"
echo "2. Monitor and log memory usage every 10 seconds"
echo "3. Exit"

# Loop until the user chooses to exit
while true; do
    read -p "Select an option (1-3): " option
    case $option in
    1) # Display current memory usage
        display_memory_usage
        ;;
    2) # Monitor and log memory usage every 10 seconds
        monitor_and_log_memory_usage
        ;;
    3) # Exit the script
        echo "Exiting the memory monitor. Goodbye!"
        exit 0
        ;;
    *) # Invalid option
        echo "Invalid option. Please select 1-3."
        ;;
    esac
    echo "" # Print a newline for better readability
done

