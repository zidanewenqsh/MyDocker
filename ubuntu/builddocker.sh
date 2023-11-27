#!/bin/bash
# docker build -t ubuntu:base-root-18.04-v0.1 .
# docker build -t ubuntu:22.04-v0 .
docker build -f Dockerfile_v0.1 -t ubuntu:18.04-v0.1 .
