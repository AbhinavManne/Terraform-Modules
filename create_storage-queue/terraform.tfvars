storage_account_name            = "str236"
create_resource_group           = "false"
account_tier                    = "Standard"
access_tier                     = "Hot"
enable_large_file_share         = false
enable_hns                      = true
enable_https_traffic_only       = true
min_tls_version                 = "TLS1_2"
allow_blob_public_access        = true
last_access_time_enabled        = true
change_feed_enabled             = true
blob_soft_delete_retention_days = 7
replication_type                = "LRS"
tags = {
  App_name    = "storage acc"
  Owner       = "nikita"
  Cost_center = 9999
}


resource_group = "rg"
location       = "east us"
#yesidentity_ids = null

enable_versioning                    = true
container_soft_delete_retention_days = 7

# Storage queues
queues = ["queue1", "queue2"]

network_rules = {
  bypass = ["AzureServices"]
  # One or more IP Addresses, or CIDR Blocks to access this Key Vault.
  ip_rules = ["123.201.18.148"]
  # One or more Subnet ID's to access this Key Vault.
  subnet_ids = []
}



encryption_scopes = {
  "encrypt" = {
    enable_infrastructure_encryption = true

  }
}
role_definition_name = ["Reader"]