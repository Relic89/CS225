#!/bin/bash

PATH=$1

shopt -s extglob

if [[ -z $1 ]] ;then
	echo "Try 'basename --help' for more information."
	exit
elif [[ $PATH == '/' ]] ;then
	echo "$PATH"
	exit
fi

PATH=${PATH%%+(/)}
RESULT=${PATH##*/}

echo ${RESULT}



	

