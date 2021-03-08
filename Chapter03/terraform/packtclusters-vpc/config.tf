terraform {
  backend "s3" {
    bucket         = "packtclusters-vpc-terraform-state"
    key            = "packtclusters-vpc.tfstate"
    region         = "us-east-1"
    dynamodb_table = "packtclusters-vpc-terraform-state-lock-dynamodb"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.31.0"
    }
  }
  required_version = "~> 0.14.5"
}
