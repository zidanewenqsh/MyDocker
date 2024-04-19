#!/bin/bash
 image='nvidia_cuda'
 version="cu102-cudnn7-devel-ubuntu18-v0.1.1"
 ImageId='f2b7323c76ac'
commitcmd="docker commit -a \"wen\" -m \"zsh chinese\" ${ImageId} ${image}:${version}"
echo $commitcmd
eval "$commitcmd"