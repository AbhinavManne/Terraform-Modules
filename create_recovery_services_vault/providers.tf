terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.20.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "b325a432-99f2-46b9-99a4-f74d01446503"
  features {}
}