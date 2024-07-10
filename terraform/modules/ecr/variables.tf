# Global
variable region {
  type = string
}
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

# ECR
variable "account_id" {
  type = string
}

locals {
  repository_name = "${var.name_prefix}-repository"
  container_name = "${var.name_prefix}-container"
  docker_dir = "../../../fastapi/docker-compose.yaml"
}