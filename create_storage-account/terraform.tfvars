create_resource_group = false
resource_group_name   = "storage_rg"
location              = "East US"

length  = 6
special = false
upper   = false

storage_account_name = "str231m"
account_tier         = "Standard"
replication_type     = "LRS"
min_tls_version      = "TLS1_2"
tags = {
  App_name    = "storage_acc"
  Owner       = "abc"
  Cost_center = 9999
}

account_kind                     = "BlobStorage"
cross_tenant_replication_enabled = "true"
access_tier                      = "Hot"
edge_zone                        = null
enable_https_traffic_only        = false
allow_nested_items_to_be_public  = true
shared_access_key_enabled        = true
is_hns_enabled                   = true
nfsv3_enabled                    = true
large_file_share_enabled         = false

custom_domain_name = null
use_subdomain      = null

key_vault_key_id          = null
user_assigned_identity_id = null

managed_identity_type = null

enable_static_website         = false
static_website_index_document = null
static_website_error_doc      = null

enable_share_properties = false

shared_properties_allowed_headers = null
shared_properties_allowed_methods = null
shared_properties_allowed_origins = null
shared_properties_exposed_headers = null
shared_properties_max_age_in_sec  = null

retention_policy_days = null

smb_versions                        = null
smb_authentication_types            = null
smb_kerberos_ticket_encryption_type = null
channel_encryption_type             = null

directory_type = null

storage_sid         = null
domain_name         = null
domain_sid          = null
domain_guid         = null
forest_name         = null
netbios_domain_name = null

enable_routing              = true
publish_internet_endpoints  = false
publish_microsoft_endpoints = true
routing_choice              = "MicrosoftRouting"

enable_blob_properties        = false
enable_versioning             = null
last_access_time_enabled      = null
change_feed_enabled           = null
change_feed_retention_in_days = null
default_service_version       = null

blob_properties_allowed_headers    = null
blob_properties_allowed_methods    = null
blob_properties_allowed_origins    = null
blob_properties_exposed_headers    = null
blob_properties_max_age_in_seconds = null

blob_soft_delete_retention_days = null

container_soft_delete_retention_days = null

queue_properties_allowed_headers    = null
queue_properties_allowed_methods    = null
queue_properties_allowed_origins    = null
queue_properties_exposed_headers    = null
queue_properties_max_age_in_seconds = null

logging_delete                = null
logging_read                  = null
logging_version               = null
logging_write                 = null
logging_retention_policy_days = null

minute_metrics_enabled               = null
minute_metrics_version               = null
minute_metrics_include_apis          = null
minute_metrics_retention_policy_days = null

hour_metrics_enabled               = null
hour_metrics_version               = null
hour_metrics_include_apis          = null
hour_metrics_retention_policy_days = null

network_rule_default_action = "Allow"
ip_rules                    = ["127.0.0.1"]
subnet_id                   = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/storage_rg/providers/Microsoft.Network/virtualNetworks/vnet_storage/subnets/default"
bypass                      = ["Metrics"]

endpoint_resource_id = null
endpoint_tenant_id   = null

encryption_scopes = {
  "encrypt" = {
    enable_infrastructure_encryption = true

    source_encryption = "Microsoft.Storage"

  }
}

enable_advanced_threat_protection = "true"

#############################################################

create_private-endpoint           = true
private_endpoint_name             = "example-endpoint-stor22"
private_service_connection_name   = "example-privateserviceconnection-stor"
subresource_names                 = ["blob"]
is_manual_connection              = true
request_message                   = "PL"
private_dns_zone_group            = null
private_connection_resource_alias = null

############################################################

storage_account_id       = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/new_rg/providers/Microsoft.Storage/storageAccounts/newstoracc9131"
action_group_name        = "example-action-groupz"
short_name               = "actiongz"
action_group_rule_name   = "example-z"
scope_type               = "Resource"
activity_log_alert_name  = "example-activitylogalertz"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert       = "Security"
metric_alert_name        = "example-metricalertz"
metric_namespace         = "Microsoft.Storage/storageAccounts"
metric_name              = "Transactions"
aggregation              = "Total"
operator                 = "GreaterThan"
threshold                = 50
dimension_name           = "ApiName"
dimension_operator       = "Include"
values                   = ["*"]
