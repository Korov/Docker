## 3.7 安装Sentinel

```bash
docker pull bladex/sentinel-dashboard
docker run --restart always --name sentinel -d -p 8858:8858 -d bladex/sentinel-dashboard
```

dashboard 地址:http://localhost:8858 (默认端口为8080)，账号和密码都是sentinel