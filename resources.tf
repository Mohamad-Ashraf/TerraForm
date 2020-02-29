resource "azurerm_resource_group" "terra_proj" {
  location = "West US"
  name     = "terra_rg"
}

resource "azurerm_virtual_network" "terra_virtual_network" {
  address_space       = ["10.0.0.0/16"]
  location            = "West US"
  name                = "terravirtnetwork"
  resource_group_name = "azurerm_resource_group.terra_proj.name"
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
}

resource "azurerm_subnet" "subnet1" {
  name                 = "subnet1"
  virtual_network_name = "azurerm_virtual_network.terra_virtual_network.name"
  resource_group_name  = "azurerm_resource_group.terra_proj"
  address_prefix       = "10.0.1.0/24"
}

resource "azurerm_subnet" "subnet2" {
  name                 = "subnet2"
  virtual_network_name = "azurerm_virtual_network.terra_virtual_network.name"
  resource_group_name  = "azurerm_resource_group.terra_proj"
  address_prefix       = "10.0.2.0/24"
}
