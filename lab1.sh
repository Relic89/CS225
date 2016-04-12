#!/bin/bash

echo "Please enter a number"
read NUMBER

if [[ $NUMBER > 5 ]] ;then
        echo "Your number is greater than 5"

elif [[ $NUMBER < 5 ]] ;then
	echo "Your number is less than 5"

else
        echo "Your number equal to 5"
fi

