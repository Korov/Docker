```bash
docker run -tid --name tracker \
-v `pwd`/tracker/data:/fastdfs/tracker/data \
--net host \
season/fastdfs tracker

docker run -tid --name storage \
-v `pwd`/storage/data:/fastdfs/storage/data \
-v `pwd`/store/path:/fastdfs/store_path \
--net host \
-e TRACKER_SERVER=192.168.31.84:22122 \
-e GROUP_NAME=group1 \
season/fastdfs storage
```

需要执行两个docker，-e TRACKER_SERVER=192.168.31.84:22122 需要换成自己的宿主机IP地址