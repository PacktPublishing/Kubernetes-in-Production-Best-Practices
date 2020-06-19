terraform {
  backend "s3" {
    bucket         = "packtclusters-vpc-terraform-state"
    key            = "packtclusters-vpc.tfstate"
    region         = "us-east-1"
    dynamodb_table = "packtclusters-vpc-terraform-state-lock-dynamodb"
  }
  required_version = "~> 0.12.24"
  required_providers {
    aws = "~> 2.54"
  }
}

provider "aws" {
  region  = var.aws_region
  version = "~> 2.54.0"
}
