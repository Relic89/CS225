#Library file associated with Final.sh


CheckDirectory()
{
	if [ ! -d "${DIRECTORY}/${YEAR}/${MONTH}/${DAY}" ] ;then
		mkdir -p "${DIRECTORY}/${YEAR}/${MONTH}/${DAY}"
	fi
}

Cleanup()
{
	rm -Rf $TMP
}

CopyFiles()
{
	cp $LINE "${DIRECTORY}/${YEAR}/${MONTH}/${DAY}"
}

Error()
{
	logger "ctrl+c"
}

GetFileData()
{
	CamMake=$(exiv2 "$FILE" | grep -a "make" | cut -f2 -d ":")
	CamMake=${CamMake# }
	CamMake=${CamMake// /-}
	CamModel=$(exiv2 "$FILE" | grep -a "model" | cut -f2 -d ":")
        CamModel=${CamModel# }
        CamModel=${CamModel// /-}
	Year=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f2 -d ":")
        Year=${Year# }
        Month=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f3 -d ":")
	DayHour=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f4 -d ":")
	Day=${DayHour%% *}
	Hour=${DayHour#* }
	Minute=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f5 -d ":")
	Second=$(exiv2 "$FILE" | grep -a "timestamp" | cut -f6 -d ":")

	if [[ "$FILE" == *.JPG ]] ;then
		FileType="jpg"
	else
		FileType=${FILE#*.}
	fi

	if [[ "$CamModel" =~ "$CamMake" ]] ;then
		Camera="$CamModel"
	else
		Camera="$CamMake-$CamModel"
	fi

	FileName="$Year"-"$Month"-"$Day"_"$Hour"-"$Minute"-"$Second"_"$Camera"."$FileType"
}

GetFileDataALT()
{
	Camera="UNKNOWN"
	Year=$(date +%Y -r $FILE)
	Month=$(date +%m -r $FILE)
	Day=$(date +%d -r $FILE)
	Hour=$(date +%H -r $FILE)
	Minute=$(date +%M -r $FILE)
	Second=$(date +%S -r $FILE)
	FileType=${FILE#*.}
	FileName="$Year"-"$Month"-"$Day"_"$Hour"-"$Minute"-"$Second"_"$Camera"."$FileType"

}

GetTimeStamp()
{
	TMP=$(stat --format '%y' "$LINE")
	TMP=${TMP%%' '*}
	YEAR=${TMP%%-*}
	TMP=${TMP#*-}
	MONTH=${TMP%%-*}
	TMP=${TMP#*-}
	DAY=${TMP%%-*}
}

InstallExiv2()
{
	If [[ ! rpm -qa exiv2 ]]  ;then 
		yum -y install exiv2
	fi
}

MoveFiles()
{
	mv $LINE "${DIRECTORY}/${YEAR}/${MONTH}/${DAY}"
}

NoSorting()
{
	echo "Sorting as stopped"
	cleanup
}

UnzipTar()
{
	cd /root/Projects/CS225
	tar -xzf /root/Projects/CS225/finalfiles.tar.gz

}

ReadOut()
{
	if [[ ! -z "$FORCE" ]] ;then
		ACTION="moved"
	else
		ACTION="copied"
	fi

	echo "${ImageCount} images ${ACTION}"
	echo "${ImageDuplicate} images ${ACTION}"
	echo "${VideoCount} videos ${ACTION}"
	echo "${VideoDuplicate} videos ${ACTION}"
}
