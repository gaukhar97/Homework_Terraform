resource "aws_route53_record" "www" {
  zone_id = "Z03745072VCYQNBGBFR2N"
  name    = "jenkins.imankulova.com"
  type    = "A"
  ttl     = "30"
  records = ["${aws_instance.Jenkins.public_ip}"]
}