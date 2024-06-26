# FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu18.04 
FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu18.04 
LABEL author=wen \
        version=0 \
        description='nvidia_cuda 11.8'

#  change resource 换阿里源
# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
#     sed -i 's/security.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list       

# #  change resource 换清华源
RUN sed -i 's/archive.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list && \
    sed -i 's/security.ubuntu.com/mirrors.tuna.tsinghua.edu.cn/g' /etc/apt/sources.list       
    
# nvidia/cuda
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A4B469963BF863CC

# apt install
RUN apt-get clean && apt-get update --fix-missing && apt-get upgrade -y 

RUN apt install -y  wget curl openssh-server vim gcc g++ make automake cmake gdb  zip sudo git net-tools \
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

#conda
# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O conda.sh
RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O conda.sh \
    && /bin/bash conda.sh -b -p /opt/conda \
    && rm conda.sh
    # && /opt/conda/bin/conda clean -tipsy

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
'>>~/.bashrc 

# apt install
RUN apt update \ 
    && apt install -y zsh screen autojump firefox ttf-wqy-zenhei \
    && apt  install -y locales xfonts-intl-chinese fonts-wqy-microhei \
    && apt install -y fcitx fcitx-googlepinyin \
    && apt install -y xdg-user-dirs-gtk \
    && apt-get autoclean \
    && apt-get autoremove

RUN  apt update \
    && apt install -y ctags \
    && apt install -y telnet \
    && apt install -y mysql-server \
    && apt install -y redis-server \
    && apt install -y libmysqlclient-dev \
    && apt install -y qt5-default qtcreator \
    && apt-get autoclean \
    && apt-get autoremove

# chrome 进去后打不开, 已经解决，最后不应该修改$(which google-chrome-stable)，因为是软链接
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb \
    && apt install fonts-liberation libu2f-udev libvulkan1 \
    && dpkg -i google-chrome.deb \
    && rm google-chrome.deb \
    && sed -i '/exec -a "$0" "$HERE\/chrome" "$@"/s/\(exec -a "$0" "$HERE\/chrome" "$@"\)/\1 --user-data-dir --no-sandbox --disable-dev-shm-usage/g' /opt/google/chrome/google-chrome

# vscode 
RUN wget https://az764295.vo.msecnd.net/stable/ee2b180d582a7f601fa6ecfdad8d9fd269ab1884/code_1.76.2-1678817801_amd64.deb -O vscode.deb \
    && dpkg -i vscode.deb \
    && rm vscode.deb \
    && sed -i '/Exec/s/\(Exec=\/usr\/share\/code\/code \S*\) %F/\1 --no-sandbox %F/g' /usr/share/applications/code.desktop

# # condabin
# # ARG CONDABIN=/opt/conda/bin
# RUN /opt/conda/bin/python -m pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 --extra-index-url https://download.pytorch.org/whl/cu113 \
#     && /opt/conda/bin/python -m pip install opencv-contrib-python==4.5.5.64 \
#     && /opt/conda/bin/python -m pip install opencv-contrib-python-headless==4.5.5.64 \
#     && /opt/conda/bin/python -m pip install opencv-python==4.5.5.64 \
#     && /opt/conda/bin/python -m pip install pyqt5 \
#     && /opt/conda/bin/python -m pip install pyqt5-tools \
#     && /opt/conda/bin/python -m pip install eric-ide==20.12.1

# user
RUN useradd -r -ms /bin/bash ai \
    && adduser ai sudo \
    && echo "ai:1"|chpasswd \
    && groupadd docker \
    && gpasswd -a ai docker


# config
USER ai

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
'>>~/.bashrc 

USER root