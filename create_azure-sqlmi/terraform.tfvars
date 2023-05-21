resource_group_name   = "rg"
location              = "East US"
create_resource_group = false
secondary_location    = "EAST US 2"



#-----------------------------------------------------


administrator_login          = "mradministrator"
license_type                 = "BasePrice"
sku_name                     = "GP_Gen5"
vcores                       = 4
storage_size_in_gb           = 32
public_data_endpoint_enabled = true
collation                    = "SQL_Latin1_General_CP1_CI_AS"
minimum_tls_version          = 1.1
proxy_override               = "Proxy"
dns_zone_partner_id          = null //"/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Sql/managedInstances/sql123mi"
timezone_id                  = "UTC"

storage_account_type           = "LRS"
identity_type                  = "SystemAssigned"
subnet_id                      = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/default"
maintenance_configuration_name = "SQL_Default"

database_name = {
  "db1" = {
    name = "databas123"
  }
}
key_vault_secret_name = "password"
key_vault_id          = "/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourceGroups/rg/providers/Microsoft.KeyVault/vaults/keyvauln34"

create_aad = false

//for vulnerability assessment
storage_container_path     = "https://stor1f5bn.blob.core.windows.net/$logs"
storage_account_access_key = "MrnIYUKElf4YsPJ1qI54ephFq4QBeQUJaDxNJ+Uj27kBgJXdMgGe/hFOwLjfP2lH5suutbSC9d+Q+AStcU9qwQ=="
storage_container_sas_key  = null


login_username = null
object_id      = null
tenant_id      = null

mode          = "Automatic"
grace_minutes = 60
primary_sqlmi = "sql123mi"


failover_group_name = {
  "failover101" = {
    readonly_endpoint_failover_policy_enabled = false
  }
}

create_managed_db = true

secondary_sqlmi = {
  "sqlmigh456" = {
    administrator_login = "mradministrator"
    // for storing the password we can use keyvault secret by passing the id of key vault secret here.
    administrator_login_password   = "thisIsDog11"
    license_type                   = "BasePrice"
    sku_name                       = "GP_Gen5"
    vcores                         = 4
    storage_size_in_gb             = 32
    public_data_endpoint_enabled   = true
    dns_zone_partner_id            = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Sql/managedInstances/sqlmigh456"
    collation                      = "SQL_Latin1_General_CP1_CI_AS"
    minimum_tls_version            = 1.1
    proxy_override                 = "Proxy"
    timezone_id                    = "UTC"
    storage_account_type           = "LRS"
    identity_type                  = "SystemAssigned"
    subnet_id                      = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet9/subnets/default"
    maintenance_configuration_name = "SQL_Default"
  }
}
// OR
//secondary_sqlmi = null


#----------------Alerts --------------------------------------#
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

#------------------Diagnostic settings---------------------------#
enable_log_monitoring           = true
diag_name                       = "resource-diag"
target_resource_id              = null
log_analytics_workspace_id      = null
log_analytics_destination_type  = null #"Dedicated"
storage_account_id              = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Storage/storageAccounts/stor1f5bn"
eventhub_name                   = null
eventhub_authorization_rule_id  = null
log_enabled                     = true
log_retention_policy_enabled    = true
log_retention_days              = 7
metric_retention_policy_enabled = true
metric_retention_days           = 7
