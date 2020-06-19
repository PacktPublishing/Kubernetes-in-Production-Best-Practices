aws_region = "us-east-1"
private_subnet_ids = [
  "subnet-xxxxxxxx",
  "subnet-xxxxxxxx",
  "subnet-xxxxxxxx",
]
public_subnet_ids = [
  "subnet-xxxxxxxx",
  "subnet-xxxxxxxx",
  "subnet-xxxxxxxx",
]
vpc_id = "vpc-xxxxxxxxxx"
clusters_name_prefix  = "packtclusters"
cluster_version       = "1.16"
workers_instance_type = "t3.medium"
workers_number_min    = 3
workers_number_max    = 5
workers_storage_size  = 10
