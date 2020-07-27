output "cluster_full_name" {
  value = var.cluster_full_name
}

output "cluster_version" {
  value = var.cluster_version
}

output "cluster_api" {
  value = module.eks.endpoint
}

output "cluster_tag" {
  value = module.workers.tag
}

output "worker_iam_role_name" {
  value = module.workers.iam_role_name
}

output "worker_iam_role_arn" {
  value = module.workers.iam_role_arn
}

output "worker_asg_names" {
  value = module.workers.asg_names
}

output "worker_security_group" {
  value = module.workers.security_group_id
}

output "workers_instance_profile" {
  value = module.workers.instance_profile
}

output "workers_userdata" {
  value = module.workers.userdata
}

output "authconfig" {
  value = module.workers.authconfig
}
