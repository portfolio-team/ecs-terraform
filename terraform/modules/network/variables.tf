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

# Internet Gateway

locals {
  vpc_cidr = "10.0.0.0/16"
}