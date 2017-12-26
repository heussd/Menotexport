#!/bin/bash
# Helps to find the right mendeley.sqlite-DB, also changes order of parameter switches 

mendeleydb="$(ls "$1"/*www.mendeley.com.sqlite)"
if [ ! -e "$mendeleydb" ]; then
	echo "Mendeley database not found at location $1, cannot continue."
	echo "Directory listing of $1:"
	ls $1
	exit 1
fi
shift

outputfolder=$1
if [ ! -d "$outputfolder" ]; then
	echo "Output folder not found: $1"
	exit 1
fi
shift

python menotexport.py $* "$mendeleydb" "$outputfolder"