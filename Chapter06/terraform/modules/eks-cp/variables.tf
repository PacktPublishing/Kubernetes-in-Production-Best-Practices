variable "cluster_full_name" {
  type = string
}

variable "cluster_version" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "cluster_log_types" {
  type = list(string)
}
