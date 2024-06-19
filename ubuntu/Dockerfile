# FROM continuumio/anaconda3:2023.03-1 AS CONDA
# FROM registry.cn-hangzhou.aliyuncs.com/phzn/ubuntu:base-root-18.04-v0 
FROM registry.cn-hangzhou.aliyuncs.com/phzn/ubuntu:18.04-v0.1 
LABEL author=wen \
        version=0.1 \
        description='ubuntu ai xrdp'

# xrdp
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update \
    && apt install -y language-pack-zh-han* \
    && apt install -y language-pack-gnome-zh-han* \
    && apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils \
    && apt install -y xrdp

# user
RUN useradd -r -ms /bin/bash ai \
    && adduser ai sudo \
    && echo "ai:1"|chpasswd \
    && groupadd hjimi \
    && gpasswd -a ai hjimi

RUN apt update \
    && apt install -y git

# RUN cd /tmp && git clone https://github.com/Kitware/CMake.git
ADD CMake-3.25.0.tar.gz /tmp
RUN  cd /tmp/CMake-3.25.0 \
    && bash ./configure \
    && make -j8 \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/CMake-3.25.0

USER ai
# COPY --from=CONDA /opt/conda /home/ai/conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/conda.sh \
    && /bin/bash /tmp/conda.sh -b -p /home/ai/conda \
    && rm /tmp/conda.sh

RUN mkdir /home/ai/.pip \
&& echo '[global]\n\
index-url=https://pypi.tuna.tsinghua.edu.cn/simple\n\
[install]\n\
trusted-host=pypi.tuna.tsinghua.edu.cn\n'>>~/.pip/pip.conf

RUN echo '\n\
source /usr/share/autojump/autojump.sh\n\
'>>~/.bashrc 

RUN echo '\n\
__conda_setup="$('/home/ai/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"\n\
if [ $? -eq 0 ]; then\n\
    eval "$__conda_setup"\n\
else\n\
    if [ -f "/home/ai/conda/etc/profile.d/conda.sh" ]; then\n\
        . "/home/ai/conda/etc/profile.d/conda.sh"\n\
    else\n\
        export PATH="/home/ai/conda/bin:$PATH"\n\
    fi\n\
fi\n\
unset __conda_setup\n'\
 >> ~/.bashrc && bash -c "source /home/ai/.bashrc"

RUN echo '\n\
source /usr/share/autojump/autojump.sh\n\
'>>~/.bashrc 

USER root

# apt install
RUN apt update \ 
    && apt install -y zsh screen autojump firefox ttf-wqy-zenhei \
    && apt  install -y locales xfonts-intl-chinese fonts-wqy-microhei \
    && apt install -y fcitx fcitx-googlepinyin \
    && apt install -y xdg-user-dirs-gtk \
    && apt-get autoclean \
    && apt-get autoremove

RUN apt update \
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
COPY code_1.84.0-1698839401_amd64.deb /tmp
# RUN wget https://az764295.vo.msecnd.net/stable/ee2b180d582a7f601fa6ecfdad8d9fd269ab1884/code_1.76.2-1678817801_amd64.deb -O vscode.deb \
RUN cd /tmp \
    && mv code_1.84.0-1698839401_amd64.deb vscode.deb \
    && dpkg -i vscode.deb \
    && rm vscode.deb \
    && sed -i '/Exec/s/\(Exec=\/usr\/share\/code\/code \S*\) %F/\1 --no-sandbox %F/g' /usr/share/applications/code.desktop

RUN apt update \
    && apt install -y sudo

# 0.2.1
# nasm bochs
RUN apt update \
    && apt install -y nasm \
    && apt-get install -y libx11-dev libc6-dev build-essential xorg-dev libgtk2.0-dev libreadline-dev

ADD bochs-2.7.tar.gz /tmp
RUN cd /tmp/bochs-2.7 \
    && ./configure --with-x11 --with-x --enable-all-optimizations --enable-readline  --enable-debugger-gui --enable-x86-debugger --enable-a20-pin --enable-fast-function-calls --enable-debugger \
    && make \
    && make install \
    && cd /tmp \
    && rm -rf /tmp/bochs-2.7

RUN apt update \
    && apt install -y qemu