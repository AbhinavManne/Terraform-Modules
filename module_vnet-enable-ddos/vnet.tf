#Reading existing resource group info
data "azurerm_resource_group" "example" {
  name = var.resource_group_name
}

#Reading existing DDoS protection plan info
data "azurerm_network_ddos_protection_plan" "ddosplan" {
  name                = var.ddos_name
  resource_group_name = data.azurerm_resource_group.example.name
}

#Creating a VNET with DDoS plan enabled
resource "azurerm_virtual_network" "demo" {
  name                = var.vnet_name
  location            = data.azurerm_resource_group.example.location
  resource_group_name = data.azurerm_resource_group.example.name
  address_space       = var.address_space

  ddos_protection_plan {
    id     = data.azurerm_network_ddos_protection_plan.ddosplan.id
    enable = var.enable
  }
}