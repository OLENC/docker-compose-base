#!/bin/bash
echo -e "alias ll='ls -l'\nexport LC_ALL=C.UTF-8\nTZ='Asia/Shanghai'" >>/root/.bashrc
source /root/.bashrc
#设置时区
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo "deb http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >/etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >>/etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian/ stretch main non-free contrib" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian/ stretch-updates main non-free contrib" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian/ stretch-backports main non-free contrib" >>/etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/debian-security/ stretch/updates main non-free contrib" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian-security/ stretch/updates main non-free contrib" >>/etc/apt/sources.list

mv /etc/apt/sources.list.d/buster.list /etc/apt/sources.list.d/buster.list.bak
echo "deb http://mirrors.aliyun.com/debian buster main contrib non-free" >>/etc/apt/sources.list.d/buster.list
echo "deb http://mirrors.aliyun.com/debian buster-updates main contrib non-free" >>/etc/apt/sources.list.d/buster.list
echo "deb http://mirrors.aliyun.com/debian-security buster/updates main contrib non-free" >>/etc/apt/sources.list.d/buster.list

apt update
dpkg --configure -a
apt install vim iproute2 curl wget netcat htop jq xargs sudo -y

rabbitmq-server start &
sleep 20
rabbitmq-plugins enable rabbitmq_management
rabbitmqctl add_user vanchu fanqu2010
rabbitmqctl set_user_tags vanchu administrator
rabbitmqctl set_permissions -p "/" vanchu ".*" ".*" ".*"

eval $@
tail -f /dev/null
