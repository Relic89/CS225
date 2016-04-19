#!/bin/bash

echo "Please enter a number."
read NUM

if [[ $NUM =~ ^[+]?[-]?[0-9]+$ ]] && [[ $NUM > 50 && $NUM < 100 ]] ;then
	echo "Success"
else
	echo "The number is out of range or not a integer."
fi 
