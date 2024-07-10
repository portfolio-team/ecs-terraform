output "vpc_id" {
    description = "ID of VPC"
    value = aws_vpc.default.id
}
output "public_a_id" {
    description = "ID of subnet public_a"
    value = aws_subnet.public_a.id
}
output "public_c_id" {
    description = "ID of subnet public_c"
    value = aws_subnet.public_c.id
}