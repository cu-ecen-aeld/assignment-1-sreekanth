#!/bin/sh
# Writer script
# Author: Sreekanth P
set -e
set -u

#Error handler
handleError() {
  #Provide warning and exit early on 
  #any error detection
  if [ $1 -gt 0 ];
  then
   echo "ERROR: while writing to file ($1)"
   exit 1
  fi
}
trap 'handleError $?' EXIT ABRT

#Write function
writeFun() {
  #check enough args passed in
	if [ $# -eq  2 ];
	then
		WRITEFILE=$1
		WRITESTR=$2
	else
		echo "Usage: $0 <full-path-to-file> <text-string-to-write>"
		exit 1
	fi

	#create dir for file if it doesnt exist already
  #otherwise redirection isnt able to create the file
	#return error from the echo command
	mkdir -p `dirname ${WRITEFILE}`
	echo ${WRITESTR} > ${WRITEFILE}
}

#pass on all command line args 
writeFun $*
