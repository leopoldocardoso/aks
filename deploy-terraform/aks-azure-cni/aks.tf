resource "azurerm_kubernetes_cluster" "aks-devlab" {
  name                = "aks-dev"
  location            = azurerm_resource_group.rg-aks.location
  resource_group_name = azurerm_resource_group.rg-aks.name
  dns_prefix          = "aksdevdelab"


# Network Plugin Azure CNI
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }


  default_node_pool {
    name       = "aksdev"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    ambiente = "dev"
    projeto  = "devops-sre"
    iac      = "terraform"
  }

}