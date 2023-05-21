#PROVIDER CONFIGURATIONS
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.26.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "b325a432-99f2-46b9-99a4-f74d01446503"
  features {}
}