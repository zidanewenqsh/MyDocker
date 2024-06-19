#!/bin/bash
prefix="registry.cn-hangzhou.aliyuncs.com/phzn"
image='nvidia_cuda'
# version="pcl-grpc-trtpy-cu113-cudnn8-devel-ubuntu18-v3.2.4"
version="11.8.0-cudnn8-devel-ubuntu18.04-v1.2"
# ImageId='6cb5d4cfb862'
# tagcmd="docker tag ${ImageId} ${prefix}/${image}:${version}"
pushcmd="docker push ${prefix}/${image}:${version}"
# echo $tagcmd
echo $pushcmd
# eval "$tagcmd"
eval "$pushcmd"