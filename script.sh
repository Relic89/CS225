#!/bin/bash

#echo "Enter your name"
#read NAME

#echo "Hello ${NAME}"

#FILE="$(cat /etc/passwd)"

#USERNAME="$(whoami)"

echo "Please enter your name"
read NAME

if [[ "$NAME" = 'bob' ]] ;then
	echo "Hello bob"
else
	echo "I don't know you"
fi

