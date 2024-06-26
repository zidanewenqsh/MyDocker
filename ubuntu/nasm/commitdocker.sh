#!/bin/bash
image='registry.cn-hangzhou.aliyuncs.com/phzn/ubuntu'
version="18.04-xrdp-nasm-v1"
ImageId='17415ad387ab'
commitcmd="docker commit -a \"wen\" -m \"nasm firefox clion vscode\" ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"