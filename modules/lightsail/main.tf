resource "aws_lightsail_static_ip" "this" {
  name = "tf-static-ip"
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

resource "aws_lightsail_static_ip_attachment" "this" {
  static_ip_name = "${aws_lightsail_static_ip.this.name}"
  instance_name  = "${aws_lightsail_instance.this.name}"
}

/*
resource "aws_route53_record" "tf-lightsail-test" {
  zone_id = "${var.zone_id}"
  name    = "lightsail.dshimizu.jp"
  type    = "A"
  ttl     = "300"
  records = ["${aws_lightsail_static_ip.this.ip_address}"]
}
*/
