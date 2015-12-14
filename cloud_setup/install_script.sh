#!/bin/bash

sudo yum -y install java-1.7.0-openjdk
sudo mv ~/host_file /etc/hosts
chmod 600 ~/.ssh/id_rsa
echo "Permissions of id_rsa file changed successfully"

#set ntp
#sudo systemctl is-enabled ntpd
#sudo systemctl enable ntpd
#sudo systemctl start ntpd

# iptables is not loaded by default 
sudo systemctl stop iptables.service

setenforce 0
umask 022
#systemctl disable firewalld  # Firewall is not installed by default though

sudo  mkdir -p /etc/sysctl.d

sudo echo "##Disabled ipv6
## Provided by Ambari Bootstrap
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1" >  ipv6_permissions

sudo mv ipv6_permissions /etc/sysctl.d/99-hadoop-ipv6.conf

sudo sysctl -e -p /etc/sysctl.d/99-hadoop-ipv6.conf

##################### LOGIN TO ambari-sever node ############
ssh <ambari-server>  # this is the hostname of the ambari-sever node

sudo yum -y install  wget 
sudo yum -y install yum-utils createrepo
cd /etc/yum.repos.d/
sudo wget http://public-repo-1.hortonworks.com/ambari/centos7/2.x/updates/2.1.2.1/ambari.repo # ambari repo
sudo yum -y install ambari-server


####ambari-server node: ####
#sudo ambari-server setup
#sudo ambari-server start
#login at <public-dns>:8080 

# wget http://ipinfo.io/ip -qO -    # public ip

### 
### Firewall
#http://www.liquidweb.com/kb/how-to-start-and-enable-firewalld-on-centos-7/
#open port 8080, 8440 for ambari server

