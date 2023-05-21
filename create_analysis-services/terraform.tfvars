resource_group_name   = "demo_rg_mohit"
create_resource_group = false
location              = "east us"

server_name               = "demoserver978"
sku                       = "S0"
admin_users               = ["abc@xyz.com"]  # <--- dummy email id # Please Use valid Admin User ids.
querypool_connection_mode = "All"
backup_blob_container_uri = null
enable_power_bi_service   = true

firewall_rules = [{
  name        = "rule1"
  range_end   = "210.117.252.255"
  range_start = "210.117.252.0"
  },
  {
    name        = "rule2"
    range_end   = "193.117.252.255"
    range_start = "193.117.252.0"
}]

tags = {
  "Contact_person" : "abc"
  "cost_center" : 999
  "Application Name" : "Analysis Services"
}

################################## Alerts ########################################

storage_account_id       = "/subscriptions/33875161-8f7d-43d4-86b9-ab0b607cb103/resourceGroups/demo_rg_mohit/providers/Microsoft.Storage/storageAccounts/storageacc7890"
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
log_retention_days              = 30
log_retention_policy_enabled    = true
metric_retention_policy_enabled = true
metric_retention_days           = 7
