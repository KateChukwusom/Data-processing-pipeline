#!/bin/bash

INPUT_FILE="$HOME/data_pipeline/input/sales_data.csv"
OUTPUT_FILE="$HOME/data_pipeline/output/cleaned_sales_data.csv"
LOG_FILE="$HOME/data_pipeline/logs/preprocess.log"

# Log start time of the script
echo "$(date): Start time- Preprocessing script started" >> "$LOG_FILE"

#Task 1: remove the last column ffrom the csv file
echo "$(date): Task 1 - Remove last column" >> "$LOG_FILE"

#Using awk to read and manipulate the csv file;removing the last column
awk -F',' 'BEGIN {OFS=","} {NF--;print}' "$INPUT_FILE" > "$OUTPUT_FILE"

#Checking if the last command was successful
if [ $? -ne 0 ]; then
    echo "$(date): Failed to remove last column" >> "$LOG_FILE"
    exit 1 #exit with error code 1
fi
echo "$(date): Success--last column removed" >> "$LOG_FILE"

#Task 2: filter out rows with -failed- in column called status
echo "$(date): Task 2- Filter out  rows" >> "$LOG_FILE"

#Using awk to do the filtering
#Using temp file to avoid reading and writing to the same output file at the same time
awk -F',' 'BEGIN {OFS=","} $6 != "Failed"' "$OUTPUT_FILE" > temp_file && mv temp_file "$OUTPUT_FILE"

#Checking if the last command was successful
if [ $? -ne 0 ]; then
    echo "$(date): Error, failed to filter rows" >> "$LOG_FILE"
    exit 1
fi
echo "$(date): Task 2 = successfuL" >> "$LOG_FILE"

#Confirmation of successful tasks
echo "$(date): cleaned data saved to output file" >> "$LOG_FILE"
echo "Data ingestion and cleaning completed"
