#!/bin/bash

access_key=$1
secret_key=$2

environment='dev'
user='chris'

printf "Building application..."
go build -o hello-app/bin/hello-app hello-app/src/app.go
printf "done.\n"

printf "Building Amazon Machine Image..."
packer build -var "aws_access_key=$access_key" -var "aws_secret_key=$secret_key" hello-app/ami/hello-app.json
printf "done.\n"

#sleep 3
ami=`cat manifest.json | jq '.builds[0].artifact_id' | sed 's/.*://' | sed "s/.\$//g"`

printf  "Web App AMI Id: $ami\n"

rm manifest.json

### Separate application build from deployment pipeline

cd infrastructure/terraform

printf "Running terraform...\n"
terraform get
terraform plan -var "access_key=$access_key" -var "secret_key=$secret_key" -var "web_instance_ami=$ami" -var "user=$user" -var "environment=$environment"
terraform apply -var "access_key=$access_key" -var "secret_key=$secret_key" -var "web_instance_ami=$ami" -var "user=$user" -var "environment=$environment"
printf "... complete\n"

### Deploy Nginx LB knowing IP's of web server instances

cd ../nginx

printf "Injecting IPs...\n"
ips=( $(aws ec2 describe-instances --filters "Name=image-id, Values=$ami" "Name=instance-state-name, Values=running" | jq -r '.Reservations[] | .Instances[] | .PublicIpAddress') )
printf 'Instance IPs:\n'
printf '%s\n' "${ips[@]}"

### Put IPs into nginx config for file provisioner to pick up
sed -e "s/{IP1}/${ips[0]}/" -e "s/{IP2}/${ips[1]}/" nginx.conf.template > nginx.conf
printf "... done\n"

printf "Running terraform...\n"
terraform get
terraform plan -var "access_key=$access_key" -var "secret_key=$secret_key" -var "user=$user" -var "environment=$environment"
terraform apply -var "access_key=$access_key" -var "secret_key=$secret_key" -var "user=$user" -var "environment=$environment"
printf "... complete\n"