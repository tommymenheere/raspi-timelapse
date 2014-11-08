#!/bin/sh

pgrep raspistill > /dev/null && echo `date +”%Y-%m-%d %H:%M:%S"` raspistill running && exit 0

DIR=$1
NEXT=$2
TMP_FILE=$(printf "tmp_%05d.jpg" $NEXT )
FILE=$(printf "%05d.jpg" $NEXT )
DATE=`date +"%Y-%m-%dT%H:%M:%S%z"`
raspistill -w 960 -h 720 -n -o $DIR/$TMP_FILE && echo `date +”%Y-%m-%d %H:%M:%S"` captured to $DIR/$TMP_FILE && convert -font courier-bold -fill yellow -pointsize 36 -draw "text 15,710 'NIJMEGEN $DATE'" $DIR/$TMP_FILE $DIR/$FILE && echo `date +”%Y-%m-%d %H:%M:%S"` wrote file $DIR/$FILE && rm $DIR/$TMP_FILE
RETURN=$?
exit $RETURN
