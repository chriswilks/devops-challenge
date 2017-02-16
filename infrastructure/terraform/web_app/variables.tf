variable "region" {
  description = "The region of AWS where the instance should be created."
}

variable "servers" {
  description = "The number of servers to launch."
  default = "2"
}

variable "web_instance_ami" {
  description = "The AMI for the web server."
  default = "ami-30361056"
}

variable "web_instance_type" {
  description = "The type of instance for the web server."
  default = "t2.micro"
}

variable "user" {
  description = "The name of the user."
}

variable "environment" {
  description = "The name of the environment that the user wants to create."
}