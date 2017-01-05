#!/bin/bash

pgrep raspistill > /dev/null && echo `date +"%Y-%m-%d %H:%M:%S"` raspistill running && exit 0

if [ $# -ne 2 ]; then
	echo "usage $0 <path> <next>"
	exit 1
fi

DIR=$1
NEXT=$2
FILE=$(printf "%05d.jpg" $NEXT )
DATE=`date +"%Y-%m-%dT%H:%M:%S%z"`
raspistill -w 960 -h 720 -n -o - | convert - -font courier-bold -fill yellow -pointsize 36 -draw "text 15,710 'NIJMEGEN $DATE'" fd:1 |  ssh $USER@$HOST "cat - > $DIR/$FILE" 
echo "wrote $USER@$HOST:$DIR/$FILE" 
RETURN=$?
exit $RETURN
