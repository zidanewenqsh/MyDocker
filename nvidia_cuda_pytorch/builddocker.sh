#!/bin/bash
docker build -f Dockerfile -t registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda:11.8.0-cudnn8-devel-ubuntu18.04-v0.1.1 .
# docker build -f Dockerfile_ub22 -t ubuntu:22.04-v0.2 .