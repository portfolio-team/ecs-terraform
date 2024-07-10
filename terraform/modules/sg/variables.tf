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

# SG
variable sg_ingress_ip_cidr {
  type = string
}
variable vpc_id {
  type = string
}

locals {
  sg_name = "${var.name_prefix}-sg"
}