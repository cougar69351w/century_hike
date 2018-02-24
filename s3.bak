### bucket to store packages and website assets ##

resource "aws_s3_bucket" "century-hike-prod-assets" {
  bucket = "century-hike-prod-assets"
  acl    = "private"
  region = "us-west-1"
  tags {
    Name        = "century-hike-prod-assets"
    Environment = "prod"
  }
}
