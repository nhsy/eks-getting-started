#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "this" {
  cidr_block = "${var.network_cidr}"

  tags = "${
    map(
      "Name", "${var.resource_prefix}-vpc",
      "kubernetes.io/cluster/${local.cluster_name}", "shared",
    )
  }"
}

resource "aws_subnet" "this" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "${cidrsubnet(var.network_cidr, 8, count.index)}"
  vpc_id            = "${aws_vpc.this.id}"

  tags = "${
    map(
      "Name", "${var.resource_prefix}-subnet-${count.index + 1}",
      "kubernetes.io/cluster/${local.cluster_name}", "shared",
    )
  }"
}

resource "aws_internet_gateway" "this" {
  vpc_id = "${aws_vpc.this.id}"

  tags = {
    Name = "${var.resource_prefix}-igw"
  }
}

resource "aws_route_table" "this" {
  vpc_id = "${aws_vpc.this.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.this.id}"
  }

  tags = {
    Name = "${var.resource_prefix}-rtb"
  }
}

resource "aws_route_table_association" "this" {
  count = 2

  subnet_id      = "${aws_subnet.this.*.id[count.index]}"
  route_table_id = "${aws_route_table.this.id}"
}
