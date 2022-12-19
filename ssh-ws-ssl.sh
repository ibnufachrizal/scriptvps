#!/bin/bash
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Checking VPS"
repogithub='ibnufachrizal/scriptvps/main'
repopermission='https://raw.githubusercontent.com/ibnufachrizal/ibnufachrizal/master/permission.txt'
	if ! which wget > /dev/null; then
         clear
  	   echo -e "${red}Wah Mau Belajar Nakal Yah !${NC}"
         sleep 2
     	   exit 0
	   clear
	else
	   echo "Wget is already installed"
	fi

	if ! which curl > /dev/null; then
         clear
  	   echo -e "${red}Wah Mau Belajar Nakal Yah !${NC}"
         sleep 2
     	   exit 0
	   clear
	else
	   echo "curl is already installed"
	fi
fileee=/usr/bin/wget
minimumsize=400000
actualsize=$(wc -c <"$fileee")
if [ $actualsize -ge $minimumsize ]; then
    clear
    echo -e "${green}Checking...${NC}"
else
    clear
    echo -e "${red}Permission Denied!${NC}";
    echo "Reason : Modified Package To Bypass Sc"
    exit 0
fi
fileeex=/usr/bin/curl
minimumsizex=15000
clear
actualsizex=$(wc -c <"$fileeex")
if [ $actualsizex -ge $minimumsizex ]; then
    clear
    echo -e "${green}Checking...${NC}"
else
    clear
    echo -e "${red}Permission Denied!${NC}";
    echo "Reason : Modified Package To Bypass Sc"
    exit 0
fi

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`

TYTYD () {
    curl -sS -H 'Cache-Control: no-cache, no-store' $repopermission > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $ClientName" "/root/tmp" | awk '{print $3}' | sort | uniq` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -rf /etc/.$user.ini > /dev/null 2>&1
    rm -rf /usr/local/etc/.$Name.ini > /dev/null 2>&1
    fi
    done
    rm -rf /root/tmp
}

MYIP=$(curl -sS ipinfo.io/ip)
Name=$(curl -sS -H 'Cache-Control: no-cache, no-store' $repopermission | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

KNTL () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
fi
    if [ "$CekOne" = "$CekTwo" ]; then
        clear
        echo -e "$red Permission Denied : Expired ! ${NC}"
        echo -e "Please Contact t.me/ibnufachrizal"
        exit 0
else
clear
echo -e "${green}Permission Accepted : Checking Expired Accepted...${NC}"
fi
}

MMK () {
    MYIP=$(curl -sS ipinfo.io/ip)
    IZIN=$(curl -sS -H 'Cache-Control: no-cache, no-store' $repopermission | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    TYTYD
    else
    clear
    echo -e "${red}Permission Denied : IP Addres Not Found In Database !${NC}"
    echo -e "Please Contact t.me/ibnufachrizal"
    exit 0
    fi
    KNTL
}

JMBD () {
    ClientName=$(cat /usr/local/etc/clientname)
    IZIN=$(curl -sS -H 'Cache-Control: no-cache, no-store' $repopermission | grep -w "$MYIP" | awk '{print $2}' | head -1)
    if [ "$ClientName" = "$IZIN" ]; then
    echo -e "${green}Permission Accepted : Checking ClientName Accepted${red}"
    clear
    else
    clear
    echo -e "${red}Permission Denied : ClientName Not Compatible !${NC}"
    echo -e "Please Contact t.me/ibnufachrizal"
    exit 0
    fi
}
ClientNameX=/usr/local/etc/clientname
if [[ -z $(grep '[^[:space:]]' $ClientNameX) ]] ; then
echo -e "${red}Permission Denied : ClientName Not Found !${NC}"
exit 0
fi
JMBD
MMK
clear

# step one : install package
mkdir -p /etc/william/
cd /etc/william/
apt install npm -y
clear
source /etc/os-release
OS=$PRETTY_NAME
if [[ $OS == 'Debian GNU/Linux 9 (stretch)' ]]; then
curl -sL https://deb.nodesource.com/setup_14.x | bash
apt-get install -y nodejs
apt upgrade -y
fi
apt install nodejs -y
wget -q -O PDirect.js "https://raw.githubusercontent.com/ibnufachrizal/scriptvps/main/ssh-ws-ssl.js"
chmod +x PDirect.js
cd

# step two : configurasi sshws+ssl443
cat > /etc/systemd/system/cdn.service << END 
[Unit]
Description=P7COM-nodews1-william
Documentation=https://p7com.net/
Documentation=https://t.me/ibnufachrizal
After=network.target nss-lookup.target

[Service]
User=nobody
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/node --expose-gc /etc/william/PDirect.js -dhost 127.0.0.1 -dport 109 -mport 2052
Restart=on-failure
RestartSec=3s

[Install]
WantedBy=multi-user.target
END

# Install Ovpn-Websocket
apt install python -y
cd /etc/william/
wget -q -O ODirect.py "https://raw.githubusercontent.com/xkjdox/sojsiws/main/PDirectovpn.py"
chmod +x /etc/william/ODirect.py
# Install Service Ovpn-ws
cat > /etc/systemd/system/cdn-ovpn.service << END 
[Unit]
Description=WS-OPENVPN By Ibnu Fachrizal
Documentation=https://t.me/ibnufachrizal
After=network.target nss-lookup.target

[Service]
Type=simple
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_BIND_SERVICE
NoNewPrivileges=true
ExecStart=/usr/bin/python -O /etc/william/ODirect.py 2095
Restart=on-failure

[Install]
WantedBy=multi-user.target
END


# step three : enable service and reboot eh tapi boong
systemctl enable cdn.service
systemctl start cdn.service
systemctl enable cdn-ovpn.service
systemctl start cdn-ovpn.service

clear
echo "INSTALL COMPLETED ! AUTOREBOOT ON 3 SEC."
sleep 1
echo "1"
sleep 1
echo "2"
sleep 2
echo "3"
echo "eh tapi boong"
sleep 1
rm -rf ssh-ws-ssl.sh
clear
