#!/bin/bash

#store paths in variables
LOG_FILE="$HOME/data_pipeline/logs/preprocess.log"
MONITOR_LOGFILE="$HOME/data_pipeline/logs/monitor.log"


echo "$(date): Monitoring started" >> "$MONITOR_LOGFILE"

#The function grep looks for words like errors and failed in the log file
ERROR=$(grep -i -e "ERROR" -e "FAILED" "$LOG_FILE")

#checks for errors in log file
#if errors are found, it sends a message to the monitor file
if [ -n "$ERROR" ]; then
    echo "$(date): Errors found in log file" >> "$MONITOR_LOGFILE"
    echo "$ERROR" >> "$MONITOR_LOGFILE"
else
    echo "$(date): No error detected" >> "$MONITOR_LOGFILE"
fi

echo "$(date): Monitoring completed " >> "$MONITOR_LOGFILE"
