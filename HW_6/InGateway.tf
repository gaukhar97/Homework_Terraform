resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.VPC.id}"
  tags   = "${var.tags}"
}
