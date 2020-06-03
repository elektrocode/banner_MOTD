#! /usr/bin/env bash

# Basic info
HOSTNAME=`uname -n`
ROOT=`df -Ph | grep sda | awk '{print $4}' | tr -d '\n'`

# System load
MEMORY1=`free -t -m | grep Total | awk '{print $3" MB";}'`
MEMORY2=`free -t -m | grep "Mem" | awk '{print $2" MB";}'`
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`

# OS Details
OSVERSION=`cat /etc/centos-release`
KERNELV=`uname -mrs`

echo "
==============================================================
 - Hostname............: $HOSTNAME
 - IP Address..........: `hostname -I | awk '{print $1}'`
==============================================================
 - CPU usage...........: $LOAD1, $LOAD5, $LOAD15 (1, 5, 15 min)
 - Disk Space..........: $ROOT Remaining
 - Memory used.........: $MEMORY1 / $MEMORY2
 - Swap in use.........: `free -m | tail -n 1 | awk '{print $3}'` MB
==============================================================
 - Kernel Version......: $KERNELV
 - OS Release..........: $OSVERSION
==============================================================
"
