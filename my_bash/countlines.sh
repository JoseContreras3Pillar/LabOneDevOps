#!/bin/bash
if [ $# -eq 0 ]; then
   echo "Invalid Arguments 1"
   exit 1
fi

while getopts ":o:m: vh" opt; 
do
case $opt in
   o) echo "Looking for files where the owner is: "$OPTARG;;
   m) echo "Looking for file where the month is: "$OPTARG;;
   \?) echo "Invalid Arguments"
	exit 1;;
   :) echo "Invalid Arguments"
	exit 1;;
esac
done

for file in /home/jcontreras/my_bash/*
do
name=$(stat -c %n $file)
lines=$(wc -l $file) 
awk -v myRoot=$(stat -c %n $file) -v b="$lines" 'BEGIN{print "File:",myRoot ,"Lines: ", b}'
done
