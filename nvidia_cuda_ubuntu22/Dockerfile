FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu18.04 
LABEL author=wen \
        version=0 \
        description='nvidia_cuda 11.8'
# FROM nvidia/cuda:12.3.2-cudnn9-devel-ubuntu22.04 
# LABEL author=wen \
#         version=0 \
#         description='nvidia_cuda 12.3 ubuntu22'

    
# nvidia/cuda
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

# apt install
RUN apt-get clean && apt-get update --fix-missing && apt-get upgrade -y 

RUN apt install -y wget curl openssh-server vim gcc g++ make automake cmake gdb zip sudo git net-tools build-essential telnet ufw \
    && apt-get autoclean  \
    && apt-get autoremove

# ssh
# 修改ssh配置文件，文件位置/etc/ssh/sshd_config，添加允许所有主机连接，
RUN mkdir -p /var/run/sshd \
        && sed -i '1iPermitRootLogin yes' /etc/ssh/sshd_config
# 开放22端口
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]

# xrdp
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y language-pack-zh-han* \
    && apt install -y language-pack-gnome-zh-han* \
    && apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils \
    && apt install -y xrdp

# root password
RUN echo "root:0"|chpasswd

# user
RUN useradd -r -ms /bin/bash ai \
    && adduser ai sudo \
    && echo "ai:1"|chpasswd \
    && groupadd docker \
    && gpasswd -a ai docker
