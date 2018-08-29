#!/bin/tcsh -f 
#Script name: guess.sh
#Author: Tianyuan Li
#Date: 03/27/2018
#Description: A tcsh script that plays guessing number game

echo "guess the number"	#output "guess the number" in terminal
set answer = $<	#get user answer

set goal=`tr -dc A-Za-z0-9 < /dev/urandom | od -d | head -c 10 | tr -d 0 | tr -d ' '`	#set goal to a random number

set count = 1 #set round count to 1
while ($answer != $goal) #while answer is not equal to goal
	if ($answer < $goal ) then
		echo "too small" #output "too small" if answer is smaller than goal
	else
		echo "too large" #output "too large" if answer is larger than goal
	endif
	@ count ++ #round increment
	set answer = $< #get user answer
end

echo "correct!" #output "correct!" in terminal
echo "using $count rounds" #output how many rounds the user used
