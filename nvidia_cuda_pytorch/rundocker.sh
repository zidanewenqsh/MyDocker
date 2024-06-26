#!/bin/bash
docker stop n18
# docker run -d --rm --gpus all --name n18 -p 10022:22 -p 13389:3389 -v $PWD/temp:/temp registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda:11.8.0-cudnn8-devel-ubuntu18.04-v0.1.1 
docker run -d --rm --gpus all --name n18 -p 10022:22 -p 13389:3389 -v /home/shixian/Downloads:/temp/Downloads registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda:11.8.0-cudnn8-devel-ubuntu18.04-v0.1.1 