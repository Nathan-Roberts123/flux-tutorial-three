output "cluster_path" {
  description = "Path in the repository for this cluster"
  value       = "clusters/${var.environment}"
}

# Output the Flux namespace
output "flux_namespace" {
  description = "Namespace where Flux is installed"
  value       = flux_bootstrap_git.this.namespace
}

output "eks_cluster_name" {
  description = "Name of an EKS Cluster that was created"
  value       = module.eks_al2023.cluster_name
}