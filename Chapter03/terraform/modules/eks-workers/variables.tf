variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "cluster_full_name" {
  type = string
}

variable "cluster_security_group" {
  type = string
}

variable "cluster_endpoint" {
  type = string
}

variable "cluster_ca" {
  type = string
}

variable "workers_ami_id" {
  type = string
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
variable "workers_storage_size" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
