#!/bin/bash

#see man syslog for all the options


#to see last 5 lines of system log
$ syslog -w 5

#to read a specific file
sudo /usr/bin/syslog -f /private/var/log/asl/2015.11.20.G80.asl

#to see all sudo usage
sudo /usr/bin/syslog -k Sender sudo

#to see all critical messages
sudo /usr/bin/syslog  -k Level Nle 2