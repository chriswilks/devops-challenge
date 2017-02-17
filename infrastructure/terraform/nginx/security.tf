//variable "security_group_id" {}

//data "aws_security_group" "selected" {
//  id = "${var.security_group}"
//}

resource "aws_security_group" "lb_sg" {
  name = "${var.user}-${var.environment}-lb-sg"
  description = "Firewall rules for the load balancer."

  ingress {
    from_port = 8080
    to_port = 8080
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
