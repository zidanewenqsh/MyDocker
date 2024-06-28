# 基于 NVIDIA 的 CUDA 镜像
FROM nvidia_cuda:11.8.0-cudnn8-devel-ubuntu18.04-v0.1.4 as base

# 复制 PyTorch 镜像的 /opt/conda 目录
COPY --from=pytorch/pytorch:2.3.1-cuda11.8-cudnn8-devel /opt/conda /opt/conda

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
 >> /root/.bashrc 
 
# # 确保 /opt/conda/bin 在 PATH 中
# ENV PATH /opt/conda/bin:$PATH

# # 打印当前 PATH 查看是否设置成功
# RUN echo $PATH
# # # 清理工作
# # RUN apt-get clean && \
# #     rm -rf /var/lib/apt/lists/*
# # user
# RUN useradd -r -ms /bin/bash ai \
#     && adduser ai sudo \
#     && echo "ai:1"|chpasswd \
#     && groupadd docker \
#     && gpasswd -a ai docker

# # config
# USER ai

# RUN mkdir ~/.pip \
# && echo '[global]\n\
# index-url=https://pypi.tuna.tsinghua.edu.cn/simple\n\
# [install]\n\
# trusted-host=pypi.tuna.tsinghua.edu.cn\n'>>~/.pip/pip.conf

# RUN echo '\n\
# __conda_setup="$('/opt/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"\n\
# if [ $? -eq 0 ]; then\n\
#     eval "$__conda_setup"\n\
# else\n\
#     if [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then\n\
#         . "/opt/conda/etc/profile.d/conda.sh"\n\
#     else\n\
#         export PATH="/opt/conda/bin:$PATH"\n\
#     fi\n\
# fi\n\
# unset __conda_setup\n'\
#  >> ~/.bashrc 

# RUN echo '\n\
# source /usr/share/autojump/autojump.sh\n\
# '>>~/.bashrc 

