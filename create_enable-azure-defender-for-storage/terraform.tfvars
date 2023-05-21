create_resource_group     = "false"
resource_group            = "rg"
location                  = "east us"
storage_account_name      = "str239006"
account_tier              = "Premium"
access_tier               = "Hot"
enable_large_file_share   = false
enable_hns                = true
enable_https_traffic_only = true
min_tls_version           = "TLS1_2"
allow_blob_public_access  = true
replication_type          = "LRS"
tags = {
  App_name    = "storage acc"
  Owner       = "Mohit"
  Cost_center = 9999
}

encryption_scopes = {
  "encrypt" = {
    enable_infrastructure_encryption = true

  }
}
role_definition_name                           = ["Reader"]
length                                         = 6
special                                        = false
upper                                          = false
vnet_name                                      = "new_vnet"
address_space                                  = ["10.0.0.0/16"]
subnet_name                                    = "new_subnet"
address_prefixes                               = ["10.0.2.0/24"]
service_endpoints                              = ["Microsoft.Storage"]
enforce_private_link_endpoint_network_policies = true
default_action                                 = "Allow"
ip_rules                                       = ["127.0.0.1"]
bypass                                         = ["AzureServices"]
source_var                                     = "Microsoft.Storage"
private_endpoint_name                          = "new-endpoint"
private_service_connection_name                = "private-service-connection"
manual_connection                              = false
subresource_name                               = ["web"]
deployment_mode                                = "Incremental"
template_deployment_name                       = "example-template"
