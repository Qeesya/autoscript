#!/bin/bash

#upload file
cd /etc/openvpn/
wget -O /etc/openvpn/client.ovpn http://raw.github.com/y/debian7/z7.sh

cp /etc/openvpn/z7.sh /home/vps/public_html/z7.sh
sed -i $myip2 /home/vps/public_html/z7.sh
sed -i "s/ports/55/" /home/vps/public_html/z7.sh
