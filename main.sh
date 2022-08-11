#!/bin/bash
filename=$1


#Author Dima
#
#function search()
#{
#  local string=$1
#  for i in $filename; do
#  grep -i "$string*" $filename; sort -d
#
#  done
#local string=$1
#  local line_num=1
#  while IFS= read -r line; do
#    grep -i "$string*" ; sort -d
#    line_num=$((line_num+1))
#    done < "$filename"
#    echo $@
#
#
#}


filename=$1
#1. function gets a string as argument
#2. read the $filename global variable and find all the
#And return
function main()
{
    local string=$1
    local result=""
    local array=()

    while IFS= read -r
        do
        result=$(grep -i "$string")
        array+=("$result")
        done < "$filename"

#    for value in ${array[*]}
#    do
#        echo "$value"
#    done
    echo "${array[*]}"

}

var="$(main rv)"
echo $var
main "rv"
#
#index=0
#while read line; do
#    array[$index]="$line"
#    index=$(($index+1))
#done < filename
#
#for ((a=0; a < ${#array[*]}; a++))
#do
#    echo "$a: ${array[$a]}"
#done
