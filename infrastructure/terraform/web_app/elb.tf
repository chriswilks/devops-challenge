resource "aws_elb" "web_elb" {
  name = "${var.user}-${var.environment}-web-elb"
  availability_zones = ["${data.aws_availability_zones.available.names}"]

  listener {
    instance_port = 8484
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  cross_zone_load_balancing = true
}