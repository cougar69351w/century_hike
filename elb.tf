resource "aws_elb" "century-hike-prod-web" {
  name               = "century-hike-prod-web"
  availability_zones = ["us-west-1a", "us-west-1b"]
  security_groups = ["elb-web-security-group"]

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 30
    target              = "HTTP:80/index.html"
    interval            = 35
  }

  instances                   = ["${aws_instance.century-hike-prod-web.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

}
