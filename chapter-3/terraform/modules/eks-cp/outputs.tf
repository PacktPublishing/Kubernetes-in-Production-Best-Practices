output "security_group" {
  value = aws_security_group.eks_cluster_sg.id
}

output "ca" {
  value = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}
