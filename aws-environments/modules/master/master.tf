resource "aws_eks_cluster" "eks_cluster" {

  name     = "eks-cluster-${var.project_name}"
  role_arn = aws_iam_role.eks_role.arn
  version  = var.cluster_version

  vpc_config {
    subnet_ids = [
      var.private_subnet_1a.id,
      var.private_subnet_1b.id
    ]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,
    aws_iam_role_policy_attachment.eks_cluster_vpc_policy,
  ]
}