locals {
  resource_group_name                = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location                           = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}

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
  name                = "example-asg"
  location            = local.location
  resource_group_name = local.resource_group_name
  tags                = var.tags
  }

# Create Network Security Group and rule
resource "azurerm_network_security_group" "nsg" {
  name                = var.network_security_group
  location            = local.location
  resource_group_name = local.resource_group_name

  security_rule {
    name                   = var.sr_name
    priority               = var.sr_priority
    direction              = var.sr_direction
    access                 = var.sr_access
    protocol               = var.sr_protocol
    source_port_range      = var.sr_source_port_range
    destination_port_range = var.sr_destination_port_range
    destination_address_prefix            = var.sr_destination_address_prefix
    source_application_security_group_ids = [azurerm_application_security_group.asg.id]
  }

  tags = var.tags
}