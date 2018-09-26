#!/bin/bash

function close(){

	echo -e "Closing without changes.\n"

exit 2;}

if [ -z "$1" ] ; then echo -e "\nPlease, type ./Xmage_to_GMD.sh <file to be translated>"; close; fi
if [ ! -e "$1" ] ; then echo -e "\File $1 not found."; close; fi

echo -e "\Switching $1 from Xmage Deck to Generic Magic Deck (GMD)..."

{ cat "$1" | sed '/^LAYOUT/d'; }  >".Temp_toGMD"
sed -i 's/\[.*\]//' ".Temp_toGMD"
sed -i "s/  / /" ".Temp_toGMD"
{ cat ".Temp_toGMD" | cut -d: -f2; } >"${1%.dck}_GMD.txt"
rm ".Temp_toGMD"

echo -e "################################################\nFile ${1%.txt}_GMD.txt successfully done!\n"
exit 0;
