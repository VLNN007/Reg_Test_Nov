
#!/bin/bash - Nanthu

clear

echo "===================================================="
echo "          SAP SERVER HEALTH CHECK"
echo "===================================================="

echo ""
echo "Hostname       : $(hostname)"
echo "Date           : $(date)"
echo "Uptime         : $(uptime -p)"
echo ""

# 1. MEMORY UTILIZATION
echo "===================================================="
echo "             MEMORY UTILIZATION"
echo "===================================================="

free -g

echo ""
echo "Memory Details:"
free -g | awk 'NR==2 {
printf "Total Memory     : %s GB\n", $2
printf "Used Memory      : %s GB\n", $3
printf "Free Memory      : %s GB\n", $4
printf "Available Memory : %s GB\n", $7
}'

# 2. SWAP UTILIZATION
echo ""
echo "===================================================="
echo "              SWAP UTILIZATION"
echo "===================================================="

free -h | grep -i swap

# 3. FILESYSTEM UTILIZATION
echo ""
echo "===================================================="
echo "             FILESYSTEM SPACE"
echo "===================================================="

df -hT

# 4. TOP CPU CONSUMING PROCESSES
echo ""
echo "===================================================="
echo "          TOP 10 CPU CONSUMING PROCESSES"
echo "===================================================="

ps -eo pid,ppid,user,%cpu,%mem,comm --sort=-%cpu | head -11

# 5. TOP MEMORY CONSUMING PROCESSES
echo ""
echo "===================================================="
echo "         TOP 10 MEMORY CONSUMING PROCESSES"
echo "===================================================="

ps -eo pid,ppid,user,%cpu,%mem,comm --sort=-%mem | head -11

# 6. LOAD AVERAGE
echo ""
echo "===================================================="
echo "              SYSTEM LOAD AVERAGE"
echo "===================================================="

uptime

echo ""
echo "===================================================="
echo "          SAP SERVER CHECK COMPLETED"
echo "===================================================="
