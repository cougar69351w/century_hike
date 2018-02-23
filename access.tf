variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
  region     = "us-west-1"
}

resource "aws_key_pair" "josh-home" {
  key_name = "josh-home"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDe8o4Ig+ZXdRQgh2qaHcLYfo+lytQpljCfSL1/9tI9VQDIObvs7QLH9xlqAuwfuqZwTI4KcC+p0XB1HdnNAVTrOugz9A/ctIFTGKo664o9iGiWI4UkPN/gw/bdKiiwkRIexnb4AfDBJvthgX/8YW9W4SiNz+K8kY5nDFCldlW/zhF5zquCYphUkfVnO631l4Yv31uzi5YlveW1UiviiZ6IAj7x+9V6qoCfhYtRRSwvz58T6K3BJIZQP7fbkeKzwxmo00oGR8TrbyxFggDH1+6z8WmfDNhVAfCmEUxcLdquf326jABxtssgcdjtLZ+qVrJMzgn0oJnm3EBEbtxSl7j home@home-OptiPlex-760"
}
