#!/bin/bash

OLDIFS="$IFS"
IFS=$'\n'
Source=$( cat /var/share/CS225/addresses.csv )
COUNTER="0"
SCRIPT=${0##*/}

declare -a FNAME LNAME COMPANY ADDRESS CITY COUNTY STATE ZIP HPHONE WPHONE EMAIL WEBURL

trap "Invalid Input" SIGINT

for LINE in $Source ;do
LINE=${LINE#\"}
FNAME[$COUNTER]+=${LINE%%\"*} 

LINE=${LINE#*,\"}
LNAME[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
COMPANY[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
ADDRESS[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
CITY[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
COUNTY[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
STATE[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
ZIP[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
HPHONE[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
WPHONE[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
EMAIL[$COUNTER]+=${LINE%%\"*}

LINE=${LINE#*,\"}
WEBURL[$COUNTER]+=${LINE%%\"*}

echo \""${FNAME[$COUNTER]}"\",\""${LNAME[$COUNTER]}"\",\""${COMPANY[$COUNTER]}"\",\""${ADDRESS[$COUNTER]}"\",\""${CITY[$COUNTER]}"\",\""${COUNTY[$COUNTER]}"\",\""${STATE[$COUNTER]}"\",\""${ZIP[$COUNTER]}"\",\""${HPHONE[$COUNTER]}"\",\""${WPHONE[$COUNTER]}"\",\""${EMAIL[$COUNTER]}"\",\""${WEBURL[$COUNTER]}"\"

((COUNTER++))

done

IFS=$OLDIFS
