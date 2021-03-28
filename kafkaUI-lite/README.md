[kafka-UI](https://hub.docker.com/r/korov/kafka-ui)

kafka监控界面

```
docker run -d --name=kafkaUI -p 18889:8889 korov/kafka-ui:1.1.3
```

登录`localhost:18889`就可以访问界面了