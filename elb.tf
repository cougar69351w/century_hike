resource "aws_elb" "century-hike-prod-web" {
  name               = "century-hike-prod-web"
  security_groups = ["${aws_security_group.elb-web-security-group.id}"]
  subnets = ["${aws_subnet.public-subnet-us-west-1a.id}"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port     = 22
    instance_protocol = "tcp"
    lb_port           = 2222
    lb_protocol       = "tcp"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/index.php"
    interval            = 30
  }

  instances                   = ["${aws_instance.century-hike-prod-web.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

}
