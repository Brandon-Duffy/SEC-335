#!/bin/bash


files() {
   echo "files: $0 <hostfile> <portfile>"
   echo "hostfile: this file contains a lists of hosts
   echo "portfile: This file contains a list of ports
   exit 1
}


hostfile=$1
portfile=$2
echo "host,port"
for host in $(cat $hostfile); do
  for port in $(cat $portfile); do
    timeout 1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && echo "$host,$port"
  done
done
