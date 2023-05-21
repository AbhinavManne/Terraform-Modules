create_resource_group   = true
resource_group          = "example-resources"
location                = "east us"
virtual_network_name    = "hpc_vnet"
address_space           = ["10.0.0.0/16"]
subnet_name             = "hpc_subnet"
address_prefixes        = ["10.0.1.0/24"]
hpc_cache_name          = "demo_hpc_cache_name"
cache_size_in_gb        = 3072
sku_name                = "Standard_2G"
policy1                 = "policy1"
scope                   = "default"
access                  = "rw"
storage_account_name    = "abcstoracc39412"
account_tier            = "Standard"
account_replication_type= "GRS"
tags = {
  "Contact_person"   : "Mohit Patil"
  "cost_center"      : 999
  "Application Name" : "HPC_Cache"
}