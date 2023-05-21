terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.46.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "d9eb170f-fa4b-49e2-916a-446a6c074b1a"
  features {}
}