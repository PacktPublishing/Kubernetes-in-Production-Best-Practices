output "eks_cluster_vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "eks_private_subnet_ids" {
  value = aws_subnet.eks_private_subnets.*.id
}

output "eks_public_subnet_ids" {
  value = aws_subnet.eks_public_subnets.*.id
}

output "eks_nat_ips" {
  value = aws_eip.eks_nat_ips.*.public_ip
}
