locals {
  resource_group_name = element(coalescelist(data.azurerm_resource_group.rgrp.*.name, azurerm_resource_group.rg.*.name, [""]), 0)
  location            = element(coalescelist(data.azurerm_resource_group.rgrp.*.location, azurerm_resource_group.rg.*.location, [""]), 0)
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

resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_services_vault_name
  location            = local.location
  resource_group_name = local.resource_group_name
  sku                 = var.recovery_services_vault_sku
  tags                = var.tags

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_site_recovery_replication_policy" "policy" {
  name                                                 = var.site_recovery_replication_policy_name
  resource_group_name                                  = local.resource_group_name
  recovery_vault_name                                  = azurerm_recovery_services_vault.vault.name
  recovery_point_retention_in_minutes                  = 24 * 60
  application_consistent_snapshot_frequency_in_minutes = 4 * 60
}



# ----------------------------------------STORAGE ACCOUNT-----------------------------------------------#
resource "azurerm_storage_account" "stor" {
  name                     = var.storage_account_name
  resource_group_name      = local.resource_group_name
  location                 = local.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

#------------------------------------------VIRTUAL NETWORK-----------------------------------------------#

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network
  address_space       = var.address_space
  location            = local.location
  resource_group_name = local.resource_group_name
}

#---------------------------------------------SUBNET----------------------------------------------------#

resource "azurerm_subnet" "snet-ep" {
  count                                          = var.enable_private_endpoint ? 1 : 0
  name                                           = var.subnet_name
  resource_group_name                            = local.resource_group_name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  address_prefixes                               = var.private_subnet_address_prefix
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
}

#-----------------------------------------PRIVATE ENDPOINT------------------------------------------#
resource "azurerm_private_endpoint" "pep1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = var.private_endpoint_name
  location            = local.location
  resource_group_name = local.resource_group_name
  subnet_id           = azurerm_subnet.snet-ep.0.id
  private_service_connection {
    name                           = var.private_service_connection_name
    is_manual_connection           = var.is_manual_connection
    private_connection_resource_id = azurerm_recovery_services_vault.vault.id
    subresource_names              = var.subresource_names
  }
}

data "azurerm_private_endpoint_connection" "private-ip1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = azurerm_private_endpoint.pep1.0.name
  resource_group_name = local.resource_group_name
  depends_on          = [azurerm_recovery_services_vault.vault]
}