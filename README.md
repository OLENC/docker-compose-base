# docker-compose-base
Build docker pits on CentOS


## ssh_key
生成ssh_key到build-docker-compose-base/config/nginx/ssh_key
ssh-keygen -t rsa -C "少喝肥宅水"
## build-docker
./start.sh

# 注意
start.sh脚本会先清空项目的数据重新拉起服务
项目镜像的权限为node而非root
build-docker-compose-base/script/mysql/copy_{ENV}_db

mac docker路径不同 需修改server下的dockerfile
/usr/bin/docker:/usr/bin/docker改为/usr/local/bin/docker:/usr/bin/docker
/var/run/docker.sock:/var/run/docker.sock改为/var/run/docker.sock:/var/run/docker.sock
# FQA

1. ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/data/mysql/mysql.sock' (2)
    mysql启动有延迟,十秒可能还不够会出现无法连接的情况

# 鸣谢
