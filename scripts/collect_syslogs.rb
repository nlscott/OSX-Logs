#!/usr/bin/ruby

#======================================================
# Summary: collects OSX system logs to the "collectionfolder" variable defined below
# this includes user logs and new unified logs from macOS 10.12 clients
# run this script with sudo from the terminal
#
# updated 01.26.2016 - included collecting unified logs for Sierra
#
#======================================================

#modules
require 'fileutils'

#======================================================
#varibles
collectionfolder='/Users/Shared/Collected_Logs'
system_logs='/var/log'
users_folder="/Users"
unified_logs= "/var/db/diagnostics"
audit_logs = "/var/audit"

#======================================================
#make directories and file structures
FileUtils.mkdir_p "#{collectionfolder}", :mode => 0755
FileUtils.mkdir_p "#{collectionfolder}/System Logs", :mode => 0755
FileUtils.mkdir_p "#{collectionfolder}/Unified Logs", :mode => 0755
FileUtils.mkdir_p "#{collectionfolder}/Audit Logs", :mode => 0755
FileUtils.mkdir_p "#{collectionfolder}/User Logs", :mode => 0755

#======================================================
#create a list of users on the sytem
all_users = []

Dir.entries("/Users/").each do |username|
	if !username.start_with?(".")
		all_users.push(username)
	end
	all_users.delete("Guest")
	all_users.delete("Shared")
end

#======================================================
#collect system logs (ASL format)
if File.directory?("#{system_logs}")
	FileUtils.copy_entry("#{system_logs}", "#{collectionfolder}/System Logs", :preserve => true)
end

#collect unified logs
if File.directory?("#{unified_logs}")
	FileUtils.copy_entry("#{unified_logs}", "#{collectionfolder}/Unified Logs", :preserve => true)
end

#collect audit logs
if File.directory?("#{audit_logs}")
	FileUtils.copy_entry("#{audit_logs}", "#{collectionfolder}/Audit Logs", :preserve => true)
end

#collect Users logs
all_users.each do |user|
	if File.directory?("/Users/#{user}/Library/Logs")
		FileUtils.copy_entry("/Users/#{user}/Library/Logs", "#{collectionfolder}/User Logs/#{user}", :preserve => true)
	end
end

#======================================================
# options: you can comment out the lines below if you don't want to use them
#======================================================
#Change permission on collection folder to 755
FileUtils.chmod_R 0755, "#{collectionfolder}"

#zip the collectionfolder
Dir.chdir(File.dirname("#{collectionfolder}")) do
	`zip -r Collected_Logs.zip Collected_Logs`
end
 
#delete collection folder
FileUtils.rm_r "#{collectionfolder}"