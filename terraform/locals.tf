locals {
  #GITHUB
  github_pat = jsondecode(
    data.aws_secretsmanager_secret_version.github_token_version.secret_string
  )["my-github-pat"]

  #IAM_ROLES
  oidc_issuer_url = data.aws_eks_cluster.this.identity[0].oidc[0].issuer

  oidc_issuer_id = element(
    split("/id/", local.oidc_issuer_url),
    1
  )

  oidc_provider_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/oidc.eks.us-east-1.amazonaws.com/id/${local.oidc_issuer_id}"

  #VPC
  name   = var.repository_name
  region = "eu-west-1"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = {
    Project    = local.name
    GithubRepo = local.name
    GithubOrg  = var.github_owner
  }
}
