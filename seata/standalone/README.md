## 3.8 安装seata

以下为官方推荐方法，但是不能注册nacos

```bash
docker pull seataio/seata-server
docker run --net example_default --link nacos1:nacos --name seata-server -p 8091:8091 seataio/seata-server:latest
#指定自定义配置文件启动
docker run --name seata-server \
        -p 8091:8091 \
        -e SEATA_CONFIG_NAME=file:/home/korov/Install/Docker/seata/conf/registry \
        -v /PATH/TO/CONFIG_FILE:/root/seata-config  \
        seataio/seata-server
#指定seata-server IP启动
docker run --name seata-server \
        -p 8091:8091 \
        -e SEATA_IP=192.168.1.1 \
        seataio/seata-server
```

我自己做的image

1.创建dockerfile

```dockerfile
FROM openjdk:8
MAINTAINER korov<korov9@163.com>
RUN cd /
RUN mkdir seata-server
WORKDIR /seata-server

COPY seata-server /seata-server

EXPOSE 8091
CMD /seata-server/bin/seata-server.sh
```

2.生成镜像并启动

```bash
#使用nacos作为配置中心的时候需要执行配置文件，需要github下载源码，并编译，在distribution中找到nacos-config.sh，执行完毕之后nacos配置中心会多出很多配置文件
./nacos-config.sh 127.0.0.1
#首先需要去github上下载相应的包
docker build -f Dockerfile -t seata-server:1.0 .

#启动docker ,需要使用--link使两个容器可以通信，--link 容器名:别名  。如下所示就可以在此容器中使用 ping nacos通信
docker run --name seata-server --net example_default --link nacos1:nacos --restart always \
        -p 8091:8091 \
        -v /home/korov/Install/Docker/seata/conf/registry.conf:/seata-server/conf/registry.cnf:rw  \
        -v /home/korov/Install/Docker/seata/conf/file.conf:/seata-server/conf/file.cnf:rw  \
        -v /home/korov/Install/Docker/seata/conf/logback.xml:/seata-server/conf/logback.xml:rw  \
        -v /home/korov/Install/Docker/seata/logs/seata:/seata-server/logs/seata:rw  \
        seata-server:1.0
        
 
 #配置文件
 registry {
  # file 、nacos 、eureka、redis、zk、consul、etcd3、sofa
  type = "nacos"

  nacos {
    serverAddr = "nacos"
    namespace = "public"
    cluster = "default"
  }
}

config {
  # file、nacos 、apollo、zk、consul、etcd3
  type = "nacos"

  nacos {
    serverAddr = "nacos"
    namespace = "public"
  }
}
```