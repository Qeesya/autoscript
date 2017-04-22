#!/bin/bash
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
curl -s -o ip.txt https://raw.githubusercontent.com/Qeesya/master/conf/ip.txt
find=`grep $myip ip.txt`
if [ "$find" = "" ]
then
clear
echo "

      System by MappakkoE

[ YOU IP NOT REGISTER FOR MY AUTOSCRIPT ]

     A   U   T   O  -  E   X   I   T

\/\/\/\/\/\/ FOR REGISTER \/\/\/\/\/\/
[ SMS/Telegram/Whatsapp: +01131731782 ]

"
rm *.txt
rm *.sh
exit
fi
if [ $USER != 'root' ]; then
	echo "Sorry, for run the script please using root user"
	exit
fi
echo "
AUTOSCRIPT BY MappakkoE VPN/SSH[MuLuu09]

PLEASE CANCEL ALL PACKAGE POPUP

TAKE NOTE !!!"
clear
echo "START AUTOSCRIPT"
clear
echo "SET TIMEZONE KUALA LUMPUT GMT +8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "
ENABLE IPV4 AND IPV6

COMPLETE 1%
"
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear
echo "
REMOVE SPAM PACKAGE

COMPLETE 10%
"
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear
echo "
UPDATE AND UPGRADE PROCESS 

PLEASE WAIT TAKE TIME 1-5 MINUTE
"
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
wget -qO - http://www.webmin.com/jcameron-key.asc | apt-key add -
apt-get update;
apt-get -y upgrade;
apt-get -y install wget curl;
echo "
INSTALLER PROCESS PLEASE WAIT

TAKE TIME 5-10 MINUTE
"
# User Status 
cd wget http://raw.github.com/MuLuu09/conf/master/user-list 
mv ./user-list /usr/local/bin/user-list 
chmod +x /usr/local/bin/user-list 

# Install Dos Deflate 
apt-get -y install dnsutils dsniff wget http://raw.github.com/MuLuu09/autoscript/master/ddos-deflate-master.zip 
unzip master.zip 
cd ddos-deflate-master 
./install.sh 
cd 

# Install SSH autokick 
cd wget http://raw.github.com/MuLuu09/conf/master/Autokick-debian.sh bash Autokick-debian.sh

#Install Monitor 
cd wget http://raw.github.com/MuLuu09/conf/master/monssh; 
mv monssh /usr/local/bin/; 
chmod +x /usr/local/bin/monssh 

# Install Menu 
cd wget http://raw.github.com/MuLuu09/conf/master/menu 
mv ./menu /usr/local/bin/menu 
chmod +x /usr/local/bin/menu 

# moth 
cd wget http://raw.github.com/MuLuu09/conf/master/motd 
mv ./motd /etc/motd 

#ssh 
sed -i 's/#Banner/Banner/g' /etc/ssh/sshd_config sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config wget -O /etc/issue.net " https://raw.githubusercontent.com/Qeesya/script/master/script/banner"

#bonus block torrent 
wget https://raw.githubusercontent.com/Qeesya/autoscript/master/script/torrent.sh 
chmod +x torrent.sh 
./torrent.sh

# fail2ban
apt-get -y install fail2ban

# webmin
apt-get -y install webmin
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf

# dropbear
apt-get -y install dropbear
wget -O /etc/default/dropbear "http://raw.github.com/MuLuu09/conf/master/dropbear"
echo "/bin/false" >> /etc/shells
echo "/usr/sbin/nologin" >> /etc/shells

# squid3
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "http://raw.github.com/MappakkoE/master/master/squid.conf"
sed -i "s/ipserver/$myip/g" /etc/squid3/squid.conf

# nginx
apt-get -y install nginx php5-fpm php5-cli
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/nginx/nginx.conf "http://raw.github.com/MuLuu09/conf/master/nginx.conf"
mkdir -p /home/vps/public_html
echo "<pre>Setup by MuLuu | telegram @MuLuu09 | whatsapp +601131731782</pre>" > /home/vps/public_html/index.php
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /etc/nginx/conf.d/vps.conf "http://raw.github.com/MuLuu09/conf/master/vps.conf"
sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php5/fpm/pool.d/www.conf

# openvpn
apt-get -y install openvpn
cd /etc/openvpn/
wget https://raw.githubusercontent.com/Qeesya/autoscript/master/script/openvpn.tar;tar xf openvpn.tar;
rm openvpn.tar
wget -O /etc/iptables.up.rules "https://raw.githubusercontent.com/Qeesya/autoscript/master/conf/iptables.up.rules"
sed -i '$ i\iptables-restore < /etc/iptables.up.rules' /etc/rc.local
sed -i "s/ipserver/$myip/g" /etc/iptables.up.rules
iptables-restore < /etc/iptables.up.rules

# etc
wget -O /home/vps/public_html/client.ovpn "http://rzserver.tk/source/client.ovpn"
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client.ovpn;cd
#add useruseradd -m -g users -s /bin/bash MuLuuecho "MuLuu:12345" | chpasswd

rm $0;rm *.txt;rm *.tar;rm *.deb;rm *.asc
clear
service ssh restart
service openvpn restart
service dropbear restart
service nginx restart
service php5-fpm restart
service webmin restart
service squid3 restart
service fail2ban restart
clear
echo "========================================"  | tee -a log-install.txt
echo "Service Autoscript VPS (MappakkoE VPN/SSH)"  | tee -a log-install.txt
echo "----------------------------------------"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "nginx : http://$myip:80"   | tee -a log-install.txt
echo "Webmin : http://$myip:10000/"  | tee -a log-install.txt
echo "Squid3 : 8080"  | tee -a log-install.txt
echo "OpenSSH : 22"  | tee -a log-install.txt
echo "Dropbear : 443"  | tee -a log-install.txt
echo "OpenVPN  : TCP 59999 (client config : http://$myip/client.ovpn)"  | tee -a log-install.txt
echo "Fail2Ban : [on]"  | tee -a log-install.txt
echo "Timezone : Asia/Kuala_Lumpur"  | tee -a log-install.txt
echo "Script command : menu"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "----------------------------------------"
echo "LOG INSTALL  --> /root/log-install.txt"
echo "----------------------------------------"
echo "========================================"  | tee -a log-install.txt
echo "      PLEASE REBOOT TAKE EFFECT !"
echo "========================================"  | tee -a log-install.txt
cat /dev/null > ~/.bash_history && history -c
