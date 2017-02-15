#!/bin/bash

#praudit -- print the contents of audit trail files

#print all current activity
sudo /usr/sbin/praudit -s /var/audit/current


#auditreduce -- select records from audit trail files
#show all activity from root
sudo /usr/sbin/auditreduce -e root /var/audit/current | praudit | tail

#show user authentication activity
sudo /usr/sbin/auditreduce -m AUE_auth_user /var/audit/current | praudit

#show logins
sudo /usr/sbin/auditreduce -m AUE_lw_login /var/audit/current | praudit

#show logouts
sudo /usr/sbin/auditreduce -m AUE_logout /var/audit/current | praudit