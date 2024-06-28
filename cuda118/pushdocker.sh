#!/bin/bash
prefix="registry.cn-beijing.aliyuncs.com/phzn"
image='nvidia_cuda'
version="11.8.0-cudnn8-devel-ubuntu18.04-v1.0.1"
ImageId='2b4e8c9b8eac'
tagcmd="docker tag ${ImageId} ${prefix}/${image}:${version}"
pushcmd="docker push ${prefix}/${image}:${version}"
echo $tagcmd
echo $pushcmd
eval "$tagcmd"
eval "$pushcmd"