# Devops Challenge

## Intro

A deployment of two sample web applications written in Go, deployed onto AWS using Terraform.
Packer is used to build an AMI containing the application from an Ubuntu base image.
Terraform is then used to deploy two instances into an autoscaling group, with security groups and Elastic Load Balancer.
The web server IPs are then passed to another terraform execution to deploy a round-robin Nginx load balancer using Terraform provisioners.

## Usage

To create and deploy the application and infrastructure:
```./build.sh <AWS_ACCESS_KEY> <AWS_SECRET_KEY>```

To tear down the infrastructure:
```./destroy.sh <AWS_ACCESS_KEY> <AWS_SECRET_KEY>```
