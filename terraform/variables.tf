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

# ECR
variable "account_id" {
    type = string
}

# SG
variable "sg_ingress_ip_cidr" {
    type = string
}

# Route53
variable "domain_name" {
    type = string
}
