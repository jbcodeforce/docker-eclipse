#!/bin/bash
# --name eclipse
ipad=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ipad
export DISPLAY=$ipad:0
docker run  -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/home/developer/workspace jbcodeforce/eclipse eclipse