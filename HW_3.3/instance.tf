resource "aws_instance" "NagiosXI" {
  ami           = "${data.aws_ami.centos.id}" 
  instance_type = "t2.large"
  key_name  = "${aws_key_pair.my_key.key_name}"
  vpc_security_group_ids = ["${aws_security_group.Adminex.id}"]
}
