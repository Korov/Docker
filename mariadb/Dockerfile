FROM mariadb:5.5.62


RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list; \
    apt-get update -y; \
    apt-get install language-pack-zh-hans -y && locale-gen zh_CN.UTF-8; \
    echo "export LC_ALL=zh_CN.UTF-8">> /etc/profile; \
    rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/