#!/bin/bash

sed -i 's/localhost:2181/$ZK_HOSTS/g' /opt/cmak-3.0.0.5/conf/application.conf

if [ ! -f "/opt/cmak-3.0.0.5/RUNNING_PID" ];then
  echo "文件不存在"
else
  rm -f "/opt/cmak-3.0.0.5/RUNNING_PID"
fi

cmak
