resource "aws_subnet" "private_subnet_1a" {
  vpc_id = aws_vpc.project_vpc.id

  cidr_block        = "10.0.32.0/20"
  availability_zone = "eu-north-1a"

  tags = {
    Name = format("private_subnet_1a-%s", var.project-name)
  }
}

resource "aws_subnet" "private_subnet_1b" {
  vpc_id = aws_vpc.project_vpc.id

  cidr_block        = "10.0.48.0/20"
  availability_zone = "eu-north-1b"

  tags = {
    Name = format("private_subnet_1b-%s", var.project-name)
  }
}

resource "aws_route_table_association" "private_subnet_1a" {
  subnet_id      = aws_subnet.private_subnet_1a.id
  route_table_id = aws_route_table.nat_route_table.id
}

resource "aws_route_table_association" "private_subnet_1b" {
  subnet_id      = aws_subnet.private_subnet_1b.id
  route_table_id = aws_route_table.nat_route_table.id
}