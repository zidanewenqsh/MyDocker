#!/bin/zsh
docker network create \
--subnet=172.16.0.0/24 \
--gateway=172.16.0.1 \
hjimi
