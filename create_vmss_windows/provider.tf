terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.26.0"
    }
  }

}

provider "azurerm" {
  subscription_id = "2a24fef9-dc44-4a62-a3a6-001ade556497"
  features {}
}