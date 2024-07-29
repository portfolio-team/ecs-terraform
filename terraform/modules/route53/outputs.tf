output "acm_certificate_arn" {
    description = "arn of target ACM certificate"
    value = aws_acm_certificate.www.arn
}

output "aws_acm_certificate_validation" {
    description = "ACM certificate validatio"
    value = aws_acm_certificate_validation.www
}