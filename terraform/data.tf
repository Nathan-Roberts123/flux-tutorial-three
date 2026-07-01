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

data "aws_secretsmanager_secret" "github_token" {
  name = "my-github-pat"
}

data "aws_secretsmanager_secret_version" "github_token_version" {
  secret_id = data.aws_secretsmanager_secret.github_token.id
}

data "aws_availability_zones" "available" {
  # Exclude local zones
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}