#!/bin/bash

FILE=$(cat ~/medialab/media.xml | grep "\.mp"  | awk -F'>' '{ print $2 }' | awk -F'<' '{ print $1 }')
DIRLIST=$(ls -1 ~/medialab)
DIR=~/medialab

MEDIALOST='0'
XMLLOST='0'

echo "Files not in medialab directory:"
for LINE in $DIRLIST ;do
	if ! grep -q $LINE ~/medialab/media.xml ;then	
		(( MEDIALOST++ ))
		echo "$LINE"
	fi
done

echo "Files not in media.xml:"
for ITEM in $FILE ;do
        if [[ ! -e $DIR/$ITEM ]]  ;then
		(( XMLLOST++ ))
		echo "$ITEM"
        fi
done

echo "$MEDIALOST Files found in Directory but not XML."
echo "$XMLLOST Files found in XML but not Directory."
