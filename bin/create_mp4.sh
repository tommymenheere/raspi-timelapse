#!/bin/bash
ROOT=/vol/data/timelapse
INPUT_DIR=$ROOT/$(date --date yesterday +"%Y/%m/%d")
OUTPUT_FILE=$ROOT/$(date --date yesterday +"%Y-%m-%d").mp4

echo "Reading input files from $INPUT_DIR"

echo "Checking for missing files ..."
(cd $INPUT_DIR && ~/bin/fix-missing-jpg.sh )

echo "Creating $OUTPUT_FILE ... "
time gst-launch-1.0 multifilesrc location=$INPUT_DIR/%05d.jpg index=1  ! image/jpeg, framerate=60/1 ! decodebin ! progressreport name=progress ! omxh264enc target-bitrate=1000000 control-rate=variable ! video/x-h264, profile=high ! h264parse ! mp4mux ! filesink location=$OUTPUT_FILE

echo "Done." 
