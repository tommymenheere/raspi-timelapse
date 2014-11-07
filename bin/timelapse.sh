#!/bin/bash

ROOT=/vol/data/timelapse
DIR=$ROOT/$(date +"%Y/%m/%d")
INTERVAL=10
NEXT=0

echo `date +"%y%m%m %H:%M:%S"` Started 

if (cd $DIR ; ls *.jpg ) > /dev/null 2>&1 ;
then
        LAST=$(cd $DIR ; ls -r ?????.jpg | head -1 | sed 's/.jpg//g')
        NEXT=$((10#$LAST + 1 ))
else
        NEXT=0
fi

# Create screenshot
while true ;
do
	DIR=$ROOT/$(date +"%Y/%m/%d")
	if [ ! -d $DIR ]; then
  		mkdir -p $DIR
		NEXT=0
		echo `date +"%y%m%m %H:%M:%S"` created dir $DIR
	fi
	/home/pi/bin/capture.sh $DIR $NEXT >> ~/log/timelapse.log 2>&1 &
	NEXT=$(( 10#$NEXT + 1 ))
	sleep $INTERVAL
done

