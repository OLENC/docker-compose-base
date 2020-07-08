#!/bin/bash
source /usr/bin/bash.sh

mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo "deb http://mirrors.aliyun.com/debian buster main contrib non-free" >/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian buster main contrib non-free" >>/etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/debian buster-updates main contrib non-free" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian buster-updates main contrib non-free" >>/etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/debian-security buster/updates main contrib non-free" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian-security buster/updates main contrib non-free" >>/etc/apt/sources.lis

apt update
dpkg --configure -a
apt install vim iproute2 curl wget netcat htop telnet procps iputils-ping jq sudo -y

nginx

eval $@
tail -f /dev/null
