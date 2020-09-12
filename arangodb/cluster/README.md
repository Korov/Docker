# 结构

一个完整的ArangoDB集群需要以下数据：Agents，Coordinators，DB-Servers。

## Agent

集群的配置中心

### 参数

激活Agency：`--agency.activate true`，Agent数量：`--agency.size 3`启动至少3个Agent，Agency才会启动，各个Agent需要能彼此发现，`--agency.endpoint`，`--agency.my-address`

## Coordinator

解析AQL优化

## DB Server

数据存储

# 启动

```bash
docker-compose -f docker-compose.yaml up -d
```

使用了一个Agency，两个Coordinator，三个DB-Server。

启动之后登录`localhost:8000`或者`localhost:8001`