locals {
  resource_group_name                = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location                           = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "false"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group == false ? 1 : 0
  name  = var.resource_group_name
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}
##########################  DDoS Protection #####################################

resource "azurerm_network_ddos_protection_plan" "example" {
  name                = var.network_ddos_protection_plan
  location            = local.location
  resource_group_name = local.resource_group_name

}

#------------------------vnet-------------------------------------------------
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = local.resource_group_name
  location            = local.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers

  tags = var.tags
  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.example.id
    enable = var.enable_ddos_protection_plan1

  }
}
resource "azurerm_public_ip" "example" {
  name                = var.public_ip_name
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

#---------------Firewall creation-------------------------#
resource "azurerm_firewall" "example" {
  name                = var.firewall_name
  location            = local.location
  resource_group_name = local.resource_group_name
  threat_intel_mode   = var.threat_intel_mode

  ip_configuration {
    name                 = var.ip_config
    subnet_id            = azurerm_subnet.firewallsubnet.id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

#------------------Creating subnet-------------------#
resource "azurerm_subnet" "firewallsubnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}
#-------------Creating a gateway subnet---------------------------------
resource "azurerm_subnet" "gatewaysubnet" {
  name                 = "GatewaySubnet"  #[10.0.1.0/24]
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
}

