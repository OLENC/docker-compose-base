#!/bin/bash
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo "deb http://mirrors.aliyun.com/debian stretch main contrib non-free" >/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian stretch main contrib non-free" >>/etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/debian stretch-updates main contrib non-free" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian stretch-updates main contrib non-free" >>/etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/debian-security stretch/updates main contrib non-free" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian-security stretch/updates main contrib non-free" >>/etc/apt/sources.list

apt update
dpkg --configure -a
apt install vim iproute2 curl wget netcat htop telnet procps iputils-ping jq sudo -y
echo -e "alias ll='ls -l'\nexport LC_ALL=C.UTF-8\nTZ='Asia/Shanghai'" >>/root/.bashrc
source /root/.bashrc
