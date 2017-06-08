#!/bin/sh

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

#echo "Big = $big"
#echo "Small = $small"

ans=`expr $big % $small`
while [ $ans -ne 0 ]
do
	big=$small
	small=$ans
	ans=`expr $big % $small`
#	echo $small
done

echo $small
