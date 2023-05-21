create_resource_group = false
resource_group_name   = "rg"
location              = "east us"

tags = {
  Contact_Person = "Nikita"
  Cost_center    = "09099"
  App_Name       = "synapse"
}

synapse_name                    = "basefgllinesyp123"
adminlogin                      = "testadminuser"

managed_virtual_network_enabled = true
sql_identity_control_enabled    = true
managed_resource_group_name     = "eres21"
synapsesql                      = "synapsesqlpool"






synapse_sql_pool = {
  sqlpool34 = {
} }
synapse_spark_pool = {
  testpool = {

    node_size_family = "MemoryOptimized"
    node_size        = "Small"
    # node_count = 3

    auto_scale = [{
      max_node_count = 5
      min_node_count = 3
    }]

    auto_pause = [{
      delay_in_minutes = 5
    }]
  }
}
data_exfiltration_protection_enabled = true



##----key vault secret values-----

key_vault_secret_name = "password"
key_vault_id = "/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourceGroups/rg/providers/Microsoft.KeyVault/vaults/keyvauln34"



# azure_devops_repo = {
#   "az1" = {
#     account_name    = "WEbapp-pipeline"
#       branch_name     = "master"
#       project_name    = "webapp-pip"
#       repository_name = "testnet"
#       root_folder     = "/"
#   } 
# }
azure_devops_repo = null

# aad_admin = {
#   "aad1" = {
#       login     = "aad123"
#       object_id = "73535856-1cba-4d91-b13a-55eb142071d6"
#       tenant_id = "5b973f99-77df-4beb-b27d-aa0c70b8482c"
#   }
# }

aad_admin = null

firewall_rules = {

  AllowAllWindowsAzureIps = {

    start_ip_address = "0.0.0.0"

    end_ip_address = "0.0.0.0"

  },

  AllowAll = {

    start_ip_address = "0.0.0.0"

    end_ip_address = "255.255.255.255"

  }

}

managed_identity_type = "SystemAssigned"

filesystem_name = "cont123"

storage_account_id = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Storage/storageAccounts/storsnap"

################################ Private Endpoint #############################

create_private-endpoint           = true
private_endpoint_name             = "example-endpoint-stor22"
private_service_connection_name   = "example-privateserviceconnection-stor"
subresource_names                 = ["Sql"] // for synapse
is_manual_connection              = false
request_message                   = null
private_dns_zone_group            = null
private_connection_resource_alias = null
subnet_id                         = "/subscriptions/60d38622-38ad-40a0-984a-3f7ac52dd133/resourceGroups/rg/providers/Microsoft.Network/virtualNetworks/vnet1/subnets/default"

################################## Alerts ########################################


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
log_retention_days              = 7
