#!/bin/bash

red='\033[0;31m'
green='\033[0;32m'
clear='\033[0m'

#Get input values
read -p "Please input backend language, java or php: " Lang
echo "Backend language is $Lang."
echo "-------------------------------------------------------------------------"
read -p "Is there a webshell name, if yes type it: " ShellName
echo "The webshell name is $ShellName."
echo "-------------------------------------------------------------------------"
read -p "Throw me a date, for example, warning time from HIDS, format(2023.01.01): " Date
echo "The possible intrusion date is $Date."
echo "-------------------------------------------------------------------------"
read -p "What's the middleware, tomcat, weblogic or ngnix: " Midware
echo "The middware is $Midware."
echo "-------------------------------------------------------------------------"
echo -e "\n"


#is the user root?
if [ $(whoami) == root ]; then 
        echo -e "${red}Sorry, must run under root!${clear}"
        exit 0
fi

#info gathering

#ip address
iplocal=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
echo -e "${green}The local ip address is: $iplocal${clear}"
echo -e "\n"

#system date
datenow=$(date +"%Y-%m-%d")
echo -e "${green}System date is: $datenow${clear}"
echo -e "\n"

#1. webshell lookup module:

#find possible webapps folder
echo -e "${green}Possible webapps root folders are: ${clear}"
timeout 20 bash -c 'find / -type d \( -iname "*tomcat*" -o -iname "*weblogic*" \) 2>/dev/null'
echo -e "\n"

#start of finding webshell files
if [ -z "$ShellName" ]
then
      echo -e "${green}Possible webshells are:${clear}"
      timeout 40 bash -c 'find / -type f -iname "*.jsp" 2>/dev/null'
else
        echo -e "${green}the path of shellname are: ${clear}"
      timeout 40 bash -c 'find / -type f -iname "$ShellName" 2>/dev/null'
fi

#2. suspect file lookupp
echo -e "\n"
echo -e "${green}The following files look suspicious: ${clear}"
timeout 40 bash -c 'find / -type f \( -iname "*portmap*"-o -iname "tunnel.jsp" -o -iname "suo5.jsp" -o -iname "*fscan*" -o -iname "*unicornscan*" -o -iname "conn.jsp" \) 2>/dev/null'


#3. log file analysis 
