#!/bin/bash
mkdir $3
a=$(find $1 -depth -name "*.$2")
n=0
for file in $a
do
cp $file $3/"$n.$2"
n=$(($n+1))
done

tar -czf $4 $3

echo "done"

