# FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu18.04 
FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu18.04 
LABEL author=wen \
        version=0 \
        description='nvidia_cuda 11.8'

# nvidia/cuda
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

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
# RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
#     echo "root:YOUR_PASSWORD" | chpasswd
# ssh
# 修改ssh配置文件，文件位置/etc/ssh/sshd_config，添加允许所有主机连接，
RUN mkdir -p /var/run/sshd \
    && sed -i '1iPermitRootLogin yes' /etc/ssh/sshd_config \
    && echo "root:0" | chpasswd

# # 设置XRDP来启动XFCE
# RUN echo "xfce4-session" > /etc/skel/.xsession \
#     && echo "xfce4-session" > /etc/skel/.Xclients \
#     && cp /etc/skel/.xsession /root/ \
#     && cp /etc/skel/.Xclients /root/ \
#     && chmod +x /root/.xsession \
#     && chmod +x /root/.Xclients

# 为SSH和XRDP开放端口
EXPOSE 22 3389

# 添加启动脚本
# RUN printf "#!/bin/bash\nservice ssh start\nservice xrdp start\nsleep infinity\n" > /start.sh && \
#     chmod +x /start.sh
RUN printf "#!/bin/bash\nservice xrdp restart\nservice ssh start\nservice xrdp start\nsleep infinity\n" > /start.sh && \
    chmod +x /start.sh
# 设置容器启动时运行的命令
CMD ["/start.sh"]

# # user
# RUN useradd -r -ms /bin/bash ai \
#     && adduser ai sudo \
#     && echo "ai:1"|chpasswd \
#     && groupadd docker \
#     && gpasswd -a ai docker

