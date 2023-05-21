terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
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

data "azurerm_key_vault" "kv" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_storage_account" "example" {
  name                = var.storage_account_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_machine_learning_workspace" "existing" {
  name                = var.workspace_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = data.azurerm_resource_group.rg.name
}

data "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}


resource "azurerm_machine_learning_compute_instance" "example" {
  name                          = var.compute_instance
  location                      = data.azurerm_resource_group.rg.location
  machine_learning_workspace_id = data.azurerm_machine_learning_workspace.existing.id
  virtual_machine_size          = var.virtual_machine_size
  authorization_type            = var.authorization_type
  ssh {
    public_key = var.ssh_key
  }
  subnet_resource_id = data.azurerm_subnet.subnet.id
}