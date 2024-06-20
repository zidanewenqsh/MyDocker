#!/bin/bash
image='registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda'
version="pcl-grpc-trtpy-cu113-cudnn8-devel-ubuntu18-v3.2.4"
ImageId='f150b2bcb9d2'
commitcmd="docker commit -a \"wen\" -m \"pcl\" ${ImageId} ${image}:${version}"
echo $commitcmd
# eval "$commitcmd"