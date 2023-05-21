
# -------------------Resource group name---------------------------
resource_group_name   = "rg"
create_resource_group = false
location              = "east us"
#-----------------------------------
# tags for resources
tags = {
  Contact_name     = "abc"
  cost_centre      = "89898"
  application_name = "sql server"

}


#--------------------------------------
enable_auditing_policy         = true
enable_threat_detection_policy = true
retention_days                 = 90

email_account_admins = false

enable_failover_group = false
mode                  = "Automatic"



#---------------------------
# SQL Server
#---------------------------
sqlserver_name     = "baseline-09122"
sql_server_version = "12.0"
admin_login        = "admin12345"

connection_policy  = "Default"


#-------------------------
# Database
#-------------------------
database_name              = "db122"
failover_group_name        = "sqldb-failover-group"
sql_database_edition       = "Standard"
email_addresses_for_alerts = ["db-security@acme.org"]
firewall_rule1             = "firewall1"
firewall_rule2             = "firewall2"
start_ip_address           = "10.0.17.62"
end_ip_address             = "10.0.17.62"
enable_firewall_rules      = false



state           = "Enabled"
min_tls_version = 1.2
mode_failover   = "Enabled"

public_network_access_enabled = false
#---------------------------------------------------
secondary_sql_server_location = "East US"

grace_minutes = 60

#----------------------------key vault secret --------------------------#

key_vault_id = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.KeyVault/vaults/keyvault123gh"
key_vault_secret_name_primary = "passwordprimary"
key_vault_secret_name_secondary = "passwordsecondary"


#-------------------Private Endpoint----------------------------
private_endpoint_name           = "example-endpoint-stor22"
private_service_connection_name = "example-privateserviceconnection-stor"
subresource_names               = ["sqlServer"]
is_manual_connection            = true
request_message                 = "PL"


private_dns_zone_group            = null
private_connection_resource_alias = null





# #--------------------Logging and monitoring-----------------------------#
# enable_log_monitoring           = true
# diag_name                       = "resource-diag"
# log_analytics_workspace_id      = null
# log_analytics_destination_type  = null #"Dedicated"
# eventhub_name                   = null
# eventhub_authorization_rule_id  = null
# extaudit_diag_logs              = ["SQLSecurityAuditEvents", "SQLInsights", "AutomaticTuning", "QueryStoreRuntimeStatistics", "Errors", "DatabaseWaitStatistics", "Timeouts", "Blocks", "Deadlocks"]
# log_enabled                     = true
# log_retention_policy_enabled    = true
# log_retention_days              = 7
# metrics_category                = "AllMetrics"
# metric_retention_policy_enabled = true
# metric_retention_days           = 7



create_private-endpoint = false
#-------elastic pool----------------#
sql_elasticpool    = "mypool"
create_elasticpool = false

license_type = "LicenseIncluded"
max_size_gb  = 756

#Compute and storage configurations
sku          = "GP_Gen5"
tier         = "GeneralPurpose"
family       = "Gen5"
capacity     = 4
min_capacity = 0.25
max_capacity = 4


#--IDs of subnet and storage account taken as  as input by the end user-------------#
subnet_id             = "/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourceGroups/rg-docker/providers/Microsoft.Network/virtualNetworks/rg-docker-vnet/subnets/default"
storage_account_id    = "/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourceGroups/rg-docker/providers/Microsoft.Storage/storageAccounts/storniki00"
primary_access_key    = "+zbVx26ZeSa+BRddqNFFGEdsrf2cesXIQHi6n8OFtNeilt+jO1ndVujU9NnQCBNcYhQZU7FWSyLQ+AStJCN5Lw=="
primary_blob_endpoint = "https://storniki00.blob.core.windows.net/"







# #------------------alert ---------------#
# action_group_name        = "action-groupz"
# short_name               = "actiongz"
# action_group_rule_name   = "example-z"
# scope_type               = "Resource"
# activity_log_alert_name  = "example-activitylogalertz"
# operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
# category_log_alert       = "Security"
# metric_alert_name        = "example-metricalertz"
# metric_namespace         = "Microsoft.Storage/storageAccounts"
# metric_name              = "Transactions"
# aggregation              = "Total"
# operator                 = "GreaterThan"
# threshold                = 50
# dimension_name           = "ApiName"
# dimension_operator       = "Include"
# values                   = ["*"]


