# Global
variable name_prefix {
  type = string
}

# Tags
variable tag_name {
  type = string
}
variable tag_group {
  type = string
}

# ALB
variable public_a_id {
    type = string
}
variable public_c_id {
    type = string
}
variable sg_id {
    type = string
}

# Target Group
variable "vpc_id" {
    type = string
}

locals {
  alb_name = "${var.name_prefix}-alb"
  tg_name = "${var.name_prefix}-tg"
}
