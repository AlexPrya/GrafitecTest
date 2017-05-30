#!/bin/bash

error () {
    case $2 in
    notNum)
        echo "Error: $1 is not a number!"
    ;;
    esac

    exit 1
}

echo "Введите числовую последовательность через запятую:"
read numbers	#Вводим числовую последовательность

vals=(${numbers//,/ })

for val in "${vals[@]}"
do
    if (($val+0))
    then
        echo $val
    else
        error $val notNum
    fi

done

exit 0
