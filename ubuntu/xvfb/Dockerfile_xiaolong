FROM ubuntu:22.04

# Install necessary packages for GUI applications
RUN apt-get update && apt-get install -y \
       openssh-server \
       x11-apps \
       xvfb \
       && rm -rf /var/lib/apt/lists/*

# ssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:xyz' | chpasswd
RUN sed -i "s/#Port 22/Port 5549/" /etc/ssh/sshd_config
RUN sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config

ENTRYPOINT [ "/usr/sbin/sshd", "-D" ]

# docker run -d -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix:rw --name $NAME --network host --ipc host $IMAGE