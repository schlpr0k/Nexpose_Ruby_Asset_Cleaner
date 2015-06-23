### Info: Ruby script to remove hosts older than 60 days from Nexpose database.
###
### Version: 0.1
### Created By: Andrew 'schlpr0k' Bindner & James Cook
### Date: 6/22/2015
###
### Install Nexpose gem package 'gem install nexpose' before execution.
### Minimum roles needed in NSC: 
###	1) Choose ONE: 'View Site Asset Data' OR 'View Group Asset Data' 
###	2) Mandatory:  'Purge Site Asset Data'
### Not recommended for use with an Active Directory enabled account!
###
### Additional script configuration needed below to delete assets
###
### Usage: (Linux or Windows) #ruby Nxp_Asset_Cleaner.rb

### --Script BEGIN---

### Required componets
require 'nexpose'
include Nexpose

### Uncomment the lines below to turn on logging.
# $stdout.reopen("nexpose_asset_cleanup.txt", "w")
# $stderr.reopen("nexpose_asset_cleanup.txt", "w")

### Output Time of Execution
time = Time.new
puts "Time of Script Execution: " + time.inspect
puts "------------------------------------------------"

###  Change number of days below for correct output
puts "Preparing to remove hosts older than 60 days...."
puts ""

### Establish a connection to Rapid7 Nexpose Scanning Console
### Modify settings to match your NSC.
nsc = Connection.new('localhost','username','password')
nsc.login

### Look for asset older than 'XX' days; default is 60.
assets = nsc.filter(Search::Field::SCAN_DATE, Search::Operator::EARLIER_THAN, '60')

### Uncomment "nsc.delete_device" in routine below to delete assets discovered
assets.each do |asset|
	puts "Deleting Asset ID: #{asset.id}, with IP address: #{asset.ip}"
#	nsc.delete_device(asset.id)
end

### Logout of NSC session
nsc.logout

### ---Script END---
