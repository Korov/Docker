```bash
docker pull mysql
```

启动主从服务器（注意启动之前要确保my.cnf的权限是644，否则会被忽略，卡了我一天）

```bash
chown -R root master/config
chgrp -R root master/config
chown -R root slave/config
chgrp -R root slave/config

#创建一个MySQL使用的网络
docker network create --driver bridge --subnet 172.20.0.0/16 net_mysql

docker-compose -f docker-compose.yaml up -d
```

使用数据库连接工具进行连接，先连接主服务器的数据库依次执行

```MySQL 
GRANT REPLICATION SLAVE ON *.* TO 'root'@'%';
flush privileges;
show master status;#可以看到主数据库的状态
```

切换到从数据库，依次执行

```mysql
CHANGE MASTER TO
 MASTER_HOST='mysql-master',
 MASTER_PORT=3306,
 MASTER_USER='root',
 MASTER_PASSWORD='root123',
 MASTER_LOG_FILE='mysql-bin.000003',
 MASTER_LOG_POS=6143;
#MASTER_LOG_FILE和MASTER_LOG_POS分别对应上面主服务器中show master status显示的file属性和Position属性
start slave;
show slave status;
#其中Slave_IO_Running,Slave_SQL_Running必须为Yes，表示同步成功，否则执行，stop slave;将之前的动作重新执行一遍。之后我们在主库做的SQL语句执行，会同步到从库中来。
```

注意：`mysql -h remothost -P port -uroot -p`可以远程登录。