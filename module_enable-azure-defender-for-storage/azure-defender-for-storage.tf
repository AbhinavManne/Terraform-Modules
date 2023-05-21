locals {
  template_file_name = "azure-defender.json"
}

#Reading existing resource group info
data "azurerm_resource_group" "rgrp" {
  name = var.resource_group
}

#----------------------------------------------------------
# Storage Account Creation or selection 
#----------------------------------------------------------
resource "random_string" "unique" {
  length  = var.length         
  special = var.special        
  upper   = var.upper           
}
#-------------------------------------------------Storage account---------------------------------------------------#
resource "azurerm_storage_account" "example" {
  name                     = substr(format("sta%s%s", lower(replace(var.storage_account_name, "/[[:^alnum:]]/", "")), random_string.unique.result), 0, 24)
  resource_group_name      = data.azurerm_resource_group.rgrp.name
  location                 = data.azurerm_resource_group.rgrp.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  min_tls_version          = var.min_tls_version
  tags                     = merge({ "ResourceName" = substr(format("sta%s%s", lower(replace(var.storage_account_name, "/[[:^alnum:]]/", "")), random_string.unique.result), 0, 24) }, var.tags, )
  
}

#-------------------------------------------------Virtual Network---------------------------------------------------#
resource "azurerm_virtual_network" "example" {
  name                = var.vnet_name          
  address_space       = var.address_space      
  resource_group_name = data.azurerm_resource_group.rgrp.name
  location            = data.azurerm_resource_group.rgrp.location
}

#---------------------------------------------------- Subnet -------------------------------------------------------#
resource "azurerm_subnet" "example" {
  name                                           = var.subnet_name       
  resource_group_name                            = data.azurerm_resource_group.rgrp.name
  virtual_network_name                           = azurerm_virtual_network.example.name
  address_prefixes                               = var.address_prefixes  
  service_endpoints                              = var.service_endpoints 
  enforce_private_link_endpoint_network_policies = var.enforce_private_link_endpoint_network_policies 
}
resource "azurerm_storage_account_network_rules" "test" {
  resource_group_name  = data.azurerm_resource_group.rgrp.name
  storage_account_name = azurerm_storage_account.example.name

  default_action             = var.default_action             
  ip_rules                   = var.ip_rules                   
  virtual_network_subnet_ids = [azurerm_subnet.example.id]
  bypass                     = var.bypass                      
}

#----------------------------------------------- storage encryption scope -------------------------------------------------
resource "azurerm_storage_encryption_scope" "scope" {
  for_each = var.encryption_scopes

  name                               = each.key
  storage_account_id                 = azurerm_storage_account.example.id
  source                             = var.source_var             
  infrastructure_encryption_required = each.value.enable_infrastructure_encryption
}

#-----------------------------------------------------private endpoint----------------------------------------------------
resource "azurerm_private_endpoint" "example" {
  name                = var.private_endpoint_name              
  resource_group_name = data.azurerm_resource_group.rgrp.name
  location            = data.azurerm_resource_group.rgrp.location
  subnet_id           = azurerm_subnet.example.id

  private_service_connection {
    name                           = var.private_service_connection_name    
    private_connection_resource_id = azurerm_storage_account.example.id
    is_manual_connection           = var.manual_connection                 
    subresource_names              = var.subresource_name                  
  }
}

#-----------------------------------------------------Template deployment----------------------------------------------------
#Enabling Azure Defender for Storage
resource "azurerm_template_deployment" "example" {
  name                = var.template_deployment_name
  resource_group_name = data.azurerm_resource_group.rgrp.name
  deployment_mode     = var.deployment_mode   
  template_body       = file("${path.module}/${local.template_file_name}")
  parameters_body = jsonencode({
    "storageAccountName" = {
      value = azurerm_storage_account.example.name
    }
    "location" = {
      value = data.azurerm_resource_group.rgrp.location
    }
    "storageAccountKind" = {
      value = azurerm_storage_account.example.account_kind
    }
    "storageAccountReplication" = {
      value = "Premium_${azurerm_storage_account.example.account_replication_type}"
    }
    "advancedThreatProtectionEnabled" = {
      value = true
    }
  })
}