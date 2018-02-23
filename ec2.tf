resource "aws_instance" "web" {
  ami           = "ami-4a787a2a"
  instance_type = "t2.micro"
  key_name = "josh-home"
  security_groups = [
    "main-security-group",
  ]
  tags {
    Name = "Test"
  }
}
