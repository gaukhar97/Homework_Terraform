resource "aws_key_pair" "MY_KEY" {
  key_name   = "New_key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}