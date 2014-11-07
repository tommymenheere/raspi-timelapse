#!/bin/bash

max=`ls ?????.jpg | tail -1  | sed 's/.jpg//g' `
echo "Max file number: $max"
prev=00001.jpg
for i in $(seq 0 $max)
do
	file=`printf "%05d.jpg" $i`
	if [ ! -f $file ] ;
	then
		echo cp $prev $file
		cp $prev $file
	fi
	prev=$file
done
