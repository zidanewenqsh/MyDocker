#!/bin/bash
image='registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda'
version="open3d-pcl-grpc-trtpy-cu113-cudnn8-devel-ubuntu18-v3.2.5"
ImageId='51ae6e55eec3'
commitcmd="docker commit -a \"wen\" -m \"open3d\" ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"