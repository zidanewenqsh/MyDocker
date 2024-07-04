#!/bin/bash
# image='registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda'
image='nvidia_cuda'
version="11.8.0-cudnn8-devel-ubuntu18.04-v1.0.2.10"
ImageId='f16f974fdc4f'
commitcmd="docker commit -a \"wen\" -m \"firefox+chinese+baidupinyin+chrome+vscode+pytorch+userai+cmake+opencv+open3d+pcl+grpc+tensorrt+clash+docker+other2\" \
    ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"