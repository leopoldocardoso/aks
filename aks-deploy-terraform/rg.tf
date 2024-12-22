resource "azurerm_resource_group" "rg-aks" {
  name     = "rg-aks-devlab"
  location = "eastus"

  tags = {
    ambiente = "dev"
    projeto  = "devops-sre"
    iac      = "terraform"
  }

}