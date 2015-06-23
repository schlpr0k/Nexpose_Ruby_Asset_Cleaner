# Nexpose_Ruby_Asset_Cleaner
Parses Nexpose database for assets that have not been scanned within a specified time frame and automatically removes stale assets.

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
