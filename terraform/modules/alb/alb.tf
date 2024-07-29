resource "aws_lb" "default" {
  name                       = local.alb_name
  load_balancer_type         = "application"
  internal                   = false
  idle_timeout               = 60
  enable_deletion_protection = false

  subnets = [
    var.public_a_id,
    var.public_c_id,
  ]
  security_groups = [
    var.sg_id
  ]

  tags = {
    Name = "${var.tag_name}-alb"
    group = var.tag_group
  }
}

resource "aws_alb_listener" "default" {
  load_balancer_arn = aws_lb.default.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.default.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.acm_certificate_arn #証明書
  ssl_policy        = "ELBSecurityPolicy-2016-08"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }

  depends_on = [
    var.aws_acm_certificate_validation
  ]

}

resource "aws_lb_listener_rule" "https" {
  listener_arn = aws_lb_listener.https.arn
  priority     = 99

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.default.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}
