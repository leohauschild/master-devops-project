resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = format("gw-%s", var.project_name)
  }
}

resource "aws_route_table" "igw_route_table" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = format("public-router-%s", var.project_name)
  }
}

resource "aws_route" "public_access" {
  route_table_id = aws_route_table.igw_route_table.id

  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}