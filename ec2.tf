resource "aws_instance" "century-hike-prod-web" {
  ami           = "ami-4a787a2a"
  instance_type = "t2.micro"
  key_name = "josh-home"
  subnet_id = "${aws_subnet.private-subnet-us-west-1a.id}"
  security_groups = ["${aws_security_group.ec2-web-security-group.id}"]
  user_data = <<-EOF
    #!/bin/bash
    yum -y install httpd
    printf "<html>\n<header><title>This is title</title></header>\n<body>\nHello world\n</body>\n</html>" > /var/www/html/index.html
    mv /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.bak
    service httpd restart
    EOF
  tags {
    Name = "century-hike-prod-web"
    Environment = "prod"
    Tier = "web"
  }
}
