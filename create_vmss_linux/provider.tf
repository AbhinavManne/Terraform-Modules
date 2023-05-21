terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.20.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.1"
    }
  }

}

provider "azurerm" {
  subscription_id = "2a24fef9-dc44-4a62-a3a6-001ade556497"
  features {}
}
provider "azurerm" {
  subscription_id = "dcd2c118-9f88-4a53-8b1b-fbc235ad0bef"
  # tenant_id = "8836bc45-fd11-4149-891a-9128540cacdd"
  alias = "sandbox"
  features {}
}
provider "tls" {}
