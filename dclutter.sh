MY_DIR="/mnt/c/Users/HP/PPath/bash/log_files"
ARCHIVE="/mnt/c/Users/HP/PPath/bash/log_files/logs_archive.zip"

LOG_FILES=($(find "$MY_DIR" -name "*.log"))
ERROR_PATTERNS=(ERROR CRITICAL FATAL WARNING)
rm -f $ARCHIVE
for LOG_FILE in "${LOG_FILES[@]}"; do
    for ERROR_PATTERN in "${ERROR_PATTERNS[@]}"; do
        grep -i "$ERROR_PATTERN" "$LOG_FILE" >> incident_report.txt
    done
    zip -j $ARCHIVE "$LOG_FILE"
    rm "$LOG_FILE"
done

