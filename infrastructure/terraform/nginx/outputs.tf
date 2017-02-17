output "nginx_public_dns" {
  value = "${aws_instance.nginx_instance.public_dns}"
}
