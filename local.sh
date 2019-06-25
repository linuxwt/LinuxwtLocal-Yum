#!/bin/bash

tar zvxf createrepo.tar.gz 
tar zvxf nginx.tar.gz
tar zvxf repo.tar.gz

createrepo () {
cd createrepodir
yum -y localinstall *
cd ..
}

nginxrepo () {
cd nginxdir
yum -y localinstall *
cd ..
}

createrepo
nginxrepo
nginx

mkdir -p /etc/yum.repos.d/bak
mv /etc/yum.repos.d/CentOS* /etc/yum.repos.d/bak

netcard=$(basename $(ls -la /etc/sysconfig/network-scripts/ifcfg* | grep -v lo | awk -F ' ' '{print $9}')) 
Netcard=${netcard/ifcfg-/}
ip=$(ip addr | grep ${netcard1} | grep inet | awk -F ' ' '{print $2}' | awk -F '/' '{print $1}')
cat <<EOF>> /etc/yum.repos.d/local.repo
[local]
name=local
baseurl=http://${ip}/myshare
enabled=1
gpgcheck=0
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
EOF

cp -r myshare /usr/share/nginx/html

createrepo /usr/share/nginx/html/myshare
yum makecache
