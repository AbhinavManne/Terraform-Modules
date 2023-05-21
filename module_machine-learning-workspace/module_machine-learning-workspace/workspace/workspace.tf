terraform {
   required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.84.0"
    }
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "rg" {
  name = var.resource_group
}

data "azurerm_application_insights" "ai" {
  name                = var.application_insights_name
  resource_group_name = data.azurerm_resource_group.rg.name
}
data "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
  enforce_private_link_endpoint_network_policies = true
}


data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.rg.name
}


resource "azurerm_machine_learning_workspace" "example" {
  name                    = var.workspace_name
  location                = data.azurerm_resource_group.rg.location
  resource_group_name     = data.azurerm_resource_group.rg.name
  application_insights_id = data.azurerm_application_insights.ai.id
  key_vault_id            = data.azurerm_key_vault.kv.id
  storage_account_id      = data.azurerm_storage_account.example.id
  tags                    = var.tags
  identity {
    type = var.identity_type
  }

}

resource "azurerm_private_endpoint" "example" {
  name                = var.private_endpoint_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  subnet_id           = azurerm_subnet.subnet.id

  private_service_connection {
    name                           = var.private_service_connection_name
    private_connection_resource_id = azurerm_machine_learning_workspace.example.id
    is_manual_connection           = var.is_manual_connection  
    subresource_names              = var.subresource_names
    request_message                = var.request_message  
  }
}