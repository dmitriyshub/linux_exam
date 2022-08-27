#!/bin/bash
filename=$1

#1. function gets a string as argument
#2. read the $filename global variable and find all the options
#3. return the chosen value
function search()
{
    local search_string=$1
    local search_result=""
    local array_of_result=()
    local number=0
    local counter=1
    local true=1
    # read filename line by line using grep and add all the result to array
    while read -r ; do
      search_result=$(grep -i "$search_string")

      for i in $search_result; do
        array_of_result+=("$i")
      done
    done < "$filename"

    #while loop until the user chose the correct option
    true=1
    while [[ $true -eq 1 ]] ; do
    counter=1
    number=0
    for value in "${array_of_result[@]}"; do
      echo "$counter) $value"
      let "counter=($counter+1)"
    done
    let "counter=($counter-1)"
    # prompt for user
    read -rp "Please choose a number  between 1 to $counter: " number
    if [[ $number -le $counter ]] && [[ $number -ne 0 ]]; then

      let number=$number-1
      true=0
    else
      echo "Please chose again: "
    fi
    done
    echo "${array_of_result[$number]}"
    final_result="${array_of_result[$number]}"
}

###################################MAIN##########################################

search "rv"
echo $final_result
#global_result="$( search "rv" )"
#
#echo $global_result




: '
local varname=$2
'

