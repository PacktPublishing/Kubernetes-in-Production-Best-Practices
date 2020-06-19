resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_full_name
  version  = var.cluster_version
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
    subnet_ids         = concat(var.private_subnets, var.public_subnets)
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_clusterrole_policy_attachment,
    aws_iam_role_policy_attachment.eks_servicerole_policy_attachment,
  ]
}
