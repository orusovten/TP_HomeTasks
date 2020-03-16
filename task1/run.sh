#!/bin/bash
mkdir $3
a=$(find $1 -depth -name "*.$2")
n=0
sep="_"
for file in $a
do
fname=$(basename -s .$2 $file)
cp $file $3/"$fname$sep$n.$2"
n=$(($n+1))
done

tar -czf $4 $3

echo "done"

