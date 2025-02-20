# 数据库服务配置说明

本项目集成了多个数据库服务，包括 MySQL、Redis、MongoDB 和 Neo4j。所有服务都通过 Docker 容器运行，并连接到同一个网络 `mycuda`。

## 服务概览

### MySQL
- **镜像**: mysql:latest
- **端口**: 3306
- **root密码**: rootpassword
- **数据持久化**: ./mysql-data:/var/lib/mysql
- **用途**: 关系型数据库，用于结构化数据存储

### Redis
- **镜像**: redis:latest
- **端口**: 6379
- **数据持久化**: 
  - 路径: ./redis-data:/data
  - 开启 AOF: --appendonly yes
- **用途**: 内存数据库，用于缓存和高速数据访问

### MongoDB
- **镜像**: mongo:latest
- **端口**: 27017
- **数据持久化**: ./mongo-data:/data/db
- **用途**: 文档型数据库，适用于非结构化数据存储

### Neo4j
- **镜像**: neo4j:latest
- **端口**:
  - 7474: Web界面/HTTP API
  - 7687: Bolt协议
- **访问凭证**: neo4j/password
- **数据持久化**:
  - 数据: ./neo4j-data:/data
  - 日志: ./neo4j-logs:/logs
- **用途**: 图数据库，适用于关系密集型数据

## 端口设计说明

### 单端口服务
MySQL、Redis 和 MongoDB 都采用单端口设计：
- 使用行业标准端口
- 简化配置和管理
- 所有操作通过同一端口进行

### 双端口服务 (Neo4j)
Neo4j 使用双端口设计的原因：
1. **7474端口**
   - 提供 Web 界面访问
   - 支持 HTTP/HTTPS API
   - 用于可视化操作和管理

2. **7687端口**
   - 使用 Bolt 协议
   - 提供高效的二进制传输
   - 适用于应用程序直接连接

## 数据持久化
所有服务都配置了数据持久化：
- 使用 Docker volumes 机制
- 数据存储在宿主机本地
- 容器重启不会丢失数据

## 网络配置
- 所有服务都连接到 `mycuda` 网络
- 支持容器间通过服务名互相访问
- 与 CUDA 容器位于同一网络，方便 AI 应用访问

## 访问方式
1. **容器间访问**
   - 使用服务名作为主机名
   - 例如：mysql、redis、mongo、neo4j

2. **主机访问**
   - 通过 localhost 或主机 IP
   - 使用映射的端口号

## 安全建议
1. 修改默认密码
2. 限制端口访问范围
3. 定期备份数据
4. 监控服务状态
