terraform {
  required_providers {
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.5.4"
    }
    azurerm = {
      version = "2.98.0"
    }
  }
}



provider "azurerm" {
  subscription_id = "0c16f01a-03cc-41b1-9bc5-7281511a6279"
  features {}
}

provider "databricks" {
  #azure_workspace_resource_id = data.azurerm_databricks_workspace.example.id
}