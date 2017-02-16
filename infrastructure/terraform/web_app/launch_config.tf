resource "aws_launch_config" "web_aws" {
  name_prefix = "${var.user}-${var.environment}-web-server-"
  security_groups = [
    "${aws_security_group.web.id}"
  ]

  image_id = "${var.web_instance_ami}"
  instance_type = "${var.web_instance_type}"
}
