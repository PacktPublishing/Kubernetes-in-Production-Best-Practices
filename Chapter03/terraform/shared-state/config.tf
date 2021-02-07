terraform {
  required_version = "~> 0.12.28"
}

provider "aws" {
  region  = var.aws_region
  version = "~> 2.54.0"
}
