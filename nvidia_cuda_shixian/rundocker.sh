#!/bin/bash
docker run -d --rm  --name cu102 --gpus all -p 6022:22 -p 6089:3389 hjimi/nvidia/cuda:cu102-cudnn7-devel-ubuntu18.04-v0.1
docker exec cu102 service xrdp restart
