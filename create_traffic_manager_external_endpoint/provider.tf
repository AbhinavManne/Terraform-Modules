terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.27.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "60d38622-38ad-40a0-984a-3f7ac52dd133"
  features {}
}