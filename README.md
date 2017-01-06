# raspi-timelapse
Raspberry Pi timelapse toolset. This simple tool creates a screenshot every 10 seconds and copies it (using `scp`) to a defined location on a host.

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

# Install as service
To install as a service, do the following:

	sudo update-rc.d /etc/init.d/timelapse defaults

The service can now be controlled using the `service` command.

# Todo
- Settings file
