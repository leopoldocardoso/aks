terraform {
  backend "azurerm" {
    resource_group_name  = "rg-backend"
    storage_account_name = "storagebackend"
    container_name       = "conteiner-backend"
    key                  = "aksdevlab.tfstate"
    access_key           = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
  }
}
