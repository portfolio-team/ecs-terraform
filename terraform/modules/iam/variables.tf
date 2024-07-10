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
  role_name = "${var.name_prefix}-role"
  ecs_task_execution_role_policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}