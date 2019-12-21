#!/bin/bash
#设置时区
cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
mv /etc/apt/sources.list /etc/apt/sources.list.bak
echo "deb http://mirrors.aliyun.com/debian jessie main contrib non-free" > /etc/apt/sources.list 
echo "deb-src http://mirrors.aliyun.com/debian jessie main contrib non-free" >> /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/debian jessie-updates main contrib non-free" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian jessie-updates main contrib non-free" >> /etc/apt/sources.list
echo "deb http://mirrors.aliyun.com/debian-security jessie/updates main contrib non-free" >>/etc/apt/sources.list
echo "deb-src http://mirrors.aliyun.com/debian-security jessie/updates main contrib non-free" >> /etc/apt/sources.list
apt update
dpkg --configure -a
apt install vim iproute2 curl wget netcat htop iputils-ping jq sudo -y
chmod 777  /data -R
echo -e "alias ll='ls -l'\nexport LC_ALL=C.UTF-8\nTZ='Asia/Shanghai'" >> /root/.bashrc
source /root/.bashrc
/usr/local/bin/redis-server /data/redis/config/6379.conf
eval $@
tail -f /dev/null