resource "aws_instance" "Jenkins" {
  ami           = "${data.aws_ami.centos.id}" 
  instance_type = "t2.micro"
  key_name  = "${aws_key_pair.my_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.Adminex.id}"]
}
