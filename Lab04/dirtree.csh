#!/bin/tcsh -f
#Script name: dirtree.csh
#Author: Tianyuan Li
#Date: 03/28/2018
#Description: A tcsh script that prints directory tree

#set thisdir to the first argument if there is one
if($#argv == 0) then 
	set thisdir="."
else
	set thisdir=$argv[1] 
endif

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
