output "sg_id" {
    description = "ID of security group"
    value = aws_security_group.default.id
}