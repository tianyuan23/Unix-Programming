#!/bin/tcsh -f 
#Script name: guess_game.sh
#Author: Tianyuan Li
#Date: 03/28/2018
#Description: A tcsh script that runs guessing game and keeps a record.

echo "1.Run the guessing game"
echo "2.Exit" #print the menu

set option = $< #get user option

while ($option != 1 && $option != 2) #deal with illegal option
	echo "Please enter the legal option"
	set option = $<
end

while ($option == 1)
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
	echo "$count" >> records.txt

	echo "1.Run the guessing game" 
	echo "2.Exit" #print the menu
	
	set option = $< #get user option
	
	while ($option != 1 && $option != 2) #deal with illegal user option
		echo "Please enter the legal option"
		set option = $<
	end
end

#compute the result of the game
set sumRounds = 0
set sumGame = 0

foreach line (`cat records.txt`)
	@ sumRounds = `expr $sumRounds + $line`
	@ sumGame ++
end
set average=`expr $sumRounds / $sumGame`

#print the reuslt of the game
echo "Existing the guessing game"
echo "Your average of rounds is: $average"
echo "Your scores are:"
foreach line (`cat records.txt`)
	echo $line
end
