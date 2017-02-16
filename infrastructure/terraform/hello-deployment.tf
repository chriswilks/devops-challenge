module "web_app" {
  source = "web_app"
  servers = 2

  user = "${var.user}"
  environment = "${var.environment}"

}