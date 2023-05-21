

#---------------------------------------------------------
# Resource Group Creation or selection - Default is "false"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  
  name  = var.resource_group
}

#---------------------------------------------------------
# Storage Account Creation or selection 
#----------------------------------------------------------
resource "random_string" "unique" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "sa" {
  name                      = substr(format("sta%s%s", lower(replace(var.storage_account_name, "/[[:^alnum:]]/", "")), random_string.unique.result), 0, 24)
  resource_group_name       = data.azurerm_resource_group.rgrp.name
  location                  = data.azurerm_resource_group.rgrp.location
  account_tier              = var.account_tier
  account_replication_type  = var.replication_type
  min_tls_version           = var.min_tls_version
  tags                      = merge({ "ResourceName" = substr(format("sta%s%s", lower(replace(var.storage_account_name, "/[[:^alnum:]]/", "")), random_string.unique.result), 0, 24) }, var.tags, )

    static_website {
    index_document = "index.html"
    }
  blob_properties {
    delete_retention_policy {
      days = var.blob_soft_delete_retention_days
    }
    container_delete_retention_policy {
      days = var.container_soft_delete_retention_days
    }
    versioning_enabled = var.enable_versioning
    last_access_time_enabled = var.last_access_time_enabled
    change_feed_enabled = var.change_feed_enabled
  }

}

#-------------------------------
# Storage Queue Creation
#-------------------------------
resource "azurerm_storage_queue" "queues" {
  count                = length(var.queues)
  name                 = var.queues[count.index]
  storage_account_name = azurerm_storage_account.sa.name
}
#-------------------------------------------------------------------#

resource "azurerm_virtual_network" "example" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name       = data.azurerm_resource_group.rgrp.name
  location                  = data.azurerm_resource_group.rgrp.location
}

resource "azurerm_subnet" "example" {
  name                 = "example-subnet"
  resource_group_name       = data.azurerm_resource_group.rgrp.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]
  enforce_private_link_endpoint_network_policies=true
}

resource "azurerm_storage_account_network_rules" "test" {
  resource_group_name = data.azurerm_resource_group.rgrp.name
  storage_account_name = azurerm_storage_account.sa.name

  default_action             = "Allow"
  ip_rules                   = ["127.0.0.1"]
  virtual_network_subnet_ids = [azurerm_subnet.example.id]
  bypass     = ["AzureServices"]
}
   
resource "azurerm_storage_encryption_scope" "scope" {
  for_each = var.encryption_scopes

  name                               = each.key
  storage_account_id                 = azurerm_storage_account.sa.id
  source                             = "Microsoft.Storage"
  infrastructure_encryption_required = each.value.enable_infrastructure_encryption
}

#--------------------------------------
# Storage Advanced Threat Protection 
#--------------------------------------

resource "azurerm_advanced_threat_protection" "atp" {
  target_resource_id = azurerm_storage_account.sa.id
  enabled            = var.enable_advanced_threat_protection
}

############Private endpoint-----#####################
resource "azurerm_private_endpoint" "example" {
  name                = "example-endpoint"
  resource_group_name       = data.azurerm_resource_group.rgrp.name
  location                  = data.azurerm_resource_group.rgrp.location
  subnet_id                 =  azurerm_subnet.example.id

  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.sa.id
    is_manual_connection           = false
    subresource_names = ["web"]
  }
}
