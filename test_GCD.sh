#!/bin/sh

tmp=/tmp/$$

ERROR_EXIT () {
  echo "$1" >&2
  rm -f $tmp-*
  exit 1
}

#test1 count argumens#
echo "Number of input is $#."'\n'"GCD.sh requires 2 integer inputs."> $tmp-ans
./GCD.sh 2> $tmp-err && ERROR_EXIT "TEST1-1"
diff $tmp-ans $tmp-err || ERROR_EXIT "TEST1-2"

#test2  accept argument 0#
echo "4" > $tmp-ans
./GCD.sh 4 0 >$tmp-out || ERROR_EXIT "TEST2-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST2-2"

#test3 only accept integers#
echo "Input is not number.\nGCD.sh requires 2 integer inputs."> $tmp-ans
./GCD.sh aaa 5.6 2> $tmp-err && ERROR_EXIT "TEST3-1"
diff $tmp-ans $tmp-err || ERROR_EXIT "TEST3-2"

#test4 make sure result of calclation
echo "20" > $tmp-ans
./GCD.sh 220 280 >$tmp-out || ERROR_EXIT "TEST4-1"
diff $tmp-ans $tmp-out || ERROR_EXIT "TEST4-2"


echo OK
rm -f $tmp-*
exit 0
