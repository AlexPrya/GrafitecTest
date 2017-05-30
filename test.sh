#!/bin/bash

error () {
    case $2 in
    notNum)
        echo "Error: $1 is not a number!"
    ;;
    notProgression)
        echo "Error: $1 is not arithmetic progression"
    ;;
    esac

    exit 1
}

echo "Введите числовую последовательность через запятую:"
read numbers	#Вводим числовую последовательность

vals=(${numbers//,/ })
firstArg=
difference=

for((i=0;i<${#vals[@]};i++))
do
    let "curNum = ${vals[$i]}+0"
   echo $curNum
    if [[ $curNum -ge 0 ]]
    then

        if [[ "$i" > 1 ]]
        then
            dif=$difference
            let "difference=${vals[$i]}-${vals[$i-1]}"

            # если разности не равны, то это не арифметическая прогрессия
            if [[ "$dif" -ne "$difference" ]]
            then
                error $numbers notProgression
            fi

        elif [[ $i -eq 1 ]]
        then
            let "difference=${vals[$i]}-${vals[$i-1]}"
        fi

    else
        error "$vals[$i]" notNum
    fi
done

echo "Yes! $numbers - is an arithmetic progression"

exit 0
