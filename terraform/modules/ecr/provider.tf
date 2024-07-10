# Terraform のバージョン指定
terraform {
  required_version = "~> 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.32.0"
    }
    null = {
      source = "hashicorp/null"
      version = ">= 3.2.2"
    }
  }
}

# プロバイダーを指定
provider "aws" {}
provider "null" {}