#!/bin/bash

if [ -d $1 ]
then
	echo  " $1 directory "
else
	if [ -e $1 ]
		then
			echo  "$1 files"
		else
			echo "not exist"
	fi
fi



