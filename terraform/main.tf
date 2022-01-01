resource "azurerm_resource_group" "rg" {
  name      = var.resource_group_name
  location  = var.location
}

module "k8s" {
  source = "./modules/k8s"

  client_id           = var.client_id
  client_secret       = var.client_secret
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}
