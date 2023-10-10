#!/bin/bash

if [ $# != 3 ]; then
    echo -e "Provide a Target , Username and  Destination : $0 <target> <username> <destination>
    exit 1
fi

target=$1
username=$2
destination=$3

scp something.txt $username@$target:$destination > transfer_report