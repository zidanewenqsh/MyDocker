#!/bin/bash
image='registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda'
version="java-open3d-pcl-grpc-trtpy-cu113-cudnn8-devel-ubuntu18-v3.3.1"
ImageId='0d86c608adf4'
commitcmd="docker commit -a \"wen\" -m \"java\" ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"