#!/bin/bash

SCRIPT=${0##*/}
HELPSCREEN=$( cat /root/Projects/CS225/lab9help.txt )

while getopts :dvhn:l: opt ;do
	case $opt in
	  d) set -x;;
	  v) VERBOSE=true
	      echo "VERBOSE is set to true";;
	  h) echo "Usage:	$SCRIPT [options]"
	     echo "		$SCRIPT -n NAME"
	     echo "		$SCRIPT -l DIR"
	     echo " "
  	     echo "Options:"
	     echo " -d  		activates debugging"
	     echo " -v  		sets VERBOSE variable to true"
  	     echo " -h  		displays help page"
 	     echo " -l DIR		list the directory"
	     echo " -n NAME    	display  name" ;;
	  n) NAME="$OPTARG"
              echo "$NAME is the name entered";;
	  l) DIR="$OPTARG"
	      read -p "Would you like to display $DIR contents: " ANSWER
	      case $ANSWER in
	      [yY][eE][sS])
		   if [ "$VERBOSE" == "true" ]
			then ls -l $DIR
			else ls $DIR
		   fi ;;
	      [nN][oO]) : ;;	      
	      *) 
		   echo "Invalid entry."
		   exit 1 ;;
	      esac ;;
	  \?) echo "Try '$SCRIPT -h' for more information."
	      exit 1;;
	esac
done

shift $(($OPTIND -1))
