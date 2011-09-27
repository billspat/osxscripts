#!/usr/bin/env bash

# create new local loopback on OS X
#  to do: 
#   check if already connected to server
#   check ifer and share name in the lo alias to make it look nice in Finder


if [ $# -lt 3 ]; then
    echo "usage: mount_remote_smb remotehost server share (username=currentuser) (lo_alias=<<hostname of server>>)"
    exit 1
fi

remotehost=$1
server=$2
share=$3
hostname=`echo $server |awk -F. '{ print $1 }'`
# logname on OS X gives the user name
def_user=`logname`
user=${4:-$def_user}

# the 'alias' is an additional network alias for loopback and that's what shows up in finder server list
# this doesn't check if the alias is already being used, which will break it
def_alias=$hostname  
lo_alias=${5:-$def_alias}

# need dynamic local port if in use for multiple tunnels
localport=4445 

ping -c 1 -w 5 $lo_alias &>/dev/null

if [ $? -ne 0 ] ; then
    echo "local admin password to add $lo_alias alias"
	sudo ifconfig lo0 alias $lo_alias up
fi

echo "if no keys, then enter ssh password for tunnel via $remotehost..."
ssh -f $user@$remotehost -L $lo_alias:$localport:$server:445 -N

if [ ! -d "/Volumes/$share" ]
then
    mkdir "/Volumes/$share"
fi
echo "password for $share on $server"
mount_smbfs  //$user@$lo_alias:4445/$share "/Volumes/$share"
open "/Volumes/$share/"

