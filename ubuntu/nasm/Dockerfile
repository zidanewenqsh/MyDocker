# 使用官方Ubuntu 22.04基础镜像
FROM ubuntu:18.04
LABEL author=wen \
        version=0 \
        description='ubuntu 18 xrdp xfce4'

# nvidia/cuda
ARG DEBIAN_FRONTEND=noninteractive

# #  change resource 换清华源
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list \
    && sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list       
    
# apt install
RUN apt-get clean && apt-get update --fix-missing && apt-get upgrade -y 

# # # 更新系统并安装XRDP, XFCE环境，以及SSH
RUN apt-get install -y sudo openssh-server \
    && apt install -y language-pack-zh-han* \
    && apt install -y language-pack-gnome-zh-han* \
    && apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils \
    && apt install -y xrdp \
    && apt-get autoclean  \
    && apt-get autoremove

RUN apt install -y  wget curl vim gcc g++ make automake cmake gdb zip git net-tools build-essential telnet ufw \
    && apt-get autoclean  \
    && apt-get autoremove
    
# # 配置SSH允许Root登录
# 修改ssh配置文件，文件位置/etc/ssh/sshd_config，添加允许所有主机连接，
RUN mkdir -p /var/run/sshd \
    && sed -i '1iPermitRootLogin yes' /etc/ssh/sshd_config \
    && echo "root:0" | chpasswd

# 为SSH和XRDP开放端口
EXPOSE 22 3389

# 添加启动脚本
# RUN printf "#!/bin/bash\nservice ssh start\nservice xrdp start\nsleep infinity\n" > /start.sh && \
    # chmod +x /start.sh
RUN printf "#!/bin/bash\nservice xrdp restart\nservice ssh start\nservice xrdp start\nsleep infinity\n" > /start.sh && \
    chmod +x /start.sh

# 设置容器启动时运行的命令
CMD ["/start.sh"]

# user
RUN useradd -r -ms /bin/bash ai \
    && adduser ai sudo \
    && echo "ai:1"|chpasswd \
    && groupadd docker \
    && gpasswd -a ai docker
# # 安装nasm
# RUN apt-get install nasm
# # 安装bochs
# RUN apt-get install libx11-dev libc6-dev build-essential xorg-dev libgtk2.0-dev libreadline-dev
# # 安装qemu
# RUN apt-get install qemu