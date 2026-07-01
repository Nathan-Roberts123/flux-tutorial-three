resource "flux_bootstrap_git" "this" {

  # Path inside the Git repository where this cluster's manifests live
  path = "clusters/${var.environment}"

  # Flux components to install on the cluster
  components = [
    "source-controller",
    "kustomize-controller",
    "helm-controller",
    "notification-controller"
  ]

  # Namespace where Flux system components are deployed
  namespace = "flux-system"

  # Set the Flux version to install
  version = "v2.8.7"
}