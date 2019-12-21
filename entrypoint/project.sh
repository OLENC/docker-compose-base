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
apt install vim iproute2 curl wget netcat htop telnet cron openssh-server jq sudo -y
npm config set registry https://registry.npm.taobao.org
npm install yarn pm2 easy-deploy-tool -g
#启动定时任务
cron
chmod u+w /etc/sudoers
echo "node ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
echo -e "alias ll='ls -l'\nexport LC_ALL=C.UTF-8\nTZ='Asia/Shanghai'" >>/home/node/.bashrc
source /home/node/.bashrc
touch /home/node/projects/started.sign
chown node:node /home/node -R
eval $@
tail -f /dev/null
