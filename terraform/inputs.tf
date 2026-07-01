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