output "dns_name" {
    description = "dns name of ALB"
    value = aws_lb.default.dns_name
}

output "tg_arn" {
    description = "arn of target group"
    value = aws_lb_target_group.default.arn
}