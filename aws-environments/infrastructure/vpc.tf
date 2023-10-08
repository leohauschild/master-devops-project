resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = format("vpc-%s", var.project_name)
  }
}

