#!/bin/bash

network_prefix=$1
dns_server=$2

for i in $(seq 1 254); do
    ip="$network_prefix.$i"
    host=$(nslookup $ip $dns_server 2>/dev/null | awk '/name =/ {print $4}')

    if [ ! -z "$host" ]; then
        echo "$ip -> $host"
    fi
done
