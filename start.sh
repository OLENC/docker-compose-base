#!/bin/bash
CWD=$(cd "$(dirname "$0")" && pwd)
ENV="dev"
PROD_BACKUP_DIR="/home/docker/docker/data/"

mkdir -p ${CWD}/data/mysql
mkdir -p ${CWD}/data/redis
mkdir -p ${CWD}/data/rabbitmq

#清空Mysql数据
sudo rm -rf ${CWD}/data/mysql/*
#清空Redis数据
sudo rm -rf ${CWD}/data/redis/*
#清空RabbitMq数据
sudo rm -rf ${CWD}/data/rabbitmq/

docker-compose -f $CWD/compose/dev.yaml down
docker-compose -f $CWD/compose/dev.yaml up -d
