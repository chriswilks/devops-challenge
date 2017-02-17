#!/bin/bash

access_key=$1
secret_key=$2

environment='dev'
user='chris'

cd infrastructure/terraform
terraform destroy -var "access_key=$access_key" -var "secret_key=$secret_key" -var "user=$user" -var "environment=$environment" -var "web_instance_ami="

cd ../nginx
terraform destroy -var "access_key=$access_key" -var "secret_key=$secret_key" -var "user=$user" -var "environment=$environment"

