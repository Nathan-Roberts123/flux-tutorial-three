locals {
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

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 6.0"

  name = local.name
  cidr = local.vpc_cidr

  azs             = local.azs
  public_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]

  map_public_ip_on_launch = true

  enable_nat_gateway = false
  single_nat_gateway = false

  public_subnet_tags = {
    "kubernetes.io/role/elb" = 1
    "kubernetes.io/cluster/${local.name}" = "shared"
  }

  tags = local.tags
}