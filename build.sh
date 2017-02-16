#!/bin/bash

access_key=$1
secret_key=$2

printf "Building application..."
go build -o hello-app/bin/hello-app hello-app/src/app.go
printf "done.\n"

printf "Building Amazon Machine Image..."
packer build -var "aws_access_key=$access_key" -var "aws_secret_key=$secret_key" hello-app/ami/hello-app.json
printf "done.\n"

sleep 3
ami=`cat manifest.json | jq '.builds[0].artifact_id'`

printf  "Web App AMI Id: $ami\n"

rm manifest.json

### Separate application build from deployment pipeline

#terraform get

#terraform plan

#terraform apply