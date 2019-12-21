# docker-compose-base
Build docker pits on Cent OS

## ssh_key
生成ssh_key到build-docker-compose-base/config/nginx/ssh_key
ssh-keygen -t rsa -C "少喝肥宅水"
## build-docker
./start.sh

# 注意
start.sh脚本会先清空项目的数据重新拉起服务
项目服务的权限为node而非root
数据库导入须重新设置HOST
build-docker-compose-base/script/mysql/copy_{ENV}_db
# 鸣谢