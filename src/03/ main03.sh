#!/bin/bash
source ./colors.sh "$@"
source ./system_info.sh

echo -e "\e[${NAME_BG}m\e[${NAME_FG}mHOSTNAME\e[0m = \e[${VALUE_BG}m\e[${VALUE_FG}m$HOSTNAME\e[0m"
echo -e "\e[${NAME_BG}m\e[${NAME_FG}mUSER\e[0m = \e[${VALUE_BG}m\e[${VALUE_FG}m$USER\e[0m"
echo -e "\e[${NAME_BG}m\e[${NAME_FG}mOS\e[0m = \e[${VALUE_BG}m\e[${VALUE_FG}m$OS\e[0m"
echo -e "\e[${NAME_BG}m\e[${NAME_FG}mDATE\e[0m = \e[${VALUE_BG}m\e[${VALUE_FG}m$DATE\e[0m"
echo -e "\e[${NAME_BG}m\e[${NAME_FG}mUPTIME\e[0m = \e[${VALUE_BG}m\e[${VALUE_FG}m$UPTIME\e[0m"
