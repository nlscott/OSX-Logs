#!/bin/bash
#version 1.0
#this scripts forwards local machines logs to logstash server


#add logserver to local machines. repalce xxx with your server dns name or ip address
echo -e "\n*.*		@xxx.xxx.xxx.xxx" >> /etc/syslog.conf

#unload syslog
sudo launchctl unload /System/Library/LaunchDaemons/com.apple.syslogd.plist

Sleep 2

#load syslog
sudo launchctl load /System/Library/LaunchDaemons/com.apple.syslogd.plist 
