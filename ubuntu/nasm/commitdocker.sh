#!/bin/bash
image='registry.cn-beijing.aliyuncs.com/phzn/ubuntu'
version="18.04-xrdp-nasm-v1"
ImageId='e46cc49230ff'
commitcmd="docker commit -a \"wen\" -m \"nasm firefox clion\" ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"