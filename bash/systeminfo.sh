#!/bin/bash

# Assignment of bash of Dennis Simpson
#Monday Noon Class
# Name-Navkiran Singh Student#200357995

default="yes"
#displaying command line help and defining functions for error message

function displayinfo {
  echo "Usage:$0 [-h | --help] [-sn] [-on] [-dn] [-ip] [-ov] [-c] [-m] [-ds]"
}
function replyerror {
  echo "$@" >&2
}

# Command line options are being process, results are being save in variable form

while [ $# -gt 0 ]; do
  case "$1" in
    -h|--help)
      displayinfo
      exit 0
      ;;

 -sn)
  namesinfodata="yes"
  default="no"
  ;;

-on)
  osinfodata="yes"
  default="no"
  ;;

-dn)
  domainnamedata="yes"
  default="no"
  ;;

-ip)
 IPaddressdata="yes"
 default="no"
 ;;

-ov)
  OSversiondata="yes"
  default="no"
  ;;

 -c)
  CPUinfodata="yes"
  default="no"
  ;;

 -m)
  RAMdata="yes"
  default="no"
  ;;

 -ds)
  diskspacedata="yes"
  default="no"
  ;;

 -p)
  printerdata="yes"
  default="no"
  ;;

  -s)
   installedsoftwaredata="yes"
   default="no"
   ;;

     *)
     replyerror "I cant figure '$1' this out"

     exit 1
     ;;
   esac
   shift
 done

 #  Data into variables using commands
systemname="$(hostname)"

domainname="$(hostname -d)"

 osinfo="$(grep PRETTY /etc/os-release |sed -e 's/.*=//' -e 's/"//g')"

 osversion="$(grep PRETTY /etc/os-release |sed -e 's/*=//' -e 's/"//g')"

 CPUinfo="$(lscpu | grep "Model name:")"

ipaddress="$(hostname -I)"

RAMinfo="$(cat /proc/meminfo | grep MemTotal)"

discinfomration="$(df -m /tmp | tail -1 | awk '{print $4}')"

softwareinstalled="$(apt list --installed)"

printerinfo="$(1pstat -p | awk '{print $2}')"

# Output using data and command line

osinfoinfo="
Operating System Information:

Operating System Installed: $osinfo
"

nameinfoinfo="
System Names Information:

System Name: $systemname
"

domainnameinfo="
Domain Names Information:

Domain Name: $domainname
"

OSversioninfo="
Operating System Version Info:

OS Version: $osversion
"

ipaddressinfo="
IP Address Infomation:

IP Address: $ipaddress
"

CPUinfoinfo="
CPU Information:

CPU Info: $CPUinfo
"

RAMinfoinfo="
RAM Info:

RAM Installed (MB): $RAMinfo
"

diskspaceinfo="
Disc Space Information:

Disc Space (MB): $discinfomration
"
printerinfo="
Printer Information:

Printers currently connected: $printerinfo
"

installedsoftwareinfo="
Software Infromation:

Software Installed on Device: $softwareinstalled
"


#Output using the script
if [ "$default" = "yes" -o "$namesinfodata" = "yes" ]; then
  echo "$nameinfoinfo"
fi

if [ "$default" = "yes" -o "$osinfodata" = "yes" ]; then
  echo "$osinfoinfo"
fi

if  [ "$default" = "yes" -o "$domainnamedata" = "yes" ]; then
  echo "$domainnameinfo"
fi

if [ "$default" = "yes" -o "$OSversiondata" = "yes" ]; then
  echo "$OSversioninfo"
fi

if [ "$default" = "yes" -o "$IPaddressdata" = "yes" ]; then
  echo "$ipaddressinfo"
fi

if [ "$default" = "yes" -o "$CPUinfodata" = "yes" ]; then
  echo "$CPUinfoinfo"
fi

if [ "$default" = "yes" -o "$RAMdata" = "yes" ]; then
  echo "$RAMinfoinfo"
fi

if [ "$default" = "yes" -o "$diskspacedata" = "yes" ]; then
  echo "$diskspaceinfo"
fi

if [ "$default" = "yes" -o "$printerdata" = "yes" ]; then
  echo "$printerinfo"
fi

if [ "$default" = "yes" -o "$installedsoftwaredata" = "yes" ]; then
  echo "$installedsoftwareinfo"
fi
