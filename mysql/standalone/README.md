```bash
#执行以下脚本。
docker run --name mysql --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root123 \
-v `pwd`/data:/var/lib/mysql:rw \
-v `pwd`/mysql-files:/var/lib/mysql-files:rw \
-v `pwd`/log:/var/log/mysql:rw \
-v `pwd`/config/my.cnf:/etc/mysql/my.cnf:rw \
-d mysql::8.0.21;
```

