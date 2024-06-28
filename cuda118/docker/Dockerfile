# 基于 NVIDIA 的 CUDA 镜像
FROM nvidia_cuda:11.8.0-cudnn8-devel-ubuntu18.04-v0.2.1

# 安装Docker依赖
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common

# 添加Docker的官方GPG密钥
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# 添加Docker CE的仓库
RUN add-apt-repository "deb [arch=amd64] https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu $(lsb_release -cs) stable"

# 更新软件包并安装Docker CE
RUN apt-get update && apt-get install -y docker-ce

# 安装NVIDIA Docker
RUN distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && \
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add - && \
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | tee /etc/apt/sources.list.d/nvidia-docker.list && \
    curl -s -L https://nvidia.github.io/nvidia-container-runtime/experimental/$distribution/nvidia-container-runtime.list | tee /etc/apt/sources.list.d/nvidia-container-runtime.list

# 更新软件包源并安装nvidia-docker2
RUN apt-get update && apt-get install -y nvidia-docker2

# 重新启动Docker服务
RUN pkill -SIGHUP dockerd && systemctl restart docker

