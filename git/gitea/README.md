介绍：相比gitlab功能更少，但是占用的资源也更少，个人使用的话推荐使用这个 

安装

```bash
docker run -d --restart=always --name=gitea -p 10022:22 -p 10080:3000 -v `pwd`/gitea:/data gitea/gitea:1.13.1
```

在配置界面中执行以下步骤：

- `SSH Server Domain`中的localhost修改为服务器的ip
- `SSH Server Port`修改为10022
- `Gitea Base URL`中的localhost修改为服务器ip，3000修改为10080

访问界面：`localhost:10080`

