resource_group_name   = "rg"
create_resource_group = false
location              = "east us"

csv_file_name = "../../modules/module_firewall-NATrules/firewall-natrules/data.csv"
firewall_name = "firewall123"
tags = {
  "Contact_person" : "abc"
  "cost_center" : 999
  "Application Name" : "Firewall"
}
sku_name                                         = "AZFW_VNet"
sku_tier                                         = "Standard"
firewall_policy_id                               = null
dns_servers                                      = null
private_ip_ranges                                = null
threat_intel_mode                                = "Off"
zones                                            = null
ip_configuration_name                            = null //"configuration"
subnet_id_ip_configuration                       = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/test_rg/providers/Microsoft.Network/virtualNetworks/test_vnet/subnets/AzureFirewallSubnet"
public_ip_address_id_ip_configuration            = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/test_rg/providers/Microsoft.Network/publicIPAddresses/test_ip_add"
management_ip_configuration_name                 = null //"manage_configuration"
subnet_id_management_ip_configuration            = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/test_rg/providers/Microsoft.Network/virtualNetworks/test_vnet/subnets/AzureFirewallManagementSubnet"
public_ip_address_id_management_ip_configuration = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/test_rg/providers/Microsoft.Network/publicIPAddresses/test_ip_add_2"
virtual_hub_id                                   = null
public_ip_count                                  = null


################################## Alerts ########################################

storage_account_id       = "/subscriptions/b325a432-99f2-46b9-99a4-f74d01446503/resourceGroups/NetworkWatcherRG/providers/Microsoft.Storage/storageAccounts/diagstoraccount"
action_group_name        = "example-action-groupz10"
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
diag_name                       = "resource-diagnew"
log_analytics_workspace_id      = null
log_analytics_destination_type  = null
eventhub_name                   = null
eventhub_authorization_rule_id  = null
log_enabled                     = true
log_retention_days              = 30
log_retention_policy_enabled    = true
metric_retention_policy_enabled = true
metric_retention_days           = 7
