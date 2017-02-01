
## Apache Lucene - Query Parser Syntax 
https://lucene.apache.org/core/2_9_4/queryparsersyntax.html



## EXAMPLES:

OR: to find results with either term
"error" OR "failed"

AND: to find results with both terms
"Critical" AND "error"

NOT: to find results with one term, but not another
"Success" NOT "failed"

NOT: to show all results except one term
NOT "root"



## MY SEARCHES:

#for certificate errors
"Did not receive certificate"


#see if a configuration profile has been removed from a machine, because it requires admin rights
"Removed configuration profile"

#see local user logins to machine
"pam_sm_authenticate(): Got user:"

#see installs of El Capitan
"sending status (OS X El Capitan)"

#another way to get user logins, the names after NOT are local accounts I want to exclude from searches, so I only see network logins
"AuthenticationAllowed completed" NOT "puppet" NOT “admin” NOT "student" NOT "faculty" NOT "root"

#view remote screensharing connections
screensharingd

#view software updates
softwareupdated

#see issues with apple tv connections
"critical" AND "coreaudiod"

#see root activity
USER=root

#see which laughtagents and daemons are being loaded (then filter out all know good results to see only questionable activity). Helps identify malicious installers that have installed their own launchagents or daemons
"COMMAND=/bin/launchctl load -w"