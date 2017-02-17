output "public_dns" {
  value = "${aws_elb.web_elb.dns_name}"
}

output "elb_instances" {
  value = "${aws_elb.web_elb.instances}"
}