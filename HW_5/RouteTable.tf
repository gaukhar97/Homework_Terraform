resource "aws_route_table" "RT" {
  vpc_id = "${aws_vpc.VPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.public1.id}"
  route_table_id = "${aws_route_table.RT.id}"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.public2.id}"
  route_table_id = "${aws_route_table.RT.id}"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.public3.id}"
  route_table_id = "${aws_route_table.RT.id}"
}