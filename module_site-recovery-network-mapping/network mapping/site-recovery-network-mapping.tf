resource "azurerm_resource_group" "primary" {
  name     = var.resource_group_name1
  location = var.resource_group_location1
}

resource "azurerm_resource_group" "secondary" {
  name     = var.resource_group_name2
  location = var.resource_group_location2
}

resource "azurerm_recovery_services_vault" "vault" {
  name                = var.recovery_services_vault_name
  location            = azurerm_resource_group.secondary.location
  resource_group_name = azurerm_resource_group.secondary.name
  sku                 = var.recovery_services_vault_sku
  tags                = var.tags

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_site_recovery_fabric" "primary" {
  name                = var.site_recovery_fabric_name1
  resource_group_name = azurerm_resource_group.secondary.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  location            = azurerm_resource_group.primary.location
}

resource "azurerm_site_recovery_fabric" "secondary" {
  name                = var.site_recovery_fabric_name2
  resource_group_name = azurerm_resource_group.secondary.name
  recovery_vault_name = azurerm_recovery_services_vault.vault.name
  location            = azurerm_resource_group.secondary.location
}

resource "azurerm_virtual_network" "primary" {
  name                = var.virtual_network_name1
  resource_group_name = azurerm_resource_group.primary.name
  address_space       = var.virtual_network_address_space1
  location            = azurerm_resource_group.primary.location
}

resource "azurerm_virtual_network" "secondary" {
  name                = var.virtual_network_name2
  resource_group_name = azurerm_resource_group.secondary.name
  address_space       = var.virtual_network_address_space2
  location            = azurerm_resource_group.secondary.location
}

resource "azurerm_site_recovery_network_mapping" "recovery-mapping" {
  name                        = var.recovery_network_mapping_name
  resource_group_name         = azurerm_resource_group.secondary.name
  recovery_vault_name         = azurerm_recovery_services_vault.vault.name
  source_recovery_fabric_name = azurerm_site_recovery_fabric.primary.name
  target_recovery_fabric_name = azurerm_site_recovery_fabric.secondary.name
  source_network_id           = azurerm_virtual_network.primary.id
  target_network_id           = azurerm_virtual_network.secondary.id
}
# ----------------------------------------STORAGE ACCOUNT-----------------------------------------------#
resource "azurerm_storage_account" "stor" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.secondary.name
  location                 = azurerm_resource_group.secondary.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
}

#------------------------------------------VIRTUAL NETWORK-----------------------------------------------#

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network
  address_space       = var.address_space
  location            = azurerm_resource_group.secondary.location
  resource_group_name = azurerm_resource_group.secondary.name
}

#---------------------------------------------SUBNET----------------------------------------------------#

resource "azurerm_subnet" "snet-ep" {
  count                                          = var.enable_private_endpoint ? 1 : 0
  name                                           = var.subnet_name
  resource_group_name                            = azurerm_resource_group.secondary.name
  virtual_network_name                           = azurerm_virtual_network.vnet.name
  address_prefixes                               = var.private_subnet_address_prefix
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies
}

#-----------------------------------------PRIVATE ENDPOINT------------------------------------------#
resource "azurerm_private_endpoint" "pep1" {
  count               = var.enable_private_endpoint ? 1 : 0
  name                = var.private_endpoint_name
  location            = azurerm_resource_group.secondary.location
  resource_group_name = azurerm_resource_group.secondary.name
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
  resource_group_name = azurerm_resource_group.secondary.name
  depends_on          = [azurerm_recovery_services_vault.vault]
}