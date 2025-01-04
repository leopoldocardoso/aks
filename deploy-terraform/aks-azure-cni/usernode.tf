resource "azurerm_kubernetes_cluster_node_pool" "usernode" {
  name                  = "useraksdev"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks-devlab.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 1
  depends_on            = [azurerm_kubernetes_cluster.aks-devlab]

  tags = {
    ambiente = "dev"
    projeto  = "devops-sre"
    iac      = "terraform"
  }
}
