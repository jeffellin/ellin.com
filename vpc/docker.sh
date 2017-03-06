#!/bin/bash -xe
whoami
apt-get -y update
apt-get -y install unattended-upgrades
curl 'https://bootstrap.pypa.io/get-pip.py' -o 'get-pip.py'
python get-pip.py
pip install awscli
apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list
apt-get -y update
apt-get -y install docker-engine
apt-get -y install fail2ban
pip install docker-compose