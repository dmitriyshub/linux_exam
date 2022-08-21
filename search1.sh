filename=$1
#1. function gets a string as argument
#2. read the $filename global variable and find all the
#And return
function search()
{
    local search_string=$1
    local search_result=""
    local array_of_result=()
    local number=0
    local counter=1
    local true=1
    # read filename line by line using grep and add all the result to array
    while read -r; do
      search_result=$(grep -i "$search_string")
      for i in $search_result; do
        array_of_result+=("$i")
      done
    done < "$filename"


    true=1
    while [[ $true -eq 1 ]] ; do
    counter=1
    number=0
    for value in "${array_of_result[@]}"; do
      echo "$counter) $value"
      let "counter=($counter+1)"
    done
    let "counter=($counter-1)"

    read -p "Please choose a number  between 1 to $counter: " number
    if [[ $number -le $counter ]] && [[ $number -ne 0 ]]; then

      let number=$number-1
      true=0
    else
      echo "Please chose again: "
    fi
    done
    echo "${array_of_result[$number]}"

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
