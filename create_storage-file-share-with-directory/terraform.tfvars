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

storage_share_directory_name = [
  { name = "example" }
]
storage_share_file_name = [
  { name = "my-awesome-content" }
]
storage_share_file_source = [
  { source = "hello.txt" }
]


resource_group                       = "rg"
location                             = "east us"
enable_versioning                    = true
container_soft_delete_retention_days = 7

# SMB file share with quota (GB) to create
file_shares = [
  { name = "smbfileshare1", quota = 50 },
  { name = "smbfileshare2", quota = 50 }
]

encryption_scopes = {
  "encrypt" = {
    enable_infrastructure_encryption = true

  }
}
role_definition_name = ["Reader"]