
#!/bin/bash


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


#is the user root?
if [ $(whoami) == root ]; then 
        echo "Sorry, must run under root!"
        exit 0
fi

#info gathering

#ip address
iplocal=$(/sbin/ip -o -4 addr list eth0 | awk '{print $4}' | cut -d/ -f1)
echo "The local ip address is: $iplocal"

#system date
datenow=$(date +"%Y-%m-%d")
echo "System date is: $datenow"


#1. webshell lookup module:

#find webapps folder
echo "Possible webapps root folders are: "
timeout 20 bash -c 'find / -type d -name "*tomcat" 2>/dev/null' 

#start of finding webshell files
if [ -z "$ShellName" ]
then
      echo "Possible webshells are:"
      timeout 40 bash -c 'find / -type f -name "*.jsp" 2>/dev/null'
else
      echo "the path of shellname are: "
      timeout 40 bash -c 'find / -type f -name "$ShellName" 2>/dev/null'
fi
#function of find suspect
