provider "aws" {
  region  = "${var.region}"
  profile = "${var.profile}"
}

module "aws_lightsail" {
    source = "./modules/lightsail"
}

