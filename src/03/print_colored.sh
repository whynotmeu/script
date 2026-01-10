#!/bin/bash
print_colored_info() {
	bg_title=$1
	fg_title=$2
	bg_value=$3
	fg_value=$4
	if [[ $bg_title -eq $fg_title || $bg_value -eq $fg_value ]]; then
		echo "Ошибка: Цвет фона и текста одного столбца совпадают!"
		echo "Пожалуйста, вызовите скрипт снова с корректными цветами."
		exit 1
	fi
	declare -A bg_colors=( [1]=47 [2]=41 [3]=42 [4]=44 [5]=45 [6]=40 )
	declare -A fg_colors=( [1]=97 [2]=91 [3]=92 [4]=94 [5]=95 [6]=30 )
	format() {
		echo -e "\e[${bg_colors[$bg_title]};${fg_colors[$fg_title]}m$1\e[0m = \e[${bg_colors[$bg_value]};${fg_colors[$fg_value]}m$2\e[0m"
	}
	format "HOSTNAME" "$HOSTNAME"
	format "TIMEZONE" "$TIMEZONE"
	format "USER" "$USER"
	format "OS" "$OS"
	format "DATE" "$DATE"
	format "UPTIME" "$UPTIME"
	format "UPTIME_SEC" "$UPTIME_SEC"
	format "IP" "$IP"
	format "MASK" "$MASK"
	format "GATEWAY" "$GATEWAY"
	format "RAM_TOTAL" "$RAM_TOTAL GB"
	format "RAM_USED" "$RAM_USED GB"
	format "RAM_FREE" "$RAM_FREE GB"
	format "SPACE_ROOT" "$SPACE_ROOT MB"
	format "SPACE_ROOT_USED" "$SPACE_ROOT_USED MB"
	format "SPACE_ROOT_FREE" "$SPACE_ROOT_FREE MB"
}

