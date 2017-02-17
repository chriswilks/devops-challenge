
### Variables to be passed in at runtime

variable "user" {
  description = "The name of the user."
}

variable "environment" {
  description = "The name of the environment that the user wants to create."
}

variable "access_key" {
  description = "The AWS access key"
}

variable "secret_key" {
  description = "The AWS secret key"
}

### Optional Variables

variable "region" {
  description = "The region of AWS where the instance should be created."
  default = "eu-west-1"
}
