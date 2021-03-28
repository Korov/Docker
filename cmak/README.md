 介绍：cmak是雅虎开源的一个kafka监控系统，启动cmak之前需要先启动一个最新版本的zookeeper，cmak依赖zookeeper启动。`ZK_HOSTS`指定了zookeeper服务地址和端口

镜像地址：`https://hub.docker.com/repository/docker/korov/cmak`

```bash
docker run --name cmak -d -p 9000:9000 -e ZK_HOSTS=korov-linux.org:2181 korov/cmak:3.0.0.5
```

访问`localhost:9000`就可已看到界面了