#!/bin/bash
filename=main.sh
function search()
{
  local search=$1
  #local line_num=1
  while read -r line; do
    echo "$line"
    grep "$search"

    #line_num=$((line_num+1))
    done < "$filename"
}

search echo