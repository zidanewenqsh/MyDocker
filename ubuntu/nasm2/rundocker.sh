#!/bin/bash
docker run -d --rm --name nasm -p 10022:22 -p 13389:3389 --env="DISPLAY=localhost:10.0" --env="QT_X11_NO_MITSHM=1" -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/root/.Xauthority:rw -v $PWD/temp:/temp registry.cn-hangzhou.aliyuncs.com/phzn/ubuntu:18.04-xrdp-ai-nasm-v0.2.3 
docker exec nasm service xrdp restart