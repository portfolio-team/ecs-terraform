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

locals {
  logs_group_name = "/ecs/${var.name_prefix}-service"
  retention_in_days = 30
}