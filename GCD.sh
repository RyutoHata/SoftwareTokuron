#!/bin/sh

#argument check#
if [ $# -ne 2 ]; then
  #this is output as error
  echo  "Number of input is $#.\nGCD.sh requires 2 integer inputs." 1>&2
  exit 1
fi

#integer check#
expr $1 + 1 > /dev/null 2>&1
RET1=$?
expr $2 + 1 > /dev/null 2>&1
RET2=$?

if [ $RET1 -ge 2 -o $RET2 -ge 2 ]; then
  echo "Input is not number.\nGCD.sh requires 2 integer inputs." 1>&2
  exit 1
fi

#Sorting#
if [ $1 -gt $2 ]
	then
#	echo "$1 is greater than $2"
	big=$1
	small=$2
else
#	echo "$1 is less than $2"
	big=$2
	small=$1
fi

#Euclid's algorithm#
if [ $small -ne 0 ]; then
  ans=`expr $big % $small`
  while [ $ans -ne 0 ]
  do
    big=$small
    small=$ans
    ans=`expr $big % $small`
  done
  echo $small
else
  echo $big
fi
