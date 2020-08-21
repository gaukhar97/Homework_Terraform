resource "aws_instance" "VPC" {
  ami                         = "${data.aws_ami.centos.id}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.my_key.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.vpc_hw.id}"]
  subnet_id                   = "${aws_subnet.public1.id}"
  associate_public_ip_address = "true"
  tags                        = "${var.tags}"
}

resource "aws_instance" "mysql" {
  ami                         = "${data.aws_ami.centos.id}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.my_key.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.sql_task.id}"]
  subnet_id                   = "${aws_subnet.public2.id}"
  associate_public_ip_address = "true"
  tags                        = "${var.tags}"
}
