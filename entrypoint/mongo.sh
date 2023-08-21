#!/bin/bash
# source /usr/bin/bash.sh
# source /usr/bin/bash_stretch.sh

openssl rand -base64 741 >mongodb-keyfile
chmod 600 mongodb-keyfile
chown 999 mongodb-keyfile

apt update
dpkg --configure -a
apt install procps vim iproute2 telnet wget netcat htop jq net-tools sudo -y

sudo chown `whoami` /data/mongo
sudo chown `whoami` /data/mongo/data
mongod -f /data/mongo/config/my.conf

eval $@
tail -f /dev/null
