#  使用docker搭建gitlab服务器

功能更强大，推荐团队使用

```bash
docker pull gitlab/gitlab-ce:13.6.1-ce.0
docker run -d  -p 443:443 -p 80:80 -p 2222:22 --name gitlab -v `pwd`/config:/etc/gitlab -v `pwd`/logs:/var/log/gitlab -v `pwd`/data:/var/opt/gitlab gitlab/gitlab-ce:13.6.1-ce.0
```

修改`gitlab.rb`文件

```bash
docker exec -it gitlab bash
vi /etc/gitlab/gitlab.rb

#192.168.31.88为宿主机ip地址
external_url 'http://192.168.31.88'

gitlab_rails['gitlab_ssh_host'] = '192.168.31.88'
gitlab_rails['gitlab_shell_ssh_port'] = 22

#重启
gitlab-ctl reconfigure
```

浏览器访问`http://localhost:80`,重置密码,用户名为root，密码重置为root1234
