这个配置文件会告诉 Docker 分别运行三个 zookeeper 镜像, 并分别将本地的 2181, 2182, 2183 端口绑定到对应的容器的2181端口上.
ZOO_MY_ID 和 ZOO_SERVERS 是搭建 ZK 集群需要设置的两个环境变量, 其中 ZOO_MY_ID 表示 ZK 服务的 id, 它是1-255 之间的整数, 必须在集群中唯一. ZOO_SERVERS 是ZK 集群的主机列表

```bash
docker network create --driver bridge --subnet 172.21.0.0/16 net_zookeeper
docker-compose -f docker-compose.yml up -d
```

