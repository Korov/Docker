官方增强版，替换了镜像的字符集为UTF8，初始化脚本支持文件夹

```bash
docker run --name mariadb --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root123 \
-v `pwd`/init_sql1:/docker-entrypoint-initdb.d/init_sql1 \
-v `pwd`/init_sql2:/docker-entrypoint-initdb.d/init_sql2 \
-v `pwd`/init_sql3:/docker-entrypoint-initdb.d/init_sql3 \
-d korov/mariadb:5.5.62.1;
```

 按照上面命令启动的时候会依次执行init_sql1，init_sql2和init_sql3文件夹中的初始化脚本，其他命令和原始镜像一致

