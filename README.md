osxscripts
===============

handful of bash etc scripts for os x that I use for work.  
*And a way to try out github.*  

Note these work with 10.7 and not tested on later OS X

contents
---------

*  killssh.sh
   kills all background ssh processes (e.g. tunnels)
*  mount_remote_smb.sh tunnel_host server_host share [user] [lo alias] 
   creates an ssh tunnel for 445 and mounts the server\share locally
*  startlight.sh
   starts up spotlight service (down or not)
*  stoplight.sh
   stops spotlight service and workers
*  vboxkext.sh
   loads/unloads/stats kexts used by virtual box
