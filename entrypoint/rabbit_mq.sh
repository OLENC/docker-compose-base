#!/bin/bash
source /usr/bin/bash.sh

mv /etc/apt/sources.list.d/buster.list /etc/apt/sources.list.d/buster.list.bak
echo "deb http://mirrors.aliyun.com/debian buster main contrib non-free" >>/etc/apt/sources.list.d/buster.list
echo "deb http://mirrors.aliyun.com/debian buster-updates main contrib non-free" >>/etc/apt/sources.list.d/buster.list
echo "deb http://mirrors.aliyun.com/debian-security buster/updates main contrib non-free" >>/etc/apt/sources.list.d/buster.list

apt update
dpkg --configure -a
apt install vim iproute2 curl wget netcat htop jq sudo -y

rabbitmq-server start &
sleep 20
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user colen 123456
rabbitmqctl set_user_tags colen administrator
rabbitmqctl set_permissions -p "/" colen ".*" ".*" ".*"

eval $@
tail -f /dev/null
