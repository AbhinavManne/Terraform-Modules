terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.12.0"
    }
  }

}

provider "azurerm" {
  features {}

  subscription_id = "42447f0e-a0f4-4b06-9b62-4851d188abfc"
}