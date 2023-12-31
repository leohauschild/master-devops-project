output "project_vpc" {
  value = aws_vpc.project_vpc
}

output "private_subnet_1a" {
  value = aws_subnet.private_subnet_1a
}

output "private_subnet_1b" {
  value = aws_subnet.private_subnet_1b
}

output "public_subnet_1a" {
  value = aws_subnet.public_subnet_1a
}

output "public_subnet_1b" {
  value = aws_subnet.public_subnet_1b
}