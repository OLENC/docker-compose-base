#!/bin/bash
source /usr/bin/bash.sh

openssl rand -base64 741 >mongodb-keyfile
chmod 600 mongodb-keyfile
chown 999 mongodb-keyfile

apt update
dpkg --configure -a
apt install procps vim iproute2 telnet wget netcat htop jq net-tools sudo -y

mongod -f /data/mongo/config/my.cnf

eval $@
tail -f /dev/null
