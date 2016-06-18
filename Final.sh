#!/bin/bash

. ~/Projects/CS225/Library.sh
DIRECTORY=~/Projects/CS225/finalfiles/
DIRLIST=$( find $DIRECTORY -maxdepth 1)
SCRIPT=${0##*/}
FileCount='0'
ImageCount='0'
VideoCount='0'
ImageDuplicate='0'
VideoDuplicate='0'

trap cleanup INT TERM 

while getopts :fdth opt ;do
	case $opt in
	  f) FORCE="true";;
	  d) set -x;;
	  t) UNZIPTAR ;;
	  h) echo "Usage:	$SCRIPT [Options]"
	     echo " "
	     echo "Options:"
	     echo " -f		sets FORCE variable to true"
	     echo " -d 		sets debug to on"
	     echo " -t 		Unzips Tar ball with final files"
	     echo " -h 		Displays help screen"
	     exit 0 ;;
	  \?) echo "Invalid Entry: Try '$SCRIPT -h'";;
	esac
done

shift $(($OPTIND -1))

for FILE  in $DIRLIST ;do
	if [[ "$FILE" == *.JPG ]] ;then
		GetFileData 
	else
		GetFileDataALT
	fi

done

for FILE in $Source ;do
	(( FileCount++ ))
done

ReadOut
Cleanup
