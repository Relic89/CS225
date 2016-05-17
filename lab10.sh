#!/bin/bash

cleanup()
{
	rm -Rf $TMP
	exit 
}

trap "cleanup" SIGINT

VAR=$(find /)
TMP=$(mktemp)
COUNT="0"

for FILE in $VAR ;do
	(( COUNT++ ))
	line=${FILE##*/}
	echo "File "$COUNT" : "$line""
done >> "$TMP"

