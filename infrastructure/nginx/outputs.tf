output "nginx_public_dns" {
  value = "${module.nginx_lb.nginx_public_dns}"
}