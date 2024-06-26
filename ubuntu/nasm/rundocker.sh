#!/bin/bash
# docker run -it --rm --gpus all --name n22 -p 10022:22 -p 13389:3389 -u ai -v $PWD/temp:/temp ubuntu:18.04-xrdp-v0 bash
# docker run -d --rm --gpus all --name n22 -p 10022:22 -p 13389:3389 -v $PWD/temp:/temp ubuntu:18.04-xrdp-v0
# docker run -d --rm --gpus all --name n22 -p 10022:22 -p 13389:3389 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority:rw -v $PWD/temp:/temp ubuntu:18.04-xrdp-v0
# docker run -d --rm --gpus all --name n22 -p 10022:22 -p 13389:3389 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority:rw -v $PWD/temp:/temp ubuntu:18.04-xrdp-v0
# docker run -d --rm --name n22 --env="DISPLAY=:11" --env="QT_X11_NO_MITSHM=1" -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority:rw -v $PWD/temp:/temp ubuntu:18.04-xrdp-v0
docker run -d --rm --name n22 -p 10022:22 -p 13389:3389 --env="DISPLAY=localhost:10.0" --env="QT_X11_NO_MITSHM=1" -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority:rw -v $PWD/temp:/temp ubuntu:18.04-xrdp-v0
