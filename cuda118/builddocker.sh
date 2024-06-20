#!/bin/bash
# docker build -f Dockerfile_v2 -t registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda:main-cu113-cudnn8-devel-ubuntu18-v3.1.2 .
# docker build -f Dockerfile_v2 -t hjimi/nvidia/cuda:py38-cu102-cudnn7-devel-ubuntu18.04-v0.2 .
docker build -f Dockerfile -t registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda:11.8.0-cudnn8-devel-ubuntu18.04-v0.1 .