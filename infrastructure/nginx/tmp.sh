#!/bin/bash

ips=( $(aws ec2 describe-instances --filters "Name=image-id, Values=ami-0909296f" "Name=instance-state-name, Values=running" | jq -r '.Reservations[] | .Instances[] | .PublicIpAddress') )
printf 'Instance IPs:\n'
printf '%s\n' "${ips[@]}"

sed -e "s/{IP1}/${ips[0]}/" -e "s/{IP2}/${ips[1]}/" nginx.conf.template > nginx.conf
