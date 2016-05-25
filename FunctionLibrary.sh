CheckForDir()
{
	if [ ! -d "$1" ] ;then
                mkdir -p "$1"
	fi
}

FiCopy()
{
	cp $1 $2
}

FiMove()
{
	mv $1 $2
}

GetTimeStamp()
{
	VAR=$(stat --format '%y' "$1")
	VAR=${VAR%%' '*}
	YEAR=${VAR%%-*}
	VAR=${VAR#*-}
	MONTH=${VAR%%-*}
	VAR=${VAR#*-}
	DAY=${VAR%%-*}
}

ScriptName()
{
	${0##*/}
}
