#!/bin/bash
prefix="registry.cn-beijing.aliyuncs.com/phzn"
image='nvidia_cuda'
version="11.8.0-cudnn8-devel-ubuntu18.04-v1.0.3.1"
ImageId='2e5f5ad'
tagcmd="docker tag ${ImageId} ${prefix}/${image}:${version}"
pushcmd="docker push ${prefix}/${image}:${version}"
echo $tagcmd
echo $pushcmd
eval "$tagcmd"
eval "$pushcmd"