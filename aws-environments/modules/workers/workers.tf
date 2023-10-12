resource "aws_eks_node_group" "eks_workers" {

  cluster_name    = var.cluster_name
  node_group_name = "node-group-${var.project_name}"
  node_role_arn   = aws_iam_role.eks_workers_role.arn

  subnet_ids = [
    var.private_subnet_1a.id,
    var.private_subnet_1b.id
  ]

  instance_types = var.workers_size

  scaling_config {
    desired_size = lookup(var.auto_scale_options, "desired")
    max_size     = lookup(var.auto_scale_options, "max")
    min_size     = lookup(var.auto_scale_options, "min")
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_worker,
    aws_iam_role_policy_attachment.eks_worker_cni,
    aws_iam_role_policy_attachment.eks_worker_ecr,
  ]

}