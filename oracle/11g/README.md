```bash
docker pull registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g
docker run -d -p 1521:1521 -v `pwd`/oradata:/home/oracle/app/oracle/oradata --name oracle11g registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g

docker run -d -p 1521:1521 --name oracle11g registry.cn-hangzhou.aliyuncs.com/helowin/oracle_11g

#进入容器内部进行配置
docker exec -it oracle11g bash
#以下为容器内部执行的命令
#切换为root用户，密码为helowin
su root
vi /etc/profile
export ORACLE_HOME=/home/oracle/app/oracle/product/11.2.0/dbhome_2
export ORACLE_SID=helowin
export PATH=$ORACLE_HOME/bin:$PATH

#重启配置文件
source /etc/profile

#建立软链接
ln -s $ORACLE_HOME/bin/sqlplus /usr/bin
#切换到oracle用户下
su - oracle

sqlplus /nolog
conn /as sysdba

alter user system identified by oracle;
alter user sys identified by oracle;
ALTER PROFILE DEFAULT LIMIT PASSWORD_LIFE_TIME UNLIMITED;
```

完成之后打开DataGrip，选择oracle，user为`sys as sysdba`，password为`oracle`。

jdbc:oracle:thin:@localhost:1521:helowin