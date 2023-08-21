#!/bin/bash
#设置时区
source /usr/bin/bash.sh

dpkg --configure -a
apt install procps vim iproute2 curl wget netcat htop jq net-tools sudo -y
sudo chown `whoami` data/jenkins
echo -e "alias ll='ls -l'\nexport LC_ALL=C.UTF-8\nTZ='Asia/Shanghai'" >>/root/.bashrc
source /root/.bashrc
eval $@
tail -f /dev/null
