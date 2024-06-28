#!/bin/bash

# 停止脚本执行当命令返回非零返回码
set -e

# 移除可能已安装的旧版本Docker
sudo apt-get remove -y docker docker-engine docker.io

# 安装依赖包
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

# 添加Docker官方GPG密钥
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# 添加Docker CE仓库
sudo add-apt-repository "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

# 更新apt包索引
sudo apt-get update

# 安装Docker CE
sudo apt-get install -y docker-ce

# 显示Docker版本
sudo docker --version

# 安装NVIDIA-Docker
distribution=$(. /etc/os-release; echo $ID$VERSION_ID) && \
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - && \
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list && \
curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list

# 更新软件包索引
sudo apt-get update

# 安装nvidia-docker2
sudo apt-get install -y nvidia-docker2

# 重启Docker服务
sudo pkill -SIGHUP dockerd
sudo systemctl restart docker

echo "安装完成"
