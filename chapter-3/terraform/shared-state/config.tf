terraform {
  required_version = "~> 0.12.24"
  required_providers {
    aws = "~> 2.54"
  }
}

provider "aws" {
  region  = var.aws_region
  version = "~> 2.54.0"
}
