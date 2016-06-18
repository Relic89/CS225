#!/bin/bash
. ~/Projects/CS225/lab13Functions.sh
SCRIPT=${0##*/}

trap "Invalid Input" SIGINT

if [[ -z $1 ]] ;then
	echo " "
	echo "Usage: "$SCRIPT" [Argument]"
	echo "Please enter either an argument in the form of either:"
    echo "Credit Card Number"
    echo "IP Address"
    echo "Phone Number"
    echo "Social Security Number"

else
    INPUT=$1
	
	if check_ccn "$INPUT" ;then
		echo ""$INPUT" is a valid credit card number."
	else
		echo ""$INPUT" is NOT a valid credit card number."
	fi

	if check_ip "$INPUT" ;then
                echo ""$INPUT" is a valid IP Address."
        else
                echo ""$INPUT" is NOT a valid IP Address."
        fi

	if check_pn "$INPUT" ;then
                echo ""$INPUT" is a valid phone number."
        else
                echo ""$INPUT" is NOT a valid phone number."
        fi

	if check_ssn "$INPUT" ;then
                echo ""$INPUT" is a valid Social Security Number."
        else
                echo ""$INPUT" is NOT a valid Social Security Number."
        fi


fi
