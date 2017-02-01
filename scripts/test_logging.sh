#!/bin/bash

#====================================
##	setting up logging
#====================================

#log path
logpath="/tmp/testlog.txt"

#redirect all output to logfile
exec >> $logpath

#====================================
##	Start of Script
#====================================

#example data we should see in the above testlog.txt file
echo `date`
echo "Starting script"
echo "Hello Test" 

#tee makes a copy of standard output, allowing redirection to a sperate file
echo "This comment goes to two files" | tee ~/Desktop/file2.txt 


echo "Finishing script"
