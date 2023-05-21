#locals
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
}
#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group ? 0 : 1
  name  = var.resource_group
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group)
  location = var.location
}

#------------------------------------------Virtual Network---------------------------------------------------------#
resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network
  resource_group_name = local.resource_group_name
  location            = local.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  tags                = var.tags
  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.example.id
    enable = var.enable_ddos_protection_plan1

  }
}

#-----------------------------------------DDoS Protection---------------------------------------------------------#
resource "azurerm_network_ddos_protection_plan" "example" {
  name                = var.network_ddos_protection_plan
  location            = local.location
  resource_group_name = local.resource_group_name

}

#--------------------------------------------Firewall-------------------------------------------------------------#
#Creating subnet with SQL service endpoint
resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
  service_endpoints    = var.service_endpoints
}

resource "azurerm_public_ip" "example" {
  name                = var.public_ip
  location            = local.location
  resource_group_name = local.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

resource "azurerm_firewall" "example" {
  name                = var.firewall_name
  location            = local.location
  resource_group_name = local.resource_group_name
  threat_intel_mode   = var.threat_intel_mode

  ip_configuration {
    name                 = var.ip_config
    subnet_id            = azurerm_subnet.example.id
    public_ip_address_id = azurerm_public_ip.example.id
  }
}

#--------------------------------------------DATA SOURCE: SQL-----------------------------------------------------#
#Reading existing sql server info
data "azurerm_sql_server" "sqlserver" {
  name                = var.sql_server
  resource_group_name = local.resource_group_name
}

#Creating sql vnet rule for service endpoint
resource "azurerm_sql_virtual_network_rule" "sqlvnetrule" {
  name                = var.sql_vnet_rule
  resource_group_name = local.resource_group_name
  server_name         = data.azurerm_sql_server.sqlserver.name
  subnet_id           = azurerm_subnet.example.id
}