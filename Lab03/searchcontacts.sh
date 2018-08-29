#!/bin/bash
#Script name: searchcontacts.sh
#Author: Tianyuan Li
#Date: 03/05/2018
#Description: A bash script that searches in a contact file.

echo "Hello, $1 $2!"
echo "Today is $(date +"%A") and the current time is $(date +"%r")."
echo "These contacts are having a birthday today: "
grep "`date +"%d-%m"`" mycontacts.txt | awk '{ print $1, $2 }'

read -p "Enter a contact last name to search in file: " lName
if (grep -q ",\s$lName" mycontacts.txt)
then
    grep ",\s$lName" mycontacts.txt
else
    echo "No matches found."
    echo "The number of lines in mycontacts.txt is $(wc -l < mycontacts.txt)."
    echo "The contact file is sorted by last name."
    echo ""
    sort mycontacts.txt
fi

echo "Goodbye! The current hour is `date +"%H"`."
