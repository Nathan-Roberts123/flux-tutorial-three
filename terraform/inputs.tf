variable "github_owner" {
  description = "GitHub owner (organization or user)"
  type        = string
}

variable "environment" {
  description = "Environment name (development, staging, production)"
  type        = string
  default     = "development"
}

variable "repository_name" {
  description = "Name of the GitHub repository for Flux"
  type        = string
  default     = "flux-tutorial-three"
}

variable "repository_branch" {
  description = "Name of the GitHub repository branch for Flux"
  type        = string
  default     = "master"
}

variable "wallbag_credentials_region" {
  description = "The aws region of parater store wallabag database paraters"
  type        = string
  default     = "us-east-1"
}

variable "github_pat" {
  description = "PAT with permission for flux to bootstrap"
  type        = string
}