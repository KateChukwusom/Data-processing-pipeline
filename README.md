# Data-processing-pipeline

A data processing pipeline built with bash scripting
This pipeline ingests raw sales data, cleans it, and monitors logs daily by cron jobs.

## Features Implemented
- Data cleaning (removed last column + filtered failed rows)
-  logging
- Error handling
- Cron automation 
- Security permissions
- Monitoring system

  ## Project files
  data_pipeline/
├── input/ # Raw data is saved here
├── output/ # Cleaned data is be saved here
├── logs/ # Logs are stored here
├── preprocess.sh # Script to clean and filter data
├── monitor.sh # Script to check for errors in logs
└── .gitignore # Prevents logs and raw data from being pushed to GitHub

## Set up
- Linux environment and Bash shell

## How to Run
1. `chmod +x preprocess.sh monitor.sh`
2. `./preprocess.sh`
3. Check `output/cleaned_sales_data.csv` and `logs/preprocess.log`

