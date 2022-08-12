function Delete()
{
   full_tapename=$1
   local tapename=$(echo $full_tapename | cut -d "," -f "1")
   local tapeamount=$(echo $full_tapename | cut -d "," -f "2")
   local inputCorrect=1   #incorrect,enters while loop
   local filename=block   #Filename
   local choice=$2

    echo "You have selected a tape  $tapename with amount of $tapeamount copies"

while [ $inputCorrect -eq 1 ] #runs as long as the input is incorrect
do
   #read -p "How many copies would you like to delete? - Maximum  $tapeamount: " choice

		#Check if choice is validate
        if [[ $choice -gt 0 ]] && [[ $choice -le $tapeamount ]]; then

            inputCorrect=0  #correct, exits while loop
			#Subtracting amount of copies
			let finalamount=($tapeamount - $choice)
		    if [[ "$finalamount" -gt 0 ]]; then
                sed -i "s/$full_tapename/$tapename,$finalamount/g" $filename
				echo "New amount copies of $tapename is $finalamount"
                #Log $FUNCNAME Success
			else [[ "$finalamount" -eq 0 ]]
                sed -i "/$full_tapename/d" $filename
				echo "You have deleted all copies of $tapename"
               # Log $FUNCNAME Success
			fi
        else
        echo "Incorrect"
        inputCorrect=1
        #Log $FUNCNAME Failure
        read -p "How many copies would you like to delete? - Maximum  $tapeamount: " choice
        fi
done

}


Delete NIRVANA,5 6