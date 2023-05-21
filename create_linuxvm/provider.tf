terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.19.1"
    }
    tls = {
      source = "hashicorp/tls"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "tls" {
  # Configuration options
}