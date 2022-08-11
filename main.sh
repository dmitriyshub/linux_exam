#!/bin/bash
filename=$1

filename=$1
#1. function gets a string as argument
#2. read the $filename global variable and find all the options
#3. return the chosen value
function search()
{
    local string=$1
    local result=""
    local array=()

    # read filename line by line using grepc and add all the result to array
    while read -r; do
      result=$(grep -i "$string")
      for i in $result; do
        array+=("$i")
      done
    done < "$filename"

    #
    counter=1
    for value in "${array[@]}"; do
      echo "$counter) $value"
      let "counter=($counter+1)"
    done
    let "counter=($counter-1)"

    read -p "Please choose a number  between 1 to $counter: " number
     if [[ $number -le $counter ]] && [[ $number -ne 0 ]]; then

     let number=$number-1
     echo "${array[$number]}"
     else
        echo "Chosed wrong option "
     fi


}

###################################MAIN#########################################
search "rv"


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



