aws_region = "us-east-1"
private_subnet_ids = [
  "subnet-052d5e85a1db9bd01",
  "subnet-04deecde3728778d9",
  "subnet-03ef24e9e234ad948",
]
public_subnet_ids = [
  "subnet-03e4f656e74e46b5b",
  "subnet-0c11cd716dc909a2a",
  "subnet-0195eb3957b83245b",
]
vpc_id = "vpc-0d235d91d32e723ef"
clusters_name_prefix  = "packtclusters"
cluster_version       = "1.18"
workers_instance_type = "t3.medium"
workers_number_min    = 3
workers_number_max    = 5
workers_storage_size  = 10

cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
