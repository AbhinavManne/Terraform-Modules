################################ Resource Group ###############################

create_resource_group = false
resource_group_name   = "storage_rg"
location              = "east us"

#################### Postgresql server and related resources ####################

postgresqlserver_name             = "postgresqldbserver0909"
admin_username                    = "sqladmin"
admin_password                    = "Password@n123"
sku_name                          = "GP_Gen5_16"
storage_mb                        = 5120
postgresql_version                = "11"
auto_grow_enabled                 = true
backup_retention_days             = 7
geo_redundant_backup_enabled      = false
infrastructure_encryption_enabled = false
public_network_access_enabled     = true
ssl_enforcement_enabled           = true
ssl_minimal_tls_version_enforced  = "TLS1_2"
create_mode                       = "Default"
tags = {
  Appname        = "sqldc"
  Contact_person = "abc"
  Cost_Center    = "999"
}

managed_identity_type = "SystemAssigned"

enable_threat_detection_policy = true
disabled_alerts = ["Sql_Injection", "Sql_Injection_Vulnerability", "Access_Anomaly",
"Data_Exfiltration", "Unsafe_Action"]
email_addresses_for_alerts = ["user@example.com", "firstname.lastname@example.com"]
log_retention_days         = 30
storage_account_access_key = "6hfMHJklB0wg/Q38YyI0Uv+6TTr5AMAli5O0VpGPwk7FfoXxhpJ2P02oVFdQ18RLq9QYoIQsa2/O+ASt5Uz4Gg=="
storage_endpoint           = "https://stastr231mtxleor.blob.core.windows.net/"

charset   = "utf8"
collation = "English_United States.1252"

postgresql_configuration = {
  backslash_quote = "on"
}

firewall_rules = {
  access-to-azure = {
    start_ip_address = "0.0.0.0"
    end_ip_address   = "0.0.0.0"
  },
  desktop-ip = {
    start_ip_address = "49.204.228.223"
    end_ip_address   = "49.204.228.223"
  }
}

ad_admin_login_name = "firstname.lastname@example.com"

key_vault_key_id = "https://testvault89.vault.azure.net/keys/testkey/ed2ecd90d69d4c7fb389ad39fdf7d544"

subnet_id = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/storage_rg/providers/Microsoft.Network/virtualNetworks/vnet_storage/subnets/default"

################################ Private Endpoint #############################

create_private-endpoint           = true
private_endpoint_name             = "example-endpoint-stor22"
private_service_connection_name   = "example-privateserviceconnection-stor"
subresource_names                 = ["postgresqlServer"]
is_manual_connection              = false
request_message                   = null
private_dns_zone_group            = null
private_connection_resource_alias = null

################################## Alerts ########################################

storage_account_id       = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/storage_rg/providers/Microsoft.Storage/storageAccounts/stastr231mtxleor"
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

################################### diag setting ###################################

enable_log_monitoring           = true
diag_name                       = "resource-diag"
log_analytics_workspace_id      = null
log_analytics_destination_type  = null
eventhub_name                   = null
eventhub_authorization_rule_id  = null
log_enabled                     = true
log_retention_policy_enabled    = true
metric_retention_policy_enabled = true
metric_retention_days           = 7
