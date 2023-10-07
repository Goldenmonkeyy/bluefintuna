#!/bin/bash


#Get input value1
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

#[[ $(/usr/local/bin/monit --version) != *5.5* ]]


#is the user root?
if [ $(whoami) == root ]; then 
	echo "must run under root!"
	exit 0
fi

#info gathering
#ip address

iplocal = $(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)

echo $iplocal
#system date
datenow = $( grep "$(date +"%Y-%m-%d")")

#webapps folder
#midware log folder


#start of finding files
#test

#function of find suspect 

