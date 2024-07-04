#!/bin/bash
docker run -d --gpus all --name temp -p 10022:22 -p 13389:3389 -v /home/shixian/Downloads:/temp/Downloads \
    nvidia_cuda:11.8.0-cudnn8-devel-ubuntu18.04-v1.0.2.6