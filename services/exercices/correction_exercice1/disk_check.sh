#!/bin/bash

LOG_FILE="/var/log/disk_check.log"
echo "Vérification le $(date +%F)" >> "$LOG_FILE"
df -h / | awk 'NR==2 {print $1, $2, $3, $4, $5, $6}' >> "$LOG_FILE"
#df -h / | tail -1 >> "$LOG_FILE"