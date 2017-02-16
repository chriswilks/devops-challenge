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