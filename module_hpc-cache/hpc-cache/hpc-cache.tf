#--------------------------------------------------------Resource Group---------------------------------------------------------
locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)

}
#---------------------------------------------------------
# Resource Group Creation or selection - Default is "true"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  count = var.create_resource_group ? 0 : 1   #Keep the bool value false to use data source else to use resource block use "true"
  name  = var.resource_group
}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = lower(var.resource_group)
  location = var.location
}
#--------------------------------------------------------Virtual Network---------------------------------------------------------

resource "azurerm_virtual_network" "example" {
  name                = var.virtual_network_name
  address_space       = var.address_space
  location            = local.location
  resource_group_name = local.resource_group_name
}

#-------------------------------------------------------------Subnet---------------------------------------------------------

resource "azurerm_subnet" "example" {
  name                 = var.subnet_name
  resource_group_name  = local.resource_group_name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = var.address_prefixes
}

#--------------------------------------------------------HPC Cache---------------------------------------------------------

resource "azurerm_hpc_cache" "example" {
  name                = var.hpc_cache_name
  resource_group_name = local.resource_group_name
  location            = local.location
  cache_size_in_gb    = var.cache_size_in_gb
  subnet_id           = azurerm_subnet.example.id
  sku_name            = var.sku_name
  tags                = var.tags
}

resource "azurerm_hpc_cache_access_policy" "example" {
  name         = var.policy1
  hpc_cache_id = azurerm_hpc_cache.example.id

  access_rule {
    scope  = var.scope
    access = var.access
  }
}

#--------------------------------------------------Storage Account----------------------------------------------------------------
resource "azurerm_storage_account" "example" {
  name                     = var.storage_account_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}