#!/bin/bash
CWD=$(cd "$(dirname "$0")" && pwd)
ENV="dev"
PROD_BACKUP_DIR="/home/docker/docker/data/"

mkdir -p ${CWD}/data/mysql
mkdir -p ${CWD}/data/redis
mkdir -p ${CWD}/data/rabbitmq
mkdir -p ${CWD}/data/nginx/ssh

#清空Mysql数据
sudo rm -rf ${CWD}/data/mysql/*
#清空Redis数据
sudo rm -rf ${CWD}/data/redis/*
#清空RabbitMq数据
sudo rm -rf ${CWD}/data/rabbitmq/
#清空旧项目文件
# rm -rf ${CWD}/data/project/${PROJECT_NAME}/*

# 拉起docker
docker-compose -f $CWD/compose/dev.yaml down
docker-compose -f $CWD/compose/dev.yaml up -d

echo "初始化Mysql数据库..."
docker exec -i ${ENV}-mysql-master sh -c "mysqld --initialize-insecure --basedir=/usr/bin --datadir=/data/mysql/data  --user=mysql"

echo "启动Mysql服务..."
# while true; do
#     MYSQLD_PROCESS=$(docker exec -i ${ENV}-mysql-master sh -c "netstat -anp | grep '3306 ' | grep LISTEN")
#     if [[ $MYSQLD_PROCESS != "" ]]; then
#         # echo "5秒后开始导入数据..."
#         # sleep 5
#         break
#     else
docker exec -i ${ENV}-mysql-master sh -c "mysqld &"
sleep 10 # mysql启动有延迟
# fi
# done

echo "重设Mysql密码..."
docker exec -i ${ENV}-mysql-master sh -c "mysql -e \"use mysql;CREATE USER 'root'@'%' IDENTIFIED BY '' PASSWORD EXPIRE NEVER;ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '';GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;FLUSH PRIVILEGES; \""

# echo "开始导入Mysql数据..."
# echo "选取:"$LASTEST_MYSQL_BACKUP
# docker exec -i ${ENV}-mysql-master sh -c "mysql -uroot -e \"SET GLOBAL innodb_flush_log_at_trx_commit=0;SET GLOBAL sync_binlog=0;SET sql_log_bin=off;source /data/mysql/dump.sql;SET GLOBAL innodb_flush_log_at_trx_commit=1;SET GLOBAL sync_binlog=1;\""
# echo "Mysql数据导入完成"

# # 下面是node服务拉起的样例:
# # 拉代码
# PROJECT_NAME = 'demo'
# echo "准备启动服务${PROJECT_NAME}[${ENV}环境]..."
# GET_ADDRESS = '' # git@github.com:OLENC/build-docker-compose-demon.git
# git clone -b ${ENV} ${GET_ADDRESS} ${CWD}/data/project/${PROJECT_NAME}
# cd ${CWD}/data/project/${PROJECT_NAME}
# git checkout .
# git pull

# docker exec -i --workdir /home/node ${ENV}-project-${PROJECT_NAME} sh -c "chown node:node projects -R"
# # 启动项目
# docker exec --user=node -i --workdir /home/node/projects/${PROJECT_NAME} ${ENV}-project-${PROJECT_NAME} yarn
# docker exec --user=node -i --workdir /home/node/projects/${PROJECT_NAME} ${ENV}-project-${PROJECT_NAME} yarn run start:dev
# echo "服务已启动"
