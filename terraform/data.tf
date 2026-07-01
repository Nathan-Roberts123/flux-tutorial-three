data "aws_eks_cluster" "this" {
  name = module.eks_al2023.cluster_name

  depends_on = [
    module.eks_al2023
  ]
}

data "aws_eks_cluster_auth" "this" {
  name = module.eks_al2023.cluster_name

  depends_on = [
    module.eks_al2023
  ]
}

data "aws_availability_zones" "available" {
  # Exclude local zones
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

data "aws_caller_identity" "current" {}