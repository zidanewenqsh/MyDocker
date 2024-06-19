#!/bin/bash

# 容器名称列表
containers=("ai113")

for container in "${containers[@]}"; do
    echo "重启容器: $container"
    docker restart "$container"
    # # 检查容器是否不存在
    # if [ ! "$(docker ps -q -f name=$container)" ]; then
    #     echo "容器 $container 不存在，启动容器。"
    #     docker-compose up -d
    # else
    #     # 重启 Docker 容器
    #     echo "容器 $container 存在，重启容器。"
    #     docker restart "$container"
    # fi
    # 检查容器重启状态
    if [ $? -eq 0 ]; then
        echo "容器 $container 重启成功，正在重启 xrdp 服务..."
        # 等待几秒确保容器完全启动
        sleep 5

        # 在容器内执行 xrdp 服务的重启
        docker exec "$container" service xrdp restart

        # 检查 xrdp 服务重启命令的执行状态
        if [ $? -eq 0 ]; then
            echo "容器 $container 内的 xrdp 服务重启成功。"
        else
            echo "警告：容器 $container 内的 xrdp 服务重启失败！"
        fi
    else
        echo "错误：容器 $container 重启失败！"
    fi
done

echo "脚本执行完毕。"

