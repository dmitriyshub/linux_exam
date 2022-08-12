#!/bin/bash

#Validates the RECORD_NAME - no spaces,letters & numbers only
function CheckString() {
local check='^[a-zA-Z0-9]+$'
local recName
#local arg_num=$#
local inputCorrect=1   #incorrect


while [ $inputCorrect -eq 1 ]   #runs as long as the input is incorrect
do
	read -p "Please enter the required record name: " recName
        inputCorrect=0  #correct, exits while loop
        if ! [[ $recName =~ $check ]] #|| [[ $arg_num -ne 1 ]]
        then
                inputCorrect=1  #incorrect, enters while loop again
                 read -p "This is not a valid name. Please enter a name consisting of letters and numbers only, no spaces."
        fi
done
echo $recName      ##Don't forget to accept this function output into a variable RECORD_NAME??? or SEARCH_STRING?


}

#Validates the amount, only whole numbers allowed, no spaces
function CheckInt() {
local check='^[0-9]+$'
local amount
local inputCorrect=1   #incorrect,enters while loop


while [ $inputCorrect -eq 1 ]   #runs as long as the input is incorrect
do
        read -p "Please enter the required amount of records: " amount
        inputCorrect=0  #correct, exits while loop
        if ! [[ $amount =~ $check ]]
        then
		inputCorrect=1  #incorrect, enters while loop again
                read -p "This is not a valid number. Please enter positive whole numbers only, greater than zero, no spaces."
        elif [[ $amount -eq 0 ]]
        then
                inputCorrect=1  #incorrect, enters while loop again
                read -p "This is not a valid number. Please enter numbers greater then 0."
        fi
done
echo $amount     ##Don't forget to accept this function output into a variable AMOUNT

}
##################################################################################################
#########################################@@@MAIN@@@###############################################

#CheckString


CheckInt
