resource "aws_route53_record" "century-hike-prod-www" {
  zone_id = "Z375463F0HTERS"
  name    = "centuryhike.com"
  type    = "A"

 alias {
    name                   = "${aws_elb.century-hike-prod-web.dns_name}"
    zone_id                = "${aws_elb.century-hike-prod-web.zone_id}"
    evaluate_target_health = "false"
  }
}

resource "aws_route53_record" "century-hike-prod-www-www" {
  zone_id = "Z375463F0HTERS"
  name    = "www.centuryhike.com"
  type    = "A"

 alias {
    name                   = "${aws_elb.century-hike-prod-web.dns_name}"
    zone_id                = "${aws_elb.century-hike-prod-web.zone_id}"
    evaluate_target_health = "false"
  }
}
