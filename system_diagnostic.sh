#!/bin/bash

# Generated Report Destination path
LOG_FILE="/var/log/system_diagnostic_report.txt"


# Report Header
echo "----SYSTEM DIAGNOSTIC REPORT----" > "$LOG_FILE"

echo "----REPORT CREATED ON $(date)" >> "$LOG_FILE"

echo "----TARGET SERVER $(hostname)" >> "$LOG_FILE"

echo "=============================================" >> "$LOG_FILE"

# Network Interfaces
echo "----Network Interface Check----" >> "$LOG_FILE"

ip address >> "$LOG_FILE"

echo "=============================================" >> "$LOG_FILE"

# Routing and DNS Check

echo "----Routing and DNS----"

if ping -c 4 8.8.8.8 &> /dev/null; then
	echo "ROUTING TEST SUCCESSFUL" >> "$LOG_FILE"
else
	echo "ROUTING TEST UNSUCCESSFUL" >> "$LOG_FILE"
fi

if ping -c 4 google.com &> /dev/null; then
	echo "DNS TEST SUCCESSFUL" >> "$LOG_FILE"
else
	echo "DNS TEST UNSUCCESSFUL" >> "$LOG_FILE"
fi

echo "==============================================" >> "$LOG_FILE"

# Failed Services Check

echo "----FAILED SYSTEM SERVICE CHECK-----" >> "$LOG_FILE"

systemctl list-units --failed >> "$LOG_FILE"

echo "==============================================" >> "$LOG_FILE"

# Storage space check

echo "----FILE SYSTEM CHECK----" >> "$LOG_FILE"

df -h >> "$LOG_FILE"

echo "==============================================" >> "$LOG_FILE"

# Network Securitys and Firewalls

echo "----SECURITY AND FIREWALL CHECK----" >> "$LOG_FILE"

ufw status verbose >> "$LOG_FILE"

echo "===============================================" >> "$LOG_FILE"

# Diagnostic Complete Notification

echo "----Diagnostic Check Complete! data written to $LOG_FILE----"
