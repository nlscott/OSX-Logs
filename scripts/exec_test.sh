#!/bin/bash

current_user=$(whoami)
logfile="/Users/$current_user/Desktop/logfile_test.txt"

exec &> $logfile

ls -a 