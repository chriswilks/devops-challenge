resource "aws_instance" "web_instance" {
  vpc_security_group_ids = [
    "${aws_security_group.web_sg.id}"
  ]
  #count = "${var.servers}"

  ami = "${var.web_instance_ami}"
  instance_type = "${var.web_instance_type}"
  tags {
    Name = "${var.user}-${var.environment}-web-app"
  }
}