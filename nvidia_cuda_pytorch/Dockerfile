# 基于 NVIDIA 的 CUDA 镜像
FROM registry.cn-hangzhou.aliyuncs.com/phzn/nvidia_cuda:11.8.0-cudnn8-devel-ubuntu18.04-v0.1 as base

# 复制 PyTorch 镜像的 /opt/conda 目录
COPY --from=pytorch/pytorch:1.12.1-cuda11.3-cudnn8-devel /opt/conda /opt/conda

# # 确保 /opt/conda/bin 在 PATH 中
# ENV PATH /opt/conda/bin:$PATH

# # 打印当前 PATH 查看是否设置成功
# RUN echo $PATH
# # # 清理工作
# # RUN apt-get clean && \
# #     rm -rf /var/lib/apt/lists/*
