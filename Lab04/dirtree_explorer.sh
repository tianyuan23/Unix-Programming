#!/bin/tcsh -f
#Script name: dirtree_explorer.sh
#Author: Tianyuan Li
#Date: 03/28/2018
#Description: A tcsh script that prints directory tree with some options

#set thisdir to the first argument if there is one
if($#argv == 0) then
	set thisdir="."
else
	set thisdir=$argv[1]
	cd $thisdir #change to that directory
	set thisdir="."
endif

#print the menu
echo "The current directory is: `pwd`"
echo "1.Enter a directory name"
echo "2.Print the directory tree in the screen"
echo "3.Print the directory tree to a file"
echo "4.Exit"

set option = $< #get user option
#deal with illegal options
while ($option !~ [1-4])
	echo "Please enter the legal option"
	set option = $<
end

while ($option != 4)
	#deal with different options
	switch ($option)
	case 1:
		set thisdir = $<
		cd $thisdir #change to that directory
		set thisdir="."
		breaksw
	case 2:
		#set prefix to the tree prefix if there is one
		if($?TREEPREFIX) then
			set prefix="$TREEPREFIX"
		else
		set prefix=""
		endif

		echo "$prefix|"
		set filelist=`ls -A $thisdir` #set filelist to the list of file under current directory
		foreach file ($filelist)
			echo "${prefix}|------${file}" #print each file name under the directory
			#deal with any directory that is under the current directory
			if(-d "$thisdir/$file") then
				if($file == $filelist[$#filelist]) then
					setenv TREEPREFIX "${prefix}     "
				else
					setenv TREEPREFIX "${prefix}|    "
				endif
				echo $0 "$thisdir/$file" #print the script name along with the directory under the current directory
			endif
		end
		echo "$prefix" #print the prefix
		breaksw
	case 3:
		echo "Please enter the name of directory tree file"
		set fileName = $< #get directory tree file name from user
		if($?TREEPREFIX) then
			set prefix="$TREEPREFIX"
		else
		set prefix=""
		endif
		#print prefix to the directory tree file
		echo "$prefix|" >> $fileName
		set filelist=`ls -A $thisdir` 
		foreach file ($filelist)
			echo "${prefix}|------${file}" >> $fileName
			if(-d "$thisdir/$file") then
				if($file == $filelist[$#filelist]) then
					setenv TREEPREFIX "${prefix}     "
				else
					setenv TREEPREFIX "${prefix}|    "
				endif
				#print the script name along with the directory under the current directory to the directory tree file
				echo $0 "$thisdir/$file" >> $fileName
			endif
		end
		#print prefix to the directory tree file
		echo "$prefix" >> $fileName
		breaksw
	endsw
	#print the menu
	echo "The current directory is: `pwd`"
	echo "1.Enter a directory name"
	echo "2.Print the directory tree in the screen"
	echo "3.Print the directory tree to a file"
	echo "4.Exit"
	set option = $<
	#deal with illegal options
	while ($option !~ [1-4])
		echo "Please enter the legal option"
		set option = $<
	end
end

