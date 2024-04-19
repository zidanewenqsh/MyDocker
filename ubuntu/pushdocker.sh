#!/bin/bash
 prefix="registry.cn-hangzhou.aliyuncs.com/phzn"
 image='ubuntu'
 version="18.04-v0.1"
 ImageId='f35768b8f35b'
tagcmd="docker tag ${ImageId} ${prefix}/${image}:${version}"
pushcmd="docker push ${prefix}/${image}:${version}"
echo $tagcmd
echo $pushcmd
eval "$tagcmd"
eval "$pushcmd"