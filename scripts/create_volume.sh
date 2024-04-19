#!/bin/zsh
#  本地
docker volume create --driver local \
--opt type=nfs \
--opt o=addr=10.0.2.202,rw \
--opt device=:/home/Docker \
dockerhome
# 远程一
docker volume create --driver vieux/sshfs \
-o sshcmd=[user]@[ip_addr]:[remote_[path]] \
-o allow_other \
-o password='[password]'\
remoteweb  
# 远程二
docker volume create --driver vieux/sshfs -o allow_other -o sshcmd=[user]@[ip_addr]:[remote_path] -o password='[password]' hjimi_opt 
