resource "aws_instance" "century-hike-prod-web" {
  ami           = "ami-4a787a2a"
  instance_type = "t2.micro"
  key_name = "josh-home"
  security_groups = [
    "ec2-web-security-group",
  ]
  tags {
    Name = "century-hike-prod-web"
    Environment = "prod"
    Tier = "web"
  }
}
