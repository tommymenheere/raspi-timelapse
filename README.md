# raspi-timelapse
Raspberry Pi timelapse toolset

# Prequisites
Make sure the camera module is enabled with `sudo raspi-config`.

The following packages need to be installed on yoour Raspberry Pi:

- `git`
- `python3-picamera`
- `imagemagick`

Fo this, use the tool `apt-get`. Don't forget to update first: `sudo apt-get update`.

# Contents
    bin/
    	capture.sh
    	create_mp4.sh
    	fix-missing-jpg.sh
    	timelapse.sh
    crontab/
    	crontab.snippet
    init.d/
    	timelapse
