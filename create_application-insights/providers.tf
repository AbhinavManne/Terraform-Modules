terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.98"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}