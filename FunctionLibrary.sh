#lab13.sh Specific Functions

check_ccn()
{
        if [[ $INPUT =~ ^[0-9]{4}[\ -]?[0-9]{4}[\ -]?[0-9]{4}[\ -]?[0-9]{4}$ ]] ;then
                return 0
        else
                return 1
        fi
}

check_ip()
{
        if [[ $INPUT =~ ^([2][5][0-5][.]|[2][0-4][0-9][.]|[1][0-9]{2}[.]|[1-9]?[0-9][.]){3}([2][5][0-5]|[2][0-4][0-9]|[1][0-9]{2}|[1-9]?[0-9])$ ]] ;then
                return 0
        else
                return 1
        fi
}

check_pn()
{
        if [[ $INPUT =~ ^[1]?[\ -(][1-9]{3}[\ -)][1-9][0-9]{2}[\ -][0-9]{4}$ ]] ;then
                return 0
        else
                return 1
        fi
}

check_ssn()
{
        if [[ $INPUT =~ ^[1-9][0-9]{2}[\ -]?[0-9]{2}[\ -]?[0-9]{4}$ ]] ;then
                return 0
        else
                return 1
        fi
}

#----------------------------------------------
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
