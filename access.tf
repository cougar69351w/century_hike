variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}

provider "aws" {
  access_key = "${var.AWS_ACCESS_KEY}"
  secret_key = "${var.AWS_SECRET_KEY}"
  region     = "us-west-1"
}

resource "aws_key_pair" "josh-home" {
  key_name = "josh-home"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5LXrGUpz28kCIuTK/mps/Se8MDf8HfVPMeBCbslhuvzhxJ4wci00rXlwz344JM0vVY/PL4Jr2MJ6WfVEO2V6JZtJgztR0P1+1rxhGYD8HysUw7WuHHSrNaAFVwgrdiLPH2ENbcyf7NJDn+3cCDoshSp/6Z6X+yvxWgNuMxsVwJtiazmpGRtD9U2aj9VhfBdCH05UCZRmhL4wPgi3uGrTRAPOwD/kZaAR1TT+/96FzEtITOh3tnacFn7s7FI/BDXHaexe8UuzyLt0AY02wALplnG5Mtqf1FU4/daTk8vOxRqZXPDYBym3A9aLAsgNy5w0qV1s8E4EUb5Rc/f/G66Df jzmoore@USBUR60WB154904"
}
