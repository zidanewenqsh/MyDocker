#!/bin/bash
prefix="registry.cn-beijing.aliyuncs.com/phzn"
image='ubuntu'
version="18.04-xrdp-nasm-v1"
ImageId='ad0cc88f7209d'
tagcmd="docker tag ${ImageId} ${prefix}/${image}:${version}"
pushcmd="docker push ${prefix}/${image}:${version}"
echo $tagcmd
echo $pushcmd
eval "$tagcmd"
eval "$pushcmd"