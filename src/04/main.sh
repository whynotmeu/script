#!/bin/bash
source ./config.conf 2>/dev/null

COL1_BG_DEFAULT=6
COL1_FG_DEFAULT=1
COL2_BG_DEFAULT=2
COL2_FG_DEFAULT=4

COL1_BG=${column1_background:-$COL1_BG_DEFAULT}
COL1_FG=${column1_font_color:-$COL1_FG_DEFAULT}
COL2_BG=${column2_background:-$COL2_BG_DEFAULT}
COL2_FG=${column2_font_color:-$COL2_FG_DEFAULT}

FG=(37 31 32 34 35 30)
BG=(47 41 42 44 45 40)

HOSTNAME=$(hostname)
TIMEZONE="$(timedatectl | grep "Time zone" | awk '{print $3, "UTC", $5}')"
USER=$(whoami)
OS=$(lsb_release -d | awk -F"\t" '{print $2}')
DATE=$(date "+%d %b %Y %H:%M:%S")
UPTIME=$(uptime -p)
UPTIME_SEC=$(cat /proc/uptime | awk '{print int($1)}')
IP=$(hostname -I | awk '{print $1}')
MASK=$(ifconfig | grep -w "netmask" | awk '{print $4}' | head -n1)
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(free -g | awk '/Mem:/ {printf "%.3f", $2}')
RAM_USED=$(free -g | awk '/Mem:/ {printf "%.3f", $3}')
RAM_FREE=$(free -g | awk '/Mem:/ {printf "%.3f", $4}')
SPACE_ROOT=$(df -m / | awk 'NR==2{printf "%.2f", $2}')
SPACE_ROOT_USED=$(df -m / | awk 'NR==2{printf "%.2f", $3}')
SPACE_ROOT_FREE=$(df -m / | awk 'NR==2{printf "%.2f", $4}')

echo -e "\e[${BG[$COL1_BG-1]}m\e[${FG[$COL1_FG-1]}mHOSTNAME\e[0m = \e[${BG[$COL2_BG-1]}m\e[${FG[$COL2_FG-1]}m$HOSTNAME\e[0m"
echo -e "\e[${BG[$COL1_BG-1]}m\e[${FG[$COL1_FG-1]}mUSER\e[0m = \e[${BG[$COL2_BG-1]}m\e[${FG[$COL2_FG-1]}m$USER\e[0m"
echo -e "\e[${BG[$COL1_BG-1]}m\e[${FG[$COL1_FG-1]}mOS\e[0m = \e[${BG[$COL2_BG-1]}m\e[${FG[$COL2_FG-1]}m$OS\e[0m"
echo -e "\e[${BG[$COL1_BG-1]}m\e[${FG[$COL1_FG-1]}mDATE\e[0m = \e[${BG[$COL2_BG-1]}m\e[${FG[$COL2_FG-1]}m$DATE\e[0m"
echo -e "\e[${BG[$COL1_BG-1]}m\e[${FG[$COL1_FG-1]}mUPTIME\e[0m = \e[${BG[$COL2_BG-1]}m\e[${FG[$COL2_FG-1]}m$UPTIME\e[0m"

echo

echo "Column 1 background = ${column1_background:-default}"
echo "Column 1 font color = ${column1_font_color:-default}"
echo "Column 2 background = ${column2_background:-default}"
echo "Column 2 font color = ${column2_font_color:-default}"
