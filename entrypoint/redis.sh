#!/bin/bash
#设置时区
source /usr/bin/bash.sh

apt install vim iproute2 curl wget netcat htop iputils-ping jq sudo -y

chmod 777 /data -R
/usr/local/bin/redis-server /data/redis/config/6379.conf

eval $@
tail -f /dev/null
