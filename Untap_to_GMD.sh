#!/bin/bash

function close(){

	echo -e "Closing without changes.\n"

exit 2;}

if [ -z "$1" ] ; then echo -e "\nPlease, type ./Untap_to_GMD.sh <file to be translated>"; close; fi
if [ ! -e "$1" ] ; then echo -e "\nFile $1 not found."; close; fi

echo -e "\Switching $1 from Untap Magic deck to Generic Magic Deck (GMD)..."

{ cat "$1" | sed 's/(/'##'/'; }  >".Temp_toGMD"
sed -i 's/\//'##'/' ".Temp_toGMD"
{ cat ".Temp_toGMD" | cut -d# -f1; } >"${1%.txt}_GMD.txt"
rm ".Temp_toGMD"

echo -e "################################################\nFile ${1%.txt}_GMD.txt successfully done!\n"
exit 0;
