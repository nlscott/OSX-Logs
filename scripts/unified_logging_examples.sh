#!/bin/bash

#====================================
# Log Collect
#====================================
#collect logs to desktop start from January 1st, limit to about 100m
sudo log collect --output ~/Desktop/ --start '2017-01-01' --size 100m


#====================================
# Log Config
#====================================
#to see current satus
sudo log config -status

#Options for levels: {default | info | debug }
#To change levels: 
sudo log config -mode "level:debug"
#Other options:  —subsystem --category


#====================================
# Log Erase
#====================================
sudo log erase

#log: usage:
#log erase [-all] [--ttl] [--faulterror]
#Usage:
#	Delete selected log data from the system.
#	If no arguments are specified, the main log datastore
#	and inflight log data will be deleted.

#====================================
# Log Show
#====================================

#To view the system datastore: 
sudo log show

#To view a log archive: 
sudo log show mylogs.logarchive --info —debug

#To filter: 
sudo log show --predicate 'eventMessage contains "fail"'

#To filter by application, use process ID of App (get ID from Activity monitor):  
sudo log show --predicate 'processID == 2407'

#To change output format: 
sudo log show --predicate 'processID == 2407' --style json

#Using start and end dates: 
sudo log show --predicate 'eventMessage contains "error"' --start '2017-01-01' --end '2017-01-01'

#Filter by subsystem:
sudo log show --predicate 'eventType == logEvent and subsystem contains "com.apple.notes"'

#Filter with grep: 
sudo log show --predicate 'subsystem == "com.apple.notes"' | grep 'error'

#filter for boot time
sudo log show --predicate 'eventMessage contains "BOOT_TIME"'

#filter for system wakes from sleep
sudo log show --predicate 'eventMessage contains "System Wake"'

#filter for error messages
sudo log show --predicate 'messageType == error'

#filter by events run but root
sudo log show --predicate 'eventMessage contains "USER=root"'

#filter by sudo command
sudo log show --predicate 'processImagePath contains "sudo"'

#filter for failed password attempts
sudo log show --predicate 'eventMessage contains "Failed to authenticate user"'


#====================================
# Log Stream
#====================================

#To Stream by level, provides current output
sudo log stream —level=info

#Filter using predicate to only stream live messags about google
sudo log stream --predicate 'eventMessage contains "Google"'




