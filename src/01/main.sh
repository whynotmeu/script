#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Ошибка: нужно передать один параметр"
  exit 1
fi

if [[ $1 =~ [0-9] ]]; then
  echo "Некорректный ввод"
  exit 1
fi

echo "Вы ввели: $1"
