#!/bin/bash

# go to root
cd
# install openvpn
wget -O /etc/openvpn/openvpn.tar "http://raw.github.com/Qeesya/autoscript/master/script/openvpn.tar"
cd /etc/openvpn/
tar xf openvpn.tar
wget -O /etc/openvpn/59999.conf "http://raw.github.com/Qeesya/autoscript/master/script/59999.conf"
service openvpn restart
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
wget -O /etc/iptables.up.rules "http://raw.github.com/MuLuu09/conf/master/iptables.up.rules"
sed -i '$ i\iptables-restore < /etc/iptables.up.rules' /etc/rc.local
MYIP=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | grep -v '192.168'`;
MYIP2="s/xxxxxxxxx/$MYIP/g";
sed -i 's/port 59999/port 6500/g' /etc/openvpn/59999.conf
sed -i $MYIP2 /etc/iptables.up.rules;
iptables-restore < /etc/iptables.up.rules
service openvpn restart
rm Vpn.sh
