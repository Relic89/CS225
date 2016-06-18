check_ccn()
{
	CCN=$1 
        if [[ $CCN =~ ^[0-9]{4}[\ -]?[0-9]{4}[\ -]?[0-9]{4}[\ -]?[0-9]{4}$ ]] ;then
                return 0
        else
                return 1
        fi
}

check_ip()
{
	IP=$1
        if [[ $IP =~ ^([2][5][0-5][.]|[2][0-4][0-9][.]|[1][0-9]{2}[.]|[1-9]?[0-9][.]){3}([2][5][0-5]|[2][0-4][0-9]|[1][0-9]{2}|[1-9]?[0-9])$ ]] ;then
                return 0
        else
                return 1
        fi
}

check_pn()
{
	PN=$1
        if [[ $PN =~ ^[1]?[\ -(][1-9]{3}[\ -)][1-9][0-9]{2}[\ -][0-9]{4}$ ]] ;then
                return 0
        else
                return 1
        fi
}

check_ssn()
{
	SSN=$1
        if [[ $SSN =~ ^[1-9][0-9]{2}[\ -]?[0-9]{2}[\ -]?[0-9]{4}$ ]] ;then
                return 0
        else
                return 1
        fi
}

