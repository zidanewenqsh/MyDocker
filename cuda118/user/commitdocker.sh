#!/bin/bash
# image='registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda'
image='nvidia_cuda'
version="11.8.0-cudnn8-devel-ubuntu18.04-v1.0.1"
ImageId='52ec953deb4e'
commitcmd="docker commit -a \"wen\" -m \"firefox+chinese+baidupinyin+chrome+vscode+pytorch+userai\" ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"