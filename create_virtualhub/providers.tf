terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.30.0"
    }
  }
}

provider "azurerm" {
   subscription_id = "dcd2c118-9f88-4a53-8b1b-fbc235ad0bef"
   features {
     
   }
}