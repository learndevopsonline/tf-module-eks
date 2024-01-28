resource "aws_eks_cluster" "main" {
  name     = "main"
  role_arn = aws_iam_role.eks-cluster-role.arn
  version  = var.eks_version

  vpc_config {
    endpoint_private_access = true
    endpoint_public_access  = true
    subnet_ids = var.subnet_ids
  }
}

resource "aws_eks_node_group" "node-group" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "eks-spot"
  node_role_arn   = aws_iam_role.eks-node-role.arn
  subnet_ids      = var.subnet_ids
  capacity_type   = "SPOT"
  instance_types  = ["t3.xlarge", "t3.2xlarge", "c5.large"]

  scaling_config {
    desired_size = var.node_count
    max_size     = var.node_count + 5
    min_size     = var.node_count
  }

}




