resource_group_name              = "rg2"
resource_group_location          = "east us"
public_ip_name                   = "public_ip"
virtual_network_name             = "Vnet"
virtual_network_address_prefixes = ["10.0.0.0/16"]
subnet_address_prefixes          = ["10.0.1.0/24"]
bastion_name                     = "bastion"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Azure Bastion"
}
storage_account_name             = "azurebastion4561"
storage_account_tier             = "Standard"
storage_account_replication_type = "LRS"