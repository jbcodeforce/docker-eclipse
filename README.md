# A Docker image for Eclipse 

The goal is to provide a simple docker images to run eclipse for development.

## Prerequisites

You need to have docker installed on your machine.

If you use a MacOS or Windows platform you need a X11 server and socket connection to be installed. I used [Xquartz](https://www.xquartz.org/releases/index.html) on Mac to start the X11 Server. 

## Build

Clone this repository and build your local image using the provided `docker build -t <yourimagename> .`

This docker install, java, eclipse, ssh, X11 library...

## Run
To start the container, use the following script
```
./eclipse-2018.sh
```
The ubuntu image has ssh configured to allow X11 Forwarding.
