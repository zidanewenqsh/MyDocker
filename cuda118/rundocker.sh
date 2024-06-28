#!/bin/bash
# docker run -d --rm  --name cu102 --gpus all -p 6022:22 -p 6089:3389 hjimi/nvidia/cuda:cu102-cudnn7-devel-ubuntu18.04-v0.1
# docker exec cu102 service xrdp restart

# docker run -it --rm --gpus all --name n22 -p 10022:22 -p 13389:3389 -v temp:/temp ubuntu:22.04-v0.1 bash
# docker run -d --rm --gpus all --name n22 -p 10022:22 -p 13389:3389 -v temp:/temp ubuntu:22.04-v0.1
# docker run -d --rm --gpus all --name n18 -p 10022:22 -p 13389:3389 -v temp:/temp ubuntu:18.04-v0
    # registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda:12.3.2-cudnn9-devel-ubuntu22.04-v0 
# docker stop temp
docker run -d --gpus all --name temp -p 10022:22 -p 13389:3389 -v /home/shixian/Downloads:/temp/Downloads \
    nvidia_cuda:11.8.0-cudnn8-devel-ubuntu18.04-v0.2.1