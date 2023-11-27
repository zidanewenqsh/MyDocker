#!/bin/bash
#  prefix="registry.cn-hangzhou.aliyuncs.com/phzn"
#  image='ubuntu'
#  version="18.04-v0"
# pullcmd="docker pull ${prefix}/${image}:${version}"
# echo $pullcmd
# eval "$pullcmd"

docker pull bitnami/openresty:latest
docker pull nginx