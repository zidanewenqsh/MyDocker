# FROM ubuntu:22.04

# # Install VNC and other necessary packages
# RUN apt-get update && apt-get install -y \
#     x11vnc \
#     xvfb \
#     xterm \
#     && rm -rf /var/lib/apt/lists/*

# # Setup VNC
# RUN mkdir ~/.vnc
# # Set a VNC password
# RUN x11vnc -storepasswd yourpassword ~/.vnc/passwd

# # Setup entrypoint
# CMD ["x11vnc", "-forever", "-usepw", "-display", ":0"]
# 使用Ubuntu 22.04 LTS作为基础镜像
FROM ubuntu:18.04

# 更新软件源并安装必要的软件包
RUN apt-get update && apt-get install -y \
       x11vnc \
       xvfb \
       xterm \
       net-tools \
       && rm -rf /var/lib/apt/lists/*

# 创建一个用于存放VNC密码的目录
RUN mkdir ~/.vnc

# 设置VNC密码，这里请更改为更安全的密码
RUN x11vnc -storepasswd yourpassword ~/.vnc/passwd

# 创建启动脚本
RUN echo '#!/bin/bash\n\
# 启动Xvfb\n\
Xvfb :0 -screen 0 1366x768x16 &\n\
\n\
# 等待Xvfb启动\n\
sleep 5\n\
\n\
# 启动x11vnc\n\
x11vnc -forever -usepw -display :0' > /usr/local/bin/start.sh

# 使脚本可执行
RUN chmod +x /usr/local/bin/start.sh

# 设置容器的默认启动命令
CMD ["/usr/local/bin/start.sh"]
