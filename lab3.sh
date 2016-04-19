#!/bin/bash

MINUID=500


if [[ "$USER" = 'root' ]] ;then
        echo "It's insecure to run this script as root."
        exit

elif [[ "$UID" -gt "0" && "$UID" -lt "$MINUID" ]] ;then
        echo "Your User ID is less than $MINUID."

else
        echo "Your User ID is more than $MINUID."

        home=$(grep "$USER" /etc/passwd |cut -f6 -d:)
        if [ $? = 0 ] ;then
                size=$(du -sh "$home" | awk -F' ' '{ print $1 }')
                echo "$home is $size"
        else
                echo "Home directory doesn't exist or is not readable."
        fi
fi

