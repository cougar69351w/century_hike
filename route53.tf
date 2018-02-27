resource "aws_route53_record" "century-hike-prod-www" {
  zone_id = "Z1OM7B1DRR89WG"
  name    = "centuryhiker.com"
  type    = "A"

 alias {
    name                   = "${aws_elb.century-hike-prod-web.dns_name}"
    zone_id                = "${aws_elb.century-hike-prod-web.zone_id}"
  }
}
