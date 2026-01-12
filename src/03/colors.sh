#!/bin/bash
if [ $# -ne 4 ]; then
  echo "Ошибка: нужно передать 4 параметра"
  echo "Пример: ./main03.sh 1 3 4 5"
  exit 1
fi
if [[ ! $1 =~ ^[1-6]$ ]] || [[ ! $2 =~ ^[1-6]$ ]] || [[ ! $3 =~ ^[1-6]$ ]] || [[ ! $4 =~ ^[1-6]$ ]]; then
  echo "Ошибка: параметры должны быть числами от 1 до 6"
  exit 1
fi
if [ "$1" -eq "$2" ] || [ "$3" -eq "$4" ]; then
  echo "Ошибка: цвет текста и фона не должны совпадать"
  exit 1
fi

FG_COLORS=(37 31 32 34 35 30)
BG_COLORS=(47 41 42 44 45 40)

NAME_BG=${BG_COLORS[$1-1]}
NAME_FG=${FG_COLORS[$2-1]}
VALUE_BG=${BG_COLORS[$3-1]}
VALUE_FG=${FG_COLORS[$4-1]}
