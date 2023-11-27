#!/home/ai-046/anaconda3/bin/python3
# -*- coding: utf-8 -*- #
# ------------------------------------------------------------------
# @File Name:        builddocker_ubuntu.py
# @Author:           wen
# @Version:          ver0_1
# @Created:          2022/2/18 下午4:22
# @Description:      Main Function:    xxx
# @Note:             xxx
# Function List:     hello() -- print helloworld
# History:
#       <author>    <version>   <time>      <desc>
#       wen         ver0_1      2020/12/15  xxx
# ------------------------------------------------------------------
import os
import sys
# import numpy as np
# import torch
import logging
import argparse
# import shutil
# import cv2
import time
# import threading
# import multiprocessing
from pathlib import Path
# from tqdm import tqdm
# from matplotlib import pyplot as plt
from icecream import ic

TIME = time.strftime("%m%d", time.localtime())
FILE = Path(__file__).absolute()
ROOT = FILE.parent
LOGDIR = ROOT / 'logs'
LOGDIR.mkdir(exist_ok=True, parents=True)


def set_logging(name=None, verbose=True):
    # Sets level and returns logger
    fmt = "%(levelname)s (%(process)d) [%(pathname)s:%(lineno)d] %(asctime)s\n" \
          "\t@ %(message)s"
    level = logging.INFO
    datefmt = "%Y%m%d-%H%M%S"
    logging.basicConfig(filename=f"./logs/docker.log",
                        filemode='a', level=level, format=fmt, datefmt=datefmt)
    return logging.getLogger(name)


# define globally (used in train.py, val.py, detect.py, etc.)
LOGGER = set_logging(__name__)
if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('-a', type=str, default=r'', help='')
    parser.add_argument('-b', type=int, default=0, help='')
    parser.add_argument('-c', nargs='+', type=int, default=[0, 1], help='')
    parser.add_argument('-d', action='store_true', help='')
    parser.add_argument('-e', nargs='?', const=True, default=False, help='')
    opt = parser.parse_args()
    name = "nvidia/cuda/pytorch"
    image = 'cuda'
    version = "cu110-v1.1"
    # ImageId = '239d4e9037e8'
    tagcmd = f"docker tag {name}:{version} {name}:cu110-cudnn8-ubuntu18-ssh-conda-pip-torch"
    ic(tagcmd)
    LOGGER.info(tagcmd)
    os.system(tagcmd)
