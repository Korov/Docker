#!/bin/bash

host_name=$1
host_port1=$2

local_port=`expr $host_port1`


for value in 1 2 3 4 5 6
do
    # 删除文件
    sudo rm -rf "redis${value}"
    
    # 创建相应的文件夹
    mkdir -p redis${value}/config
    cp redis.conf redis${value}/config
    sed -i "s/local-host/${host_name}/g" `grep local-host -rl ./redis${value}/config`
    sed -i "s/local-port/$local_port/g" `grep local-port -rl ./redis${value}/config`
    local_port=`expr $local_port + 1`

    # 修改配置文件的所有者为root，并且限制配置文件的权限
    sudo chown -R root redis${value}/config
    sudo chgrp -R root redis${value}/config
    sudo chmod 644 redis${value}/config/redis.conf
done

sudo docker-compose -f docker-compose.yaml stop
sudo docker-compose -f docker-compose.yaml rm
sudo docker-compose -f docker-compose.yaml up -d

sudo docker run --net host --rm -it zvelo/redis-trib create --replicas 1 \
${host_name}:`expr $host_port1` \
${host_name}:`expr $host_port1 + 1` \
${host_name}:`expr $host_port1 + 2` \
${host_name}:`expr $host_port1 + 3` \
${host_name}:`expr $host_port1 + 4` \
${host_name}:`expr $host_port1 + 5`