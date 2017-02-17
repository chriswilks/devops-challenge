variable "lb_ami" {
  description = "The AMI for the load balancer."
}

variable "region" {
  description = "The region of AWS where the instance should be created."
}

variable "user" {
  description = "The name of the user."
}

variable "environment" {
  description = "The name of the environment that the user wants to create."
}

variable "access_key" {
  description = "The AWS access key"
  default = "--REMOVED--"
}

variable "secret_key" {
  description = "The AWS secret key"
  default = "--REMOVED--"
}