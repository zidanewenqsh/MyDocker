#!/bin/bash
image='registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda'
version="11.8.0-cudnn8-devel-ubuntu18.04-v1.2"
ImageId='fa44f1e20357'
commitcmd="docker commit -a \"wen\" -m \"proxy+docker+xrdp+zsh\" ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"