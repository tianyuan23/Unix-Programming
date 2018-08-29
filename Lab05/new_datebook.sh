#!/bin/tcsh -f
#Script name: new_datebook.sh
#Author: Tianyuan Li
#Date: 04/09/2018
#Description: sed commands to modify a databook and save it to a file new_datebook.txt.

#1. Change the name Jon to John.
sed 's/Jon/John/g' datebook.txt > new_datebook.txt

#2. Append three asterisks to the end of lines starting with Fred.
sed -i '/^Fred/s/$/***/' new_datebook.txt

#3. Replace the line containing Jose with "JOSE HAS RETIRED".
sed -i 's/^Jose.*/JOSE HAS RETIRED/g' new_datebook.txt

#4. Change Popeye's birthday to 11/14/46. Assume you don't know Popeye's original birthday. Use a regular expression to search for it.
sed -i '/Popeye/s,[0-9]\+/[0-9]\+/[0-9]\+,11/14/46,' new_datebook.txt

#5. Delete the first two lines.
sed -i '1,2d' new_datebook.txt

#6. Delete lines containing Lane.
sed -i '/Lane/d' new_datebook.txt

#7. Print lines 2 through the last.
sed -i -n '2,$p' new_datebook.txt

#8. Print all lines where the birthdays are in December or January.
sed -i -n '/:\(12\|1\)\/[0-9]\+\/[0-9]\+/p' new_datebook.txt

