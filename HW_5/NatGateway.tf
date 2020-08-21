# resource "aws_nat_gateway" "igw" {
#   allocation_id = "${aws_eip.nat.id}"
#   subnet_id     = "${var.public_cidr1}" #?
#   tags          = "${var.tags}"
# }

# resource "aws_eip" "nat" {
#   vpc  = true
#   tags = "${var.tags}"
# }
