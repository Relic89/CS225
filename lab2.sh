#!/bin/bash

echo "Please enter a number"
read NUMBER

if [[ -z $NUMBER ]] ;then
	echo "Oops! No input was given."

elif [[ $NUMBER =~ ^[+]?[-]?[0-9]+$ ]] ;then

	if [[ $((NUMBER % 2)) -eq  0 ]] ;then
        	echo "Your number is even"
	else
		echo "Your number is odd"
	fi

else
	echo "Your input is not a number."

fi
