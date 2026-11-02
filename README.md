# CIS-Server-Diagnotic-Automation
Autmated Diagnostics tool for Ubuntu and CentOS Servers

---

## Complete script (`system_diagnostic.sh`)
```bash
  GNU nano 8.1                                                       system_diagnostic.sh                                                                  
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
```

---
## Script Breakdown

### 
*  **Network Mapping:** finds MAC address strings and active `ip address` lines and network cards.
*  **Routing and DNS Testing:** Checks raw IP checks for DNS servers and name Resolution tests.
*  **System Scans:** uses `systemctl list-units --failed` to find failed or crashed services
*  **File system check:** Checks storage for oddities like unknown drives and drive space
*  **Security and firewall check:** auditing firewall rules and checks for allowed access

## Script use walkthrough

### 1. Local Code
Download file or copy code directly into nano on personal machine
```bash
nano system_diagnostic.sh
```
if you used nano, you can save the script with ctrl+o and close it with ctrl+x 

### 2. Script Privilages
Give the script the ability to execute.
```bash
sudo chmod +x system_diagnostic.sh
```
will allow the script to run in your environment and generate the desired report.

### 3. Run it
Run the diagnostic tool as root
```bash
sudo ./system_diagnostic.sh
```
### 4. Reviewing the compiled data
File will notifiy you where to look for the generated report you can open it with
```bash
cat /var/log/system_diagnostic_report.txt
```
