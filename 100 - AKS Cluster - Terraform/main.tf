resource "azurerm_kubernetes_cluster" "aks-learn" {
  name                = "aks-learn-k8s"
  location            = data.azurerm_resource_group.rg-aks.location
  resource_group_name = data.azurerm_resource_group.rg-aks.name
  dns_prefix          = "aks-learn-k8s-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s" # Min. requirement for AKS is 2 vCPUs and 4GB RAM
  }

  identity {
    type = "SystemAssigned" # Other option is to create a service principal
  }

  tags = {
    environment = "test"
    purpose     = "learn-k8s"
  }

  # Add AKS as your current context in kubeconfig file
  provisioner "local-exec" {
    command = "az aks get-credentials --resource-group ${data.azurerm_resource_group.rg-aks.name} --name ${azurerm_kubernetes_cluster.aks-learn.name}"
  }

  # Clear contexts from kubeconfig during resource destruction
  provisioner "local-exec" {
    when    = destroy
    command = <<EOT
      kubectl config delete-context ${self.name}
      kubectl config unset users.clusterUser_${self.resource_group_name}_${self.name}
      kubectl config unset clusters.${self.name}
    EOT
  }
}