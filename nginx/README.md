#  拉取镜像

```bash
docker pull nginx:1.19.3

docker run --name nginx -d -p 8080:80 nginx:1.19.3
```

配置文件位置：`/etc/nginx/nginx.conf`