resource "aws_instance" "century-hike-prod-web" {
  ami           = "ami-adf8f3cd"
  instance_type = "t2.micro"
  key_name = "century-hike-prod"
  subnet_id = "${aws_subnet.private-subnet-us-west-1a.id}"
  security_groups = ["${aws_security_group.ec2-web-security-group.id}"]
  user_data = <<-EOF
    #!/bin/bash
    CHDBHOST="${aws_db_instance.century-hike-prod-rds.endpoint}"
    /bin/sed -i 's/chdbhostsedreplace/'$CHDBHOST'/g' /var/www/html/wp-config.php 
    EOF
  tags {
    Name = "century-hike-prod-web"
    Environment = "prod"
    Tier = "web"
  }
}

output "prod_web_private_ip" {
  value = "${aws_instance.century-hike-prod-web.private_ip}"
}
