//variable "security_group_id" {}

//data "aws_security_group" "selected" {
//  id = "${var.security_group}"
//}

resource "aws_security_group" "web_sg" {
  name = "${var.user}-${var.environment}-web-sg"
  description = "Firewall rules for the web server."

  ingress {
    from_port = 8484
    to_port = 8484
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
