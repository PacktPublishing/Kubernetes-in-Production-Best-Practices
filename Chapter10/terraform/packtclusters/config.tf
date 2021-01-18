terraform {
  backend "s3" {
    bucket         = "packtclusters-terraform-state"
    key            = "packtclusters.tfstate"
    region         = "us-east-1"
    dynamodb_table = "packtclusters-terraform-state-lock-dynamodb"
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

data "aws_ssm_parameter" "workers_ami_id" {
  name            = "/aws/service/eks/optimized-ami/1.16/amazon-linux-2/recommended/image_id"
  with_decryption = false
}
