#!/bin/bash

trap "echo I\'m sorry Dave" SIGINT

cleanup()
{
	rm -Rf $TMP
}

test()
{
	local FIRSTVAR="$VAR"
	echo "$FIRSTVAR"
}

VAR="five"
test #five
#echo "\$1 is $1"
