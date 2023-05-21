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
resource "azurerm_application_security_group" "asg" {
  name                = var.application_security_group
  location            = local.location
  resource_group_name = local.resource_group_name
  tags                = var.tags
  }

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.address_space
  location            = local.location
  resource_group_name = local.resource_group_name
}

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes 
}

resource "azurerm_network_interface" "nic" {
  name                = var.network_interface
  location            = local.location
  resource_group_name = local.resource_group_name
  tags                = var.tags
  ip_configuration {
    name                          = var.ip_configuration
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = var.private_ip_address_allocation 
  }
}

#Creating Network Interface and Application Security Group Association
resource "azurerm_network_interface_application_security_group_association" "example" {
  network_interface_id          = azurerm_network_interface.nic.id
  application_security_group_id = azurerm_application_security_group.asg.id
}