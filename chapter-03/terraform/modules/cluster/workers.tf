module "workers" {
  source                 = "../eks-workers"
  vpc_id                 = var.vpc_id
  private_subnet_ids     = var.private_subnets
  cluster_full_name      = var.cluster_full_name
  cluster_endpoint       = module.eks.endpoint
  cluster_ca             = module.eks.ca
  cluster_security_group = module.eks.security_group
  workers_ami_id         = var.workers_ami_id
  workers_instance_type  = var.workers_instance_type
  workers_number_max     = var.workers_number_max
  workers_number_min     = var.workers_number_min
  workers_storage_size   = var.workers_storage_size
  common_tags            = var.common_tags
}
