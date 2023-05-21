terraform {
  required_providers {
    databricks = {
      source = "databrickslabs/databricks"
      version = "0.2.5"
    }
    azurerm = {
      version = "3.29.1"
    }
  }
}



provider "azurerm" {
  subscription_id = "0c16f01a-03cc-41b1-9bc5-7281511a6279"
    features {}
}

provider "databricks" {
  #azure_workspace_resource_id = azurerm_databricks_workspace.workspace.id
}