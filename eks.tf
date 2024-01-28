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


