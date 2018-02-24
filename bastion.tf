resource "aws_instance" "century-hike-bastion" {
  ami           = "ami-4a787a2a"
  instance_type = "t2.micro"
  key_name = "century-hike-prod"
  subnet_id = "${aws_subnet.public-subnet-us-west-1a.id}"
  security_groups = ["${aws_security_group.bastion-security-group.id}"]
  tags {
    Name = "century-hike-bastion"
    Environment = "dmz"
    Tier = "bastion"
  }
}

resource "aws_security_group" "bastion-security-group" {
  name        = "bastion-security-group"
  vpc_id      = "${aws_vpc.century-hike-vpc.id}"
 
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["47.41.249.166/32"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["168.161.192.15/32"]
  }
}

output "bastion_public_ip" {
  value = "${aws_instance.century-hike-bastion.public_ip}"
}
