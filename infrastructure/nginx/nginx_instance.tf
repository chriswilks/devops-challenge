module "nginx_lb" {
  source = "../terraform/nginx"
  lb_ami = "ami-cd99f2be"
  region = "${var.region}"
  user = "${var.user}"
  environment = "${var.environment}"

  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}