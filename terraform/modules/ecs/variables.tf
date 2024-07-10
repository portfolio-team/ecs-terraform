# Global
variable region {
  type = string
}
variable name_prefix {
  type = string
}
variable webapp_port {
    type = number
}

# Tags
variable tag_name {
  type = string
}
variable tag_group {
  type = string
}

# Task
variable ecr_repository_uri {
    type = string
}
variable execution_role_arn {
    type = string
}

# Service
variable logs_group_name {
    type = string
}
variable tg_arn {
    type = string
}
variable public_a_id {
    type = string
}
variable public_c_id {
    type = string
}
variable sg_id {
    type = string
}

locals {
  ecs_cluster_name = "${var.name_prefix}-cluster"
  task_definitions_filepath = "${path.module}/task_definition.json"
  task_definitions_name = "${var.name_prefix}-task"
  task_cpu = 256
  task_memory = 512
  task_log_driver = "awslogs"
  task_network_mode = "awsvpc"
  task_requires_compatibilities = "FARGATE"

  service_name = "${var.name_prefix}-service"
  service_count = 1
}
