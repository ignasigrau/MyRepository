#!/bin/bash

echo "Please select whether you want to download resources for the course, activities, or solutions of the activities: "
echo "   0: resources"
echo "   1: activities"
echo "   2: activities' solutions"
echo "Please note that the content will only be available on the publication date (check your classroom calendar)."
echo -ne "Type 0 for resources, 1 for activities, or 2 for solutions: "
read inp_type
if [ $inp_type -eq $inp_type 2>/dev/null ]
then

	echo -ne "\nPlease enter the number of the activity / unit you want to download (0 for Unit 0, 1 for Unit 1 or PAC/PEC 1, etc.): "
	read input_num	
	if [ $input_num -eq $input_num 2>/dev/null ]
	then
		if [ "$inp_type" -eq "0" ]; then
			# Resources: notebooks teòrics
			echo "Downloading Unit $inp_type resources"
			git clone https://eimtgit.uoc.edu/prog_datasci_2/resources/unit_${input_num}.git
		else
			# Activities: enunciats o solucions
			if [ "$inp_type" -eq "1" ]; then
				echo "Downloading PAC/PEC $inp_type"
				git clone https://eimtgit.uoc.edu/prog_datasci_2/activities/activity_${input_num}.git
			else
				echo "Downloading PAC/PEC $inp_type solution"
				git clone https://eimtgit.uoc.edu/prog_datasci_2/activities/activity_sol_${input_num}.git
			fi
		fi
    	else
		echo "Error: $input_num is not a valid selection."
	fi
else
    echo "Error: $inp_type is not a valid selection."
fi
