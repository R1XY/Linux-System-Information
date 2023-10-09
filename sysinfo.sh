#!/usr/bin/env bash

# Initialize Colors
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
END="\e[0m"

# Initialize Emojis
INFO="ℹ️"
CPU="🖥️"
RAM="🐏"
DISK="💾"
NETWORK="🌐"
PROC="🔄"

# Function to print header
print_header() {
  echo -e "${CYAN}########################################${END}"
  echo -e "${CYAN}###### Linux System Information ########${END}"
  echo -e "${CYAN}########################################${END}"
}

# Function to display Operating System Info
show_os_info() {
  echo -e "${GREEN}${INFO} Operating System Info ${END}"
  echo -e "${YELLOW}----------------------${END}"
  uname -a 2>/dev/null || echo "Command 'uname' not found!"
  echo
}

# Function to display CPU Info
show_cpu_info() {
  echo -e "${GREEN}${CPU} CPU Info ${END}"
  echo -e "${YELLOW}---------${END}"
  lscpu 2>/dev/null | egrep 'Model name|Socket|Thread|NUMA|CPU\(s\)' || echo "Command 'lscpu' not found!"
  echo
}

# Function to display Memory Info
show_mem_info() {
  echo -e "${GREEN}${RAM} Memory Info ${END}"
  echo -e "${YELLOW}------------${END}"
  free -h 2>/dev/null || echo "Command 'free' not found!"
  echo
}

# Function to display Disk Info
show_disk_info() {
  echo -e "${GREEN}${DISK} Disk Info ${END}"
  echo -e "${YELLOW}----------${END}"
  df -h 2>/dev/null || echo "Command 'df' not found!"
  echo
}

# Function to display Network Info
show_network_info() {
  echo -e "${GREEN}${NETWORK} Network Info ${END}"
  echo -e "${YELLOW}--------------${END}"
  ifconfig 2>/dev/null | egrep -A 1 'eth0|wlan0' || ip addr show 2>/dev/null | egrep -A 1 'eth0|wlan0' || echo "Commands 'ifconfig' and 'ip' not found!"
  echo
}

# Function to display Running Processes
show_process_info() {
  echo -e "${GREEN}${PROC} Top Processes ${END}"
  echo -e "${YELLOW}---------------${END}"
  ps -eo %mem,%cpu,comm --sort=-%mem | head 2>/dev/null || echo "Command 'ps' not found!"
  echo
}

# Main Program
clear
print_header
show_os_info
show_cpu_info
show_mem_info
show_disk_info
show_network_info
show_process_info
