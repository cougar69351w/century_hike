resource "aws_security_group" "main-security-group" {
  name        = "main-security-group"
  vpc_id      = "vpc-25a80142"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["47.41.46.230/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}
