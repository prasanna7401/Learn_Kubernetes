output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks-learn.name
}

# output "load_balancer_ip" {
#   value = try(azurerm_kubernetes_cluster.aks-learn.kube_config[0].host, "unable to fetch LB IP")
# }