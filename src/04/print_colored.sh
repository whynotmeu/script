#!/bin/bash
print_colored_info() {
	DEFAULT_BG1=6
	DEFAULT_FG1=1
	DEFAULT_BG2=2
	DEFAULT_FG2=4
	source ./config.cfg 2>/dev/null
	bg_title=${column1_background:-$DEFAULT_BG1}
	fg_title=${column1_font_color:-$DEFAULT_FG1}
	bg_value=${column2_background:-$DEFAULT_BG2}
	fg_value=${column2_font_color:-$DEFAULT_FG2}
	if [[ $bg_title -eq $fg_title || $bg_value -eq $fg_value ]]; then
		echo "Ошибка: Цвет фона и текста одного столбца совпадают!"
		echo "Пожалуйста, исправьте config.cfg"
		exit 1
	fi
	declare -A bg_colors=( [1]=47 [2]=41 [3]=42 [4]=44 [5]=45 [6]=40 )
	declare -A fg_colors=( [1]=97 [2]=91 [3]=92 [4]=94 [5]=95 [6]=30 )
	declare -A color_names=( [1]="white" [2]="red" [3]="green" [4]="blue" [5]="purple" [6]="black" )
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
	echo ""
	echo "Column 1 background = ${column1_background:-default} (${color_names[${column1_background:-6}]})"
	echo "Column 1 font color = ${column1_font_color:-default} (${color_names[${column1_font_color:-1}]})"
	echo "Column 2 background = ${column2_background:-default} (${color_names[${column2_background:-2}]})"
	echo "Column 2 font color = ${column2_font_color:-default} (${color_names[${column2_font_color:-4}]})"
}

