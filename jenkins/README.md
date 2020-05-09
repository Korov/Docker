# 不需要卷

（推荐使用这种，可以安装全部插件，有卷的好像权限不行，有些插件装不了）

```bash
docker run -d -p 9080:8080 --name jenkins jenkinsci/blueocean
docker exec -it jenkins bash
#修改镜像 https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json
vi /var/jenkins_home/hudson.model.UpdateCenter.xml
docker restart jenkins
```

# 用卷

```bash
mkdir jenkins-data
chmod 777 jenkins-data

docker run -d -p 9080:8080 --name jenkins -v `pwd`/jenkins-data:/var/jenkins_home  jenkinsci/blueocean
```

以上命令启动完成之后进入`jenkins-data`，修改`hudson.model.UpdateCenter.xml`将`url`修改为`https://mirrors.tuna.tsinghua.edu.cn/jenkins/updates/update-center.json`。

修改完成后重启容器`docker restart jenkins`。

# 密码

首次进入需要密码，密码所在文件`/var/jenkins_home/secrets/initialAdminPassword`。或者通过`docker logs jenkins`查看日志输出的密码。

# 集成GitLab

