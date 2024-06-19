#!/bin/bash
# docker exec ai118 service xrdp restart
#!/bin/bash

# 容器名称列表
container="ai118"
echo "启动容器"
docker-compose up -d
echo "容器启动成功。"
docker exec "$container" service xrdp restart
echo "xrdp 服务重启成功。"