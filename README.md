# A Docker image for Eclipse 

The goal is to provide a simple docker images to run eclipse for development.

## Prerequisites

You need to have docker installed on your machine.

If you use a MacOS or Windows platform you need a X11 server and socket connection to be installed. I used [Xquartz](https://www.xquartz.org/releases/index.html) on Mac to start the X11 Server. 

## Build

Clone this repository and build your local image using the provided `docker build -t <yourimagename> .`

This docker install, java, eclipse, ssh, X11 library...

## Run
To start the container, you can modify the following script to use your image name and then:
```
./eclipse-2018.sh
```

The commands performed is to get the ipaddress, set the DISPLAY variable so eclipse in the conteainer which use X11 will display all the windows on my mac and call docker run by mounting the X11 socket, the workspace 
```
ipad=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
xhost + $ipad
export DISPLAY=$ipad:0
docker run  -ti -rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $(pwd):/home/developer/eclipse-workspace jbcodeforce/eclipse eclipse
```
The ubuntu image has ssh configured to allow X11 Forwarding.

The eclipse is very minimum, I may need to see how to add eclipse plugins in the Dockerfile, but to let you add plugins using the marketplace we need to mount a local folder to keep the plugins between session and the /home/developer/.eclipse within the container.
