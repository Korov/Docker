依次进入每个文件修改其中的config/redis.conf，将里面的宿主机ip替换为你自己的宿主机ip地址（假设你的宿主机ip为192.168.0.100）。记住每个都要改，不可以遗漏。

修改完成之后执行以下命令

```bash
#修改相关文件的权限
chown -R root redis1/config
chgrp -R root redis1/config
chown -R root redis2/config
chgrp -R root redis2/config
chown -R root redis3/config
chgrp -R root redis3/config
chown -R root redis4/config
chgrp -R root redis4/config
chown -R root redis5/config
chgrp -R root redis5/config
chown -R root redis6/config
chgrp -R root redis6/config

chmod 644 redis1/config/redis.conf
chmod 644 redis2/config/redis.conf
chmod 644 redis3/config/redis.conf
chmod 644 redis4/config/redis.conf
chmod 644 redis5/config/redis.conf
chmod 644 redis6/config/redis.conf

#必须在当前文件夹下执行以下命令
docker-compose -f docker-compose.yaml up -d
#创建集群，Redis容器和启动集群命令都需要使用host网络，此处的ip地址需要使用宿主机的ip
docker run --net host --rm -it zvelo/redis-trib create --replicas 1 宿主机ip:6061 宿主机ip:6062 宿主机ip:6063 宿主机ip:6064 宿主机ip:6065 宿主机ip:6066

进入某个redis-node1容器，通过`redis-cli -p 6061 -c`以集群方式进入容器set一个值之后去别的容器查看值是否存在
```
