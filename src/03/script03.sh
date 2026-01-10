#!/bin/bash
if [[ $# -ne 4 ]]; then
	echo "Ошибка: требуется 4 параметра (числа от 1 до 6)"
	exit 1
fi
for param in "$@"; do
	if ! [[ $param =~ ^[1-6]$ ]]; then
		echo "Ошибка: все параметры должны быть числами от 1 до 6"
		exit 1
	fi
done
source ./gather_info.sh
source ./print_colored.sh
get_system_info
print_colored_info "$1" "$2" "$3" "$4"

