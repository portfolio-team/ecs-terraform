resource "aws_acm_certificate" "www" {
  domain_name               = aws_route53_record.www.name
  subject_alternative_names = []
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

# 検証用DNSレコード
resource "aws_route53_record" "www_certificate" {
  for_each = {
    for dvo in aws_acm_certificate.www.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }
  name     = each.value.name
  records  = [each.value.record]
  type     = each.value.type
  zone_id  = aws_route53_zone.this.id
  ttl      = 3600
}

# SSL証明書の検証
resource "aws_acm_certificate_validation" "www" {
  certificate_arn         = aws_acm_certificate.www.arn
  validation_record_fqdns = [for record in aws_route53_record.www_certificate : record.fqdn]
}
