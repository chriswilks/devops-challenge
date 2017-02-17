resource "aws_instance" "nginx_instance" {
//  name = "nginx:1.11.10"

  instance_type = "t1.micro"

  ami = "${var.lb_ami}"

  vpc_security_group_ids = [
    "${aws_security_group.lb_sg.id}"
  ]

  key_name = "chris-mac-ssh-key"
  tags {
    Name = "${var.user}-${var.environment}-hello-lb"
  }


//  listener {
//    instance_port = 8080
//    instance_protocol = "http"
//    lb_port = 80
//    lb_protocol = "http"
//  }

  provisioner "file" {
    source = "nginx.conf"
    destination = "/tmp/nginx.conf"
    connection {
      type = "ssh",
      user = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }

  provisioner "remote-exec" {
    connection {
      type = "ssh",
      user = "ubuntu"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
      "sudo chown root:root /tmp/nginx.conf",
      "sudo service nginx stop",
      "sudo rm /etc/nginx/nginx.conf",
      "sudo mv /tmp/nginx.conf /etc/nginx/nginx.conf",
      "sudo service nginx restart"
    ]
  }

}

