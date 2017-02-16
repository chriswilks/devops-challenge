data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web_instance" {
  vpc_security_group_ids = [
    "${aws_security_group.web_sg.id}"
  ]
  #count = "${var.servers}"

  #ami = "${var.web_instance_ami}"
  ami = "${data.aws_ami.ubuntu.id}"

  instance_type = "${var.web_instance_type}"
  tags {
    Name = "${var.user}-${var.environment}-hello-app"
  }
}