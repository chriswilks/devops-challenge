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

sleep 3
ami=`cat manifest.json | jq '.builds[0].artifact_id' | sed 's/.*://'` | sed "s/.$//g"

printf  "Web App AMI Id: $ami\n"

#rm manifest.json

### Separate application build from deployment pipeline

cd infrastructure/terraform

terraform get

printf "Running plan...\n"
terraform plan -var "access_key=$access_key" -var "secret_key=$secret_key" -var "web_instance_ami=$ami" -var "user=$user" -var "environment=$environment"
printf "...plan complete\n"

#terraform apply