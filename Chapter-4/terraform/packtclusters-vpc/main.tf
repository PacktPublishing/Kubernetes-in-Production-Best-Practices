locals {
  common_tags = {
    ManagedBy = "terraform"
  }
}

module "vpc" {
  source                          = "../modules/eks-vpc"
  clusters_name_prefix            = var.clusters_name_prefix
  eks_vpc_block                   = var.vpc_block
  eks_public_subnets_prefix_list  = var.public_subnets_prefix_list
  eks_private_subnets_prefix_list = var.private_subnets_prefix_list
  common_tags                     = local.common_tags
}
