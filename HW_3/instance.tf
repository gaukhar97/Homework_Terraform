resource "aws_instance" "Homework3" {
ami = "${data.aws_ami.centos.id}" 
instance_type = "t2.micro"
key_name = "${aws_key_pair.MY_KEY.key_name}"
vpc_security_group_ids = ["${aws_security_group.allow_ssh2.id}"]
}