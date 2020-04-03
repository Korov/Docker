启动步骤

1. 启动主从数据库
2. 在主从数据库中创建数据库`nacos_devtest`，执行init.sql文件创建数据库
3. 进入build文件夹创建镜像`sudo docker build -t nacos:latest . `。
4. 启动nacos集群`sudo docker-compose -f cluster-hostname.yaml up -d`。
5. http://127.0.0.1:8848/nacos，用户名nacos，密码nacos



## Common property configuration 

| name                          | description                                           | option                                 |
| ----------------------------- | ----------------------------------------------------- | -------------------------------------- |
| MODE                          | cluster/standalone                                    | cluster/standalone default **cluster** |
| NACOS_SERVERS                 | nacos cluster address                                 | eg. ip1:port1 ip2:port2 ip3:port3      |
| PREFER_HOST_MODE              | Whether hostname are supported                        | hostname/ip default **ip**             |
| NACOS_SERVER_PORT             | nacos server port                                     | default **8848**                       |
| NACOS_SERVER_IP               | custom nacos server ip when network was mutil-network |                                        |
| SPRING_DATASOURCE_PLATFORM    | standalone support mysql                              | mysql / empty default empty            |
| MYSQL_MASTER_SERVICE_HOST     | mysql master host                                     |                                        |
| MYSQL_MASTER_SERVICE_PORT     | mysql master database port                            | default : **3306**                     |
| MYSQL_MASTER_SERVICE_DB_NAME  | mysql master database name                            |                                        |
| MYSQL_MASTER_SERVICE_USER     | username of master database                           |                                        |
| MYSQL_MASTER_SERVICE_PASSWORD | password of master database                           |                                        |
| MYSQL_SLAVE_SERVICE_HOST      | mysql slave host                                      |                                        |
| MYSQL_SLAVE_SERVICE_PORT      | mysql slave database port                             | default :3306                          |
| MYSQL_DATABASE_NUM            | It indicates the number of database                   | default :2                             |
| JVM_XMS                       | -Xms                                                  | default :2g                            |
| JVM_XMX                       | -Xmx                                                  | default :2g                            |
| JVM_XMN                       | -Xmn                                                  | default :1g                            |
| JVM_MS                        | -XX:MetaspaceSize                                     | default :128m                          |
| JVM_MMS                       | -XX:MaxMetaspaceSize                                  | default :320m                          |
| NACOS_DEBUG                   | enable remote debug                                   | y/n default :n                         |
| TOMCAT_ACCESSLOG_ENABLED      | server.tomcat.accesslog.enabled                       | default :false                         |