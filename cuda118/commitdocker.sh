#!/bin/bash
image='registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda'
version="11.8.0-cudnn8-devel-ubuntu18.04-v1"
ImageId='de0bbe82a2f7'
commitcmd="docker commit -a \"wen\" -m \"xrdp\" ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"