# MyDocker
My Docker System with Dockerfile and config

## 开发环境配置

本项目使用 Docker Compose 配置了一个完整的开发环境，包含 CUDA 开发环境和多个数据库服务。

### 系统架构

系统包含以下服务：
- NVIDIA CUDA 开发环境（CUDA 11.3）
- MySQL 数据库
- Redis 缓存服务
- MongoDB 文档数据库
- Neo4j 图数据库

### 网络配置

所有服务都运行在自定义网络 `aihost` (172.18.0.0/16) 上，具体 IP 分配如下：
- CUDA 容器: 172.18.0.4
- MySQL: 172.18.0.5
- Redis: 172.18.0.6
- MongoDB: 172.18.0.7
- Neo4j: 172.18.0.8

### 端口映射

| 服务 | 容器端口 | 主机端口 |
|------|----------|----------|
| CUDA SSH | 22 | 8022 |
| CUDA XRDP | 3389 | 8389 |
| CUDA 其他端口 | 10000-10009 | 10000-10009 |
| MySQL | 3306 | 3306 |
| Redis | 6379 | 6379 |
| MongoDB | 27017 | 27017 |
| Neo4j HTTP | 7474 | 7474 |
| Neo4j Bolt | 7687 | 7687 |

### 环境变量

需要在 `.env` 文件中配置以下环境变量：
- `USER_HOME`: 容器内用户主目录
- `MYSQL_ROOT_PASSWORD`: MySQL root 密码
- `MYSQL_DATABASE`: MySQL 数据库名
- `MYSQL_USER`: MySQL 用户名
- `MYSQL_PASSWORD`: MySQL 密码
- `REDIS_PASSWORD`: Redis 密码
- `MONGO_INITDB_ROOT_USERNAME`: MongoDB root 用户名
- `MONGO_INITDB_ROOT_PASSWORD`: MongoDB root 密码
- `NEO4J_AUTH`: Neo4j 认证信息

### 数据卷挂载

#### CUDA 环境挂载
- VSCode 配置: `${HOME}/docker/vscode:${USER_HOME}/.vscode`
- Clash 配置: 
  - `${HOME}/docker/clash:${USER_HOME}/clash`
  - `${HOME}/docker/config/clash:${USER_HOME}/.config/clash`
- ZSH 配置: `${HOME}/docker/zshrc:${USER_HOME}/.zshrc`
- Conda 环境: `${HOME}/anaconda3/envs:${USER_HOME}/.conda/envs`
- 共享目录: `${HOME}/share:/nfs`
- 工作空间: `/workspace:/workspace`
- Docker Socket: `/var/run/docker.sock:/var/run/docker.sock`
- X11 显示: 
  - `/tmp/.X11-unix:/tmp/.X11-unix`
  - `$HOME/.Xauthority:/root/.Xauthority:rw`

#### 数据库存储
- MySQL: `mysql_data:/var/lib/mysql`
- Redis: `redis_data:/data`
- MongoDB: `mongo_data:/data/db`
- Neo4j: 
  - `neo4j_data:/data`
  - `neo4j_logs:/logs`

### 使用说明

1. 创建外部网络：

```bash
docker network create --subnet=172.18.0.0/16 aihost
```

2. 创建 `.env` 文件并配置环境变量：

```bash
# 用户主目录
USER_HOME=/root

# MySQL配置
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=your_database
MYSQL_USER=your_user
MYSQL_PASSWORD=your_password

# Redis配置
REDIS_PASSWORD=your_redis_password

# MongoDB配置
MONGO_INITDB_ROOT_USERNAME=your_mongo_user
MONGO_INITDB_ROOT_PASSWORD=your_mongo_password

# Neo4j配置
NEO4J_AUTH=neo4j/your_password
```

3. 启动服务：

```bash
docker-compose up -d
```

4. 远程连接：
- SSH: `ssh -p 8022 user@host`
- XRDP: 使用远程桌面连接 `host:8389`
- 数据库服务使用对应端口连接

### 注意事项

- CUDA 容器已配置 XRDP 服务，容器启动时会自动重启 XRDP 服务，无需手动重启
- 所有数据库服务都配置了持久化存储
- GPU 资源已配置为使用所有可用设备
- 确保主机已安装 NVIDIA 驱动和 Docker NVIDIA 运行时
- 首次启动时需要下载镜像，可能需要较长时间
- 建议定期备份数据卷中的数据

### 服务管理命令

#### 启动所有服务
```bash
docker-compose up -d
```

#### 停止所有服务
```bash
docker-compose down
```

#### 查看服务状态
```bash
docker-compose ps
```

#### 查看服务日志
```bash
docker-compose logs -f [服务名]
```

#### 重启单个服务
```bash
docker-compose restart [服务名]
```

### 故障排除

1. CUDA 容器连接问题：
```bash
# 检查 SSH 服务状态
docker exec ai113 service ssh status

# 检查 XRDP 服务状态
docker exec ai113 service xrdp status
```

2. 数据库连接问题：
```bash
# 检查网络连接
docker network inspect aihost

# 检查服务状态
docker-compose ps
```

3. GPU 相关问题：
```bash
# 检查 GPU 可见性
docker exec ai113 nvidia-smi

# 检查 CUDA 可用性
docker exec ai113 nvcc --version
```

### 系统要求

- 操作系统：Linux（推荐 Ubuntu 18.04 或更高版本）
- Docker 版本：19.03 或更高
- NVIDIA 驱动版本：450.80.02 或更高
- Docker Compose 版本：1.27.0 或更高
- 可用内存：建议 16GB 或更多
- 磁盘空间：建议 100GB 或更多

### 安全建议

1. 网络安全：
   - 修改默认端口映射
   - 使用防火墙限制访问
   - 配置强密码

2. 数据安全：
   - 定期备份数据卷
   - 加密敏感数据
   - 监控服务状态

3. 访问控制：
   - 限制 root 访问
   - 使用 SSH 密钥认证
   - 定期更新密码

### 性能优化

1. 容器优化：
   - 适当配置 shm_size
   - 调整 CPU 和内存限制
   - 使用数据卷而非绑定挂载

2. 数据库优化：
   - 配置合适的缓存大小
   - 优化查询性能
   - 定期维护索引

3. GPU 优化：
   - 合理分配 GPU 资源
   - 监控 GPU 使用率
   - 及时清理临时文件

> 注：本文档基于 `cuda113/docker-compose.yml` 文件进行配置说明和总结。完整配置详情请参考该文件。

---

### 数据库连接示例

使用默认配置（.env文件）的连接命令示例：

#### MySQL
```bash
# 连接 MySQL
mysql -h 172.18.0.5 -P 3306 -u myuser -pmypassword
# 使用 root 账户
mysql -h 172.18.0.5 -P 3306 -u root -proot_password
```

#### Redis
```bash
# 连接 Redis
redis-cli -h 172.18.0.6 -p 6379 -a redis_password

# 测试连接
ping
```

#### MongoDB
```bash
# 连接 MongoDB
mongosh mongodb://root:root_password@172.18.0.7:27017

# 测试连接
show dbs
```

> 注意：MongoDB 连接需要安装 MongoDB Shell 客户端。安装命令如下：
> ```bash
> # Ubuntu/Debian 系统安装 MongoDB Shell
> wget -qO- https://www.mongodb.org/static/pgp/server-7.0.asc | sudo tee /etc/apt/trusted.gpg.d/mongodb-7.gpg > /dev/null
> echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu $(lsb_release -cs)/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
> sudo apt update
> sudo apt install -y mongodb-mongosh
> ```
> 此连接命令尚未经过测试，使用时请先验证。如遇问题，也可以使用传统的 `mongo` 命令：
> ```bash
> mongo mongodb://root:root_password@172.18.0.7:27017
> ```

#### Neo4j
```bash
# Web界面访问（已验证可用）
http://172.18.0.8:7474

# 使用 cypher-shell（未测试）
cypher-shell -a bolt://172.18.0.8:7687 -u neo4j -p neo4j_password

# 测试连接
MATCH (n) RETURN count(n);
```

> 注意：目前已验证可以通过 Web 界面访问 Neo4j（http://172.18.0.8:7474）。
> cypher-shell 命令行方式尚未测试，如需使用请先安装 Neo4j 命令行工具并验证连接。