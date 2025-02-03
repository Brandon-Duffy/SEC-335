#!/bin/bash


#files() {
 #  echo "files: $0 <hostfile> <portfile>"
  # echo "hostfile: this file contains a lists of hosts
   #echo "portfile: This file contains a list of ports
   #exit 1
#}


#hostfile=$1
#portfile=$2
#echo "host,port"
#for host in $(cat $hostfile); do
 # for port in $(cat $portfile); do
  #  timeout 1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && echo "$host,$port"
  #done
#done

hostprefix="10.0.5"
port=53

echo "host,port"

for i in $(seq 1 254); do
    host="$hostprefix.$i"
    timeout 1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null && echo "$host,$port"
done
