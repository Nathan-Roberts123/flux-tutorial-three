output "cluster_path" {
  description = "Path in the repository for this cluster"
  value       = "clusters/${var.environment}"
}

# Output the Flux namespace
output "flux_namespace" {
  description = "Namespace where Flux is installed"
  value       = flux_bootstrap_git.this.namespace
}