#!/bin/bash

#Authors: Niv Vaisman with the help of Yevgenii

function  PrintAmount() #The function will recieve the records names and amounts
{
	local DB=$(cat RECORDS.db | cut -d "," -f 2) #the records database file will output its content into the var DB
	local sum=0
	local n=0
	local no_records=0
	for n in $DB #for loop that runs over the db file and sums the total amount of records found
	do
		let "sum=($sum+$n)" #sum of the total amount
	done
	if [[ $sum -gt $no_records ]] #the total sum should be greater than 0, if it's equals to zero, it\'ll output the user an error message and log the data
	then
		Log $FUNCNAME $sum #logs the amout into Log file
		echo "Total amount of Records is: " $sum
	else
		Log $FUNCNAME $sum
		echo "no records available"
	fi
}
PrintAmount #calls for the function
main #calls the menu function again