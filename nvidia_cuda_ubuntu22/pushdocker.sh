#!/bin/bash
prefix="registry.cn-hangzhou.aliyuncs.com/phzn"
image='nvidia_cuda'
# version="pcl-grpc-trtpy-cu113-cudnn8-devel-ubuntu18-v3.2.4"
version="11.8.0-cudnn8-devel-ubuntu18.04-v0"
ImageId='005604e4b453'
tagcmd="docker tag ${ImageId} ${prefix}/${image}:${version}"
pushcmd="docker push ${prefix}/${image}:${version}"
echo $tagcmd
echo $pushcmd
# eval "$tagcmd"
# eval "$pushcmd"