//variable "security_group_id" {}

//data "aws_security_group" "selected" {
//  id = "${var.security_group}"
//}

resource "aws_security_group" "web_sg" {
  name = "${var.user}-${var.environment}-web-sg"
  description = "Firewall rules for the web server."


  ingress {
    from_port = 8080
    to_port = 8484
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}
