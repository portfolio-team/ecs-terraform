# プライベートDNSゾーンの定義
resource "aws_route53_zone" "this" {
  name = var.domain_name

  tags = {
    Name = "${var.tag_name}-repository"
    group = var.tag_group
  }
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.this.zone_id
  name    = "www.${var.domain_name}"
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}