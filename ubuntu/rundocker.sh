#!/bin/bash
# docker run -d --rm --name ubuntu --shm-size 16g --gpus all -p 5022:22 ubuntu:18.04-v0
# docker run -d --rm --name ubuntubuild --shm-size 16g  -p 3022:22  ubuntu:base-ai-18.04-v0
# docker run -it --name abc -p 13000:8080 -p 13001-13010:13001-13010 -v /home/wenquanshan/ZeroVoice/resty-course:/workspace bitnami/openresty:latest bash
docker run -it --rm --name ub -v /home/wenquanshan/ZeroVoice:/workspace b99ec5f190fb bash
