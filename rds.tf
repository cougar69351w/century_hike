variable "RDS_PROD_USER" {}
variable "RDS_PROD_PASS" {}

### create db subnet group ###

resource "aws_db_subnet_group" "century-hike-prod-subnet-group" {
  name       = "century-hike-prod-subnet-group"
  subnet_ids = ["${aws_subnet.private-subnet-us-west-1a.id}", "${aws_subnet.private-subnet-us-west-1b.id}"]

  tags {
    Name = "century-hike-prod-subnet-group"
  }
}


### main century hike wordpress db instance ##

resource "aws_db_instance" "century-hike-prod-rds" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mariadb"
  engine_version       = "10.2.11"
  instance_class       = "db.t2.micro"
  multi_az             = "false"
  db_subnet_group_name = "${aws_db_subnet_group.century-hike-prod-subnet-group.id}"
  vpc_security_group_ids = ["${aws_security_group.rds-web-security-group.id}"]
  username             = "${var.RDS_PROD_USER}"
  password             = "${var.RDS_PROD_PASS}"
  name                 = "wordpress"
  skip_final_snapshot  = "true"
}

output "rds_endpoint" {
  value = "${aws_db_instance.century-hike-prod-rds.endpoint}"
}
