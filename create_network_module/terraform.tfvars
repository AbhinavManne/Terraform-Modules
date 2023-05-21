create_resource_group = false
resource_group_name   = "rg1"
location              = "East US"



virtual_network = "my_vnet"
address_space   = ["10.0.0.0/16"]
dns_servers     = []

enable_flow_timeout_in_minutes = false
flow_timeout_in_minutes = 15
edge_zone = null
bgp_community = null


tags = {
  Contact_name     = "ABC"
  Cost_Center      = "111"
  Application_name = "Dev"
}


enable_ddos_protection_plan = "false"
id_of_existing_ddos = null

network_ddos_protection_plan = "my_protection_plan"

firewall_subnet_address_prefix = ["10.0.4.0/24"]
firewall_service_endpoints = [
  "Microsoft.AzureActiveDirectory",
  "Microsoft.AzureCosmosDB",
  "Microsoft.EventHub",
  "Microsoft.KeyVault",
  "Microsoft.ServiceBus",
  "Microsoft.Sql",
  "Microsoft.Storage",
]

gateway_subnet_address_prefix = null
gateway_service_endpoints     = ["Microsoft.Storage"]

subnet_names                                          = ["Subnet-1", "Subnet-2", "Subnet-3"]
subnet_prefixes                                       = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
subnet_service_endpoints                              = {}
private_endpoint_network_policies_enabled = true
private_link_service_network_policies_enabled = true
service_endpoint_policy_ids = null
subnet_delegation ={}

map_of_subnet_name_and_nsg_id = null
# map_of_subnet_name_and_nsg_id = {
#   "Subnet-1" = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg1/providers/Microsoft.Network/networkSecurityGroups/nsg01"
#   "Subnet-2" = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg1/providers/Microsoft.Network/networkSecurityGroups/nsg02"
#   "Subnet-3" = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg1/providers/Microsoft.Network/networkSecurityGroups/nsg01"
# }

map_of_subnet_name_and_route_table_id = {
  "Subnet-1" = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg1/providers/Microsoft.Network/routeTables/rt01"
  "Subnet-2" = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg1/providers/Microsoft.Network/routeTables/rt02"
  "Subnet-3" = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg1/providers/Microsoft.Network/routeTables/rt01"
}

public_ip_name    = "my_public_ip"
allocation_method = "Static"
sku               = "Standard"


firewall_name     = "my_firewall"
threat_intel_mode = "Alert"
firewall_sku_name = "AZFW_VNet"
firewall_sku_tier = "Standard"

ip_config = "Configuration"

storage_account_id     = "/subscriptions/2a24fef9-dc44-4a62-a3a6-001ade556497/resourceGroups/rg1/providers/Microsoft.Storage/storageAccounts/dfdfere"
action_group_name      = "example-action-groupz"
short_name             = "actiongz"
action_group_rule_name = "example-z"
scope_type             = "Resource"
activity_log_alert_name  = "example-activitylogalertz"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert     = "Security"
metric_alert_name      = "example-metricalertz"
metric_namespace       = "Microsoft.Storage/storageAccounts"
metric_name            = "Transactions"
aggregation            = "Total"
operator               = "GreaterThan"
threshold              = 50
dimension_name         = "ApiName"
dimension_operator     = "Include"
values                 = ["*"]

enable_log_monitoring          = true
diag_name                      = "kv-diag"
log_analytics_workspace_id     = null
log_analytics_destination_type = null #"Dedicated"
eventhub_name                  = null
eventhub_authorization_rule_id = null
log_enabled                    = true
log_retention_policy_enabled   = true
log_retention_days             = 7
metric_retention_policy_enabled= true
metric_retention_days          = 7