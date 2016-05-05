#!/bin/bash

#MEDIA=$(ls /root/medialab/ | wc -l)
#TXTMEDIA=$(cat /root/medialab/medialist.txt | wc -l)
#echo "$TXTMEDIA"

FILE=$(cat ~/medialab/medialist.txt)
DIR=~/medialab

if [[ -e foundfiles.txt || -e lostfiles.txt ]] ;then
	rm foundfiles.txt || rm lostfiles.txt
fi

for LINE in $FILE ;do
	if [[ -e $DIR/$LINE ]] ;then
		echo $LINE >> foundfiles.txt
	else
		echo $LINE >> lostfiles.txt
	fi	
done

