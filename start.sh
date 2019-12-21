#!/bin/bash
CWD=$(cd "$(dirname "$0")" && pwd)

mkdir -p ${CWD}/data/mysql

#清空Mysql数据
sudo rm -rf ${CWD}/data/mysql/*

docker-compose -f $CWD/compose/dev.yaml down
docker-compose -f $CWD/compose/dev.yaml up -d
