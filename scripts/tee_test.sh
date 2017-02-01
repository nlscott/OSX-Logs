#!/bin/bash

current_user=$(whoami)
logfile="/Users/$current_user/Desktop/logfile_test.txt"



ls -a | tee $logfile