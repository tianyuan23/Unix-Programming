#!/bin/tcsh -f
#Script name: Lab5_1.sh
#Author: Tianyuan Li
#Date: 04/09/2018
#Description: sed commands to modify a databook.

#1. Change the name Jon to John.
sed 's/Jon/John/g' datebook.txt

#2. Append three asterisks to the end of lines starting with Fred.
sed '/^Fred/s/$/***/' datebook.txt

#3. Replace the line containing Jose with "JOSE HAS RETIRED".
sed 's/^Jose.*/JOSE HAS RETIRED/g' datebook.txt

#4. Change Popeye's birthday to 11/14/46. Assume you don't know Popeye's original birthday. Use a regular expression to search for it.
sed '/Popeye/s,[0-9]\+/[0-9]\+/[0-9]\+,11/14/46,' datebook.txt

#5. Delete the first two lines.
sed '1,2d' datebook.txt

#6. Delete lines containing Lane.
sed '/Lane/d' datebook.txt

#7. Print lines 2 through the last.
sed -n '2,$p' datebook.txt

#8. Print all lines where the birthdays are in December or January.
sed -n '/:\(12\|1\)\/[0-9]\+\/[0-9]\+/p' datebook.txt

