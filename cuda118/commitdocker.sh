#!/bin/bash
# image='registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda'
image='nvidia_cuda'
version="11.8.0-cudnn8-devel-ubuntu18.04-v0.1.4"
ImageId='930c307f5b11'
commitcmd="docker commit -a \"wen\" -m \"firefox+chinese+baidupinyin+chrome+vscode\" ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"