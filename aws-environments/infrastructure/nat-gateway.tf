resource "aws_eip" "vpc_eip" {
  domain = "vpc"

  tags = {
    Name = format("vpc-eip-%s", var.project-name)
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.vpc_eip.id
  subnet_id     = aws_subnet.public_subnet_1a.id

  tags = {
    Name = format("nat-gw-%s", var.project-name)
  }
}

resource "aws_route_table" "nat_route_table" {
  vpc_id = aws_vpc.project_vpc.id

  tags = {
    Name = format("nat-route-table-%s", var.project-name)
  }
}

resource "aws_route" "nat_access" {
  route_table_id         = aws_route_table.nat_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}