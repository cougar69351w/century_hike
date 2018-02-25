resource "aws_instance" "century-hike-prod-web" {
  ami           = "ami-4a787a2a"
  instance_type = "t2.micro"
  key_name = "century-hike-prod"
  subnet_id = "${aws_subnet.private-subnet-us-west-1a.id}"
  security_groups = ["${aws_security_group.ec2-web-security-group.id}"]
  tags {
    Name = "century-hike-prod-web"
    Environment = "prod"
    Tier = "web"
  }
}
