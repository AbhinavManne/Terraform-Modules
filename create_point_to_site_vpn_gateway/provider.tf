terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.27.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "bd294e0d-a549-4b26-9787-5daa46f7dc35"
  # Configuration options
  features {
    
  }
}