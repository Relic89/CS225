#!/bin/bash

Source=$( tail -n1 /var/share/CS225/addresses.csv )

Source=${Source#\"}
FNAME=${Source%%\"*}
Source=${Source#*,\"}
LNAME=${Source%%\"*}
Source=${Source#*,\"}
COMPANY=${Source%%\"*}
Source=${Source#*,\"}
STREET=${Source%%\"*}
Source=${Source#*,\"}
CITY=${Source%%\"*}
Source=${Source#*,\"}
COUNTY=${Source%%\"*}
Source=${Source#*,\"}
STATE=${Source%%\"*}
Source=${Source#*,\"}
ZIP=${Source%%\"*}
Source=${Source#*,\"}
HPHONE=${Source%%\"*}
Source=${Source#*,\"}
WPHONE=${Source%%\"*}
Source=${Source#*,\"}
EMAIL=${Source%%\"*}
Source=${Source#*,\"}
WEBURL=${Source%%\"*}

echo "First Name: 	$FNAME"
echo "Last Name:	$LNAME"
echo "Company:  	$COMPANY"
echo "Street:		$STREET"
echo "City:		$CITY"
echo "State:		$STATE"
echo "Zip:		$ZIP"
echo "HPhone:		$HPHONE"
echo "WPhone:		$WPHONE"
echo "Email:		$EMAIL"
echo "WebURL:		$WEBURL"
