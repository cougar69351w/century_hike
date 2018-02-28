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
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = "arn:aws:acm:us-west-1:800539711012:certificate/e7a87484-5f79-4beb-8f89-19605318700e"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "TCP:80"
    interval            = 30
  }

  instances                   = ["${aws_instance.century-hike-prod-web.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

}
