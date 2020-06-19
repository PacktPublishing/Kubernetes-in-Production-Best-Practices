variable "aws_region" {
  type = string
}

variable "clusters_name_prefix" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "workers_storage_size" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "workers_instance_type" {
  type = string
}

variable "workers_number_min" {
  type = string
}

variable "workers_number_max" {
  type = string
}
