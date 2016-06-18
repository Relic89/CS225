#!/bin/bash

Source=$( find /root/Projects/CS225/finalfiles/)
#COUNTER="0"

#for FILE in $Source ;do
#F="$FILE"
#TEST=$( exiftool -MIMEType $F)

#TEST=${TEST#*:}
#FileType=${TEST%%/*}

#((COUNTER++))
#echo "The filetype of ${F##*/} is ${FileType}"

#((COUNTER++))
#done

GetFileData()
{
	for FILE in $Source ;do
		Item="$FILE"
		MAKE=$( exiftool -Make $Item )
		MAKE=${MAKE#*:}
		CamMake=${MAKE%%/*}
		
		MIME=$( exiftool -MIMEType $Item )
                MIME=${MIME#*:}
                FileMime=${MIME%%/*}

		MODEL=$( exiftool -Model $Item )
                MODEL=${MODEL#*:}
                CamModel=${MODEL%%/*}

		DATE=$( exiftool -Create $Item )
                DATE=${DATE#*:}
                FileCreate=${DATE%%/*}

		NAME=$( exiftool -FileName $Item )
		NAME=${NAME#*:}
		FileName=${NAME%%/*}

	done

}
