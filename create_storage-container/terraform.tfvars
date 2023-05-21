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


resource_group = "new-rg2"
location       = "east us"
#yesidentity_ids = null

enable_versioning                    = true
container_soft_delete_retention_days = 7

containers_list = [
  { name = "mystore250", access_type = "private" },

]

encryption_scopes = {
  "encrypt" = {
    enable_infrastructure_encryption = true

  }
}
role_definition_name = ["Reader"]