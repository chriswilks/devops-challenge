//output "public_ips" {
//  value = "${module.web_app.public_ips}"
//}

output "public_dns" {
  value = "${module.web_app.public_dns}"
}
//
//output "nginx_public_dns" {
//  value = "${module.nginx_lb.nginx_public_dns}"
//}

output "elb_instances" {
  value = "${module.web_app.elb_instances}"
}