#!/bin/bash

ROOT=/Volumes/Data2/timelapse/
DIR=$ROOT/$(date +"%Y/%m/%d")
INTERVAL=10
NEXT=0
HOST=strangelove.local
USER=tommym

export HOST
export USER
export PATH=/usr/bin:$PATH

PRG_DIR=$(dirname $0)
 
echo `date +"%Y%m%d %H:%M:%S"` Started 

if ssh $USER@$HOST ls $DIR/*.jpg > /dev/null 2>&1 ;
then
        LAST=$(ssh $USER@$HOST "cd $DIR ; ls -r ?????.jpg" | head -1 | sed 's/.jpg//g')
        NEXT=$((10#$LAST + 1 ))
else
        NEXT=0
fi

if [ ! -d log ]; then
	mkdir log
fi

# Create screenshot
while true ;
do
	DIR=$ROOT/$(date +"%Y/%m/%d")
	
	if ! ssh $USER@$HOST ls $DIR; then
  		ssh $USER@$HOST mkdir -p "$DIR"
		NEXT=0
		echo `date +"%y%m%m %H:%M:%S"` created dir $USER@$HOST:$DIR  
	fi
	/bin/bash ${PRG_DIR}/capture.sh $DIR $NEXT 2>&1 &
	NEXT=$(( 10#$NEXT + 1 ))
	sleep $INTERVAL
done

