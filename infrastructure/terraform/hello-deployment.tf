module "web_app" {
  source = "web_app"
  servers = 2

  web_instance_ami = "${var.web_instance_ami}"
  web_instance_type = "t2.micro"

  user = "${var.user}"
  environment = "${var.environment}"
  region = "${var.region}"

  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

//module "nginx_lb" {
//  source = "nginx"
//  lb_ami = "ami-cd99f2be"
//  region = "${var.region}"
//  user = "${var.user}"
//  environment = "${var.environment}"
//
//  access_key = "${var.access_key}"
//  secret_key = "${var.secret_key}"
//}

// Comment out nginx lb XXX
// copy config to new terraform directory XXXX
// add provisioning for the config file and restart service XXXX
// fix up bash script
// readme file
// deploy drone