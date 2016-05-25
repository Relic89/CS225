#!/bin/bash

. ~/Projects/CS225/FunctionLibrary.sh
DIRECTORY=$1
LISTDIR=$(find $DIRECTORY -maxdepth 1)
SCRIPT=${0##*/}

trap "Process incomplete" SIGINT

while getopts :fh opt ;do
	case $opt in
	  f) FORCE='true' ;;
	  h) echo "Usage:       $SCRIPT [options]"
             echo " "
             echo "Options:"
             echo " -f                  sets FORCE variable to true"
             echo " -h                  displays help page"
             exit 0 ;;

	  \?) echo "Invalid Entry: Try '$SCRIPT -h'";;
	esac
done

shift $(($OPTIND -1))

for LINE in $LISTDIR ;do
	if [ ! -d $LINE ] ;then
		GetTimeStamp "$LINE"
		LOCATION="${DIRECTORY}/${YEAR}/${MONTH}/${DAY}"
		CheckForDir "$LOCATION"
		if [ -z $FORCE ] ;then
			FiCopy "$LINE" "$LOCATION"
		else
			FiMove "$LINE" "$LOCATION"
		fi
	fi
done


