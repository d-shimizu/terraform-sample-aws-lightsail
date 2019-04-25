provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
}

# Create a new Lightsail Instance
# https://www.terraform.io/docs/providers/aws/r/lightsail_instance.html
resource "aws_lightsail_instance" "this" {
  name              = "dev01"
  availability_zone = "ap-northeast-1a"
  blueprint_id      = "amazon_linux_2018_03_0_2"
  bundle_id         = "nano_2_0"
  key_pair_name     = "lightsail-key-pair"
}
