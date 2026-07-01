locals {
  github_pat = jsondecode(
    data.aws_secretsmanager_secret_version.github_token_version.secret_string
  )["my-github-pat"]

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
