resource "aws_subnet" "public_subnet_1a" {
  vpc_id = aws_vpc.project_vpc.id

  cidr_block              = "10.0.0.0/20"
  availability_zone       = "eu-north-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = format("public_subnet_1a-%s", var.project-name)
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id = aws_vpc.project_vpc.id

  cidr_block              = "10.0.16.0/20"
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = format("public_subnet_1b-%s", var.project-name)
  }
}

resource "aws_route_table_association" "public_subnet_1a" {
  subnet_id      = aws_subnet.public_subnet_1a.id
  route_table_id = aws_route_table.igw_route_table.id
}

resource "aws_route_table_association" "public_subnet_1b" {
  subnet_id      = aws_subnet.public_subnet_1b.id
  route_table_id = aws_route_table.igw_route_table.id
}