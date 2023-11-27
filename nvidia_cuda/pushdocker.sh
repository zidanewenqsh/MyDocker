#!/bin/bash
 prefix="registry.cn-hangzhou.aliyuncs.com/phzn"
 image='nvidia_cuda'
 version="cu102-cudnn7-devel-ubuntu18-v0.1.1"
 ImageId='342bea28f843'
tagcmd="docker tag ${ImageId} ${prefix}/${image}:${version}"
pushcmd="docker push ${prefix}/${image}:${version}"
echo $tagcmd
echo $pushcmd
eval "$tagcmd"
eval "$pushcmd"