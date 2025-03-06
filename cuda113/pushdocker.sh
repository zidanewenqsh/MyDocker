#!/bin/bash
prefix="registry.cn-hangzhou.aliyuncs.com/phzn"
image='nvidia_cuda'
# version="pcl-grpc-trtpy-cu113-cudnn8-devel-ubuntu18-v3.2.4"
version="java-open3d-pcl-grpc-trtpy-cu113-cudnn8-devel-ubuntu18-v3.3.1"
ImageId='1819cfb7af'
tagcmd="docker tag ${ImageId} ${prefix}/${image}:${version}"
pushcmd="docker push ${prefix}/${image}:${version}"
echo $tagcmd
echo $pushcmd
# eval "$tagcmd"
eval "$pushcmd"