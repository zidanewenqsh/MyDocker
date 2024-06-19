FROM pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel AS torch_env

FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu18.04 
LABEL author=wen \
        version=0 \
        description='nvidia_cuda'

#  change resource 换阿里源
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list       

# nvidia/cuda
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

# apt install
RUN apt-get clean && apt-get update --fix-missing && apt-get upgrade -y 

RUN apt install -y  wget curl openssh-server  vim gcc g++ make automake cmake gdb  zip sudo git net-tools \
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

COPY --from=torch_env /opt/conda /opt/conda
# root password
RUN echo "root:0"|chpasswd

# root config
RUN mkdir ~/.pip \
&& echo '[global]\n\
index-url=https://pypi.tuna.tsinghua.edu.cn/simple\n\
[install]\n\
trusted-host=pypi.tuna.tsinghua.edu.cn\n'>>~/.pip/pip.conf

RUN echo '\n\
__conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"\n\
if [ $? -eq 0 ]; then\n\
    eval "$__conda_setup"\n\
else\n\
    if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then\n\
        . "/opt/conda/etc/profile.d/conda.sh"\n\
    else\n\
        export PATH="/opt/conda/bin:$PATH"\n\
    fi\n\
fi\n\
unset __conda_setup\n'\
 >> ~/.bashrc 

RUN echo '\n\
source /usr/share/autojump/autojump.sh\n\
'>>~/.bashrc && bash -c "source ~/.bashrc"
