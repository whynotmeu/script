#!/bin/bash
check_param_exists() {
	if [ -z "$1" ]; then
		echo "Ошибка: параметр не передан"
		exit 1
	fi
}
check_not_number() {
	if [[ $1 =~ ^[0-9]+$ ]]; then
		echo "Некорректный ввод"
		exit 1
	fi
}

