output "IP" {
  value = "${aws_instance.Homework2.public_ip}"
}

output "ID" {
  value = "${aws_instance.Homework2.id}"
}

output "PIP" {
  value = "${aws_instance.Homework2.private_ip}"
}

output "KEY" {
  value = "${aws_instance.Homework2.key_name}"
}

output "ARN" {
  value = "${aws_instance.Homework2.arn}"
}

output "DNS" {
  value = "${aws_instance.Homework2.public_dns}"
}
