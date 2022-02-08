# docker-milvus-image-search

docker-milvus-image-search

基于  [zilliztech/phantoscope](https://github.com/zilliztech/phantoscope) 修改而来

```
1. milvus 存储修改为 mysql
2. milvus 版本升级 
```



```shell
# 首先拉取  vgg16-encoder
docker pull psoperator/vgg16-encoder:laster
```

```shell
1. data 目录为数据目录
2. milvus 目录为 milvus相关配置
3. mysql 目录为 mysql 相关配置
4. imagepreview 目录为 imagepreview 相关配置
5. milvus-struct.sql 为milvus mysql结构sql
```

```shell
# 运行前,需要修改 ./imagepreview/.env

API_URL=http://10.100.3.161:5000 # 修改为自己的IP地址
```



 
