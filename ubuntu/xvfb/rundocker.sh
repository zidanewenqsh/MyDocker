#!/bin/bash
docker run -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw --name xvfb --network host --ipc host -p 5900:5900 ubuntu:22.04_xvfb
