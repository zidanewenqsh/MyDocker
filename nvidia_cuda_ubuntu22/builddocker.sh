#!/bin/bash
# docker build -f Dockerfile -t registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda:12.3.2-cudnn9-devel-ubuntu22.04-v0 .
docker build -f Dockerfile_ub22 -t ubuntu:22.04-v0.1 .