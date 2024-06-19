#!/bin/zsh
docker network create \
--subnet=172.18.0.0/24 \
--gateway=172.18.0.1 \
aihost
