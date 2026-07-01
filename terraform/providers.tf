provider "aws" {
  region = local.region
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.this.endpoint
  cluster_ca_certificate = base64decode(
    data.aws_eks_cluster.this.certificate_authority[0].data
  )
  token = data.aws_eks_cluster_auth.this.token
}

provider "flux" {
  kubernetes = {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(
      data.aws_eks_cluster.this.certificate_authority[0].data
    )
    token = data.aws_eks_cluster_auth.this.token
  }

  git = {
    url = "https://github.com/${var.github_owner}/${var.repository_name}.git"
    http = {
      username = "git" # This can be any string when using a personal access token
      password = data.aws_secretsmanager_secret_version.github_token_version.secret_string
    }
  }
}