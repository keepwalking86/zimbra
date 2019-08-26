#!/bin/bash
# Script for installing Zimbra Collaboration Open Source Edition

##Initial variables
HOST=mail
FQDN=mail.vnsys.vn
IPADDR=`ip route get 1.1.1.1 | grep -oP 'src \K\S+'`
#Password for admin
PASSWORD=P@ssw0rd

###Setup common settings

#Disable SELINUX
setenforce 0
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config

#Setup hostname
hostnamectl set-hostname $HOST
cat >/etc/hosts <<EOF
127.0.0.1 localhost.localdomain localhost
::1       localhost.localdomain localhost
$IPADDR $FQDN $HOST
EOF
#Install some system packages
yum -y install unzip net-tools openssh-clients perl-core wget

##Setup Zimbra Collaboration Open Source
#Download zimbra-8.8.9
cd /opt
wget https://files.zimbra.com/downloads/8.8.9_GA/zcs-8.8.9_GA_3019.RHEL7_64.20180809160254.tgz
tar zxvf zcs-*

###Install
#Accept yes with 16 options
cd /opt/zcs-*
./install.sh <<EOF
y
y
y
y
y
y
y
y
y
y
y
y
y
y
y
y
n

7
4
P@ssw0rd
r
a
y

y
n

EOF
### Access Web Interface
echo -e "Access Zimbra Web Interface"
      	echo "Admin Console: https://${IPADDR}:7071"
      	echo "Web Client: https://${IPADDR}"
	echo "User/Password: admin/P@ssw0rd"
