#!/bin/bash
HOSTNAME=$(hostname)
TIMEZONE=$(timedatectl | grep "Time zone" | awk '{print $3, "UTC", $5}')
USER=$(whoami)
OS=$(uname -sr)
DATE=$(date "+%d %B %Y %T")
UPTIME=$(uptime -p)
UPTIME_SEC=$(awk '{print int($1)}' /proc/uptime)
IP=$(ip route get 8.8.8.8 | awk '{print $7}')
MASK=$(ip -o -f inet addr show | awk '{print $4}' | head -n 1 | cut -d/ -f2)
GATEWAY=$(ip route | grep default | awk '{print $3}')
RAM_TOTAL=$(free -g | awk '/Mem:/ {printf "%.3f GB", $2}')
RAM_USED=$(free -g | awk '/Mem:/ {printf "%.3f GB", $3}')
RAM_FREE=$(free -g | awk '/Mem:/ {printf "%.3f GB", $4}')
SPACE_ROOT=$(df -BM / | awk 'NR==2 {printf "%.2f MB", $2}')
SPACE_ROOT_USED=$(df -BM / | awk 'NR==2 {printf "%.2f MB", $3}')
SPACE_ROOT_FREE=$(df -BM / | awk 'NR==2 {printf "%.2f MB", $4}')

echo "HOSTNAME = $HOSTNAME"
echo "TIMEZONE = $TIMEZONE"
echo "USER = $USER"
echo "OS = $OS"
echo "DATE = $DATE"
echo "UPTIME = $UPTIME"
echo "UPTIME_SEC = $UPTIME_SEC"
echo "IP = $IP"
echo "MASK = $MASK"
echo "GATEWAY = $GATEWAY"
echo "RAM_TOTAL = $RAM_TOTAL"
echo "RAM_USED = $RAM_USED"
echo "RAM_FREE = $RAM_FREE"
echo "SPACE_ROOT = $SPACE_ROOT"
echo "SPACE_ROOT_USED = $SPACE_ROOT_USED"
echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE"

echo ""
read -p "Сохранить данные в файл? (Y/N): " ANSWER

if [[ "$ANSWER" == "Y" || "$ANSWER" == "y" ]]; then
    FILE=$(date "+%d_%m_%y_%H_%M_%S").status

    echo "HOSTNAME = $HOSTNAME" >  $FILE
    echo "TIMEZONE = $TIMEZONE" >> $FILE
    echo "USER = $USER" >> $FILE
    echo "OS = $OS" >> $FILE
    echo "DATE = $DATE" >> $FILE
    echo "UPTIME = $UPTIME" >> $FILE
    echo "UPTIME_SEC = $UPTIME_SEC" >> $FILE
    echo "IP = $IP" >> $FILE
    echo "MASK = $MASK" >> $FILE
    echo "GATEWAY = $GATEWAY" >> $FILE
    echo "RAM_TOTAL = $RAM_TOTAL" >> $FILE
    echo "RAM_USED = $RAM_USED" >> $FILE
    echo "RAM_FREE = $RAM_FREE" >> $FILE
    echo "SPACE_ROOT = $SPACE_ROOT" >> $FILE
    echo "SPACE_ROOT_USED = $SPACE_ROOT_USED" >> $FILE
    echo "SPACE_ROOT_FREE = $SPACE_ROOT_FREE" >> $FILE

    echo "Файл сохранён: $FILE"
else
    echo "Данные не сохранены"
fi
