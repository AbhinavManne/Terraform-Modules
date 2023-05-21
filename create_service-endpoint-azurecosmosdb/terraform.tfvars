#----DEFAULT VALUES: RESOURCE: RESOURCE GROUP----#
resource_group        = "rg-002"
create_resource_group = true
location              = "East US"

#----DEFAULT VALUES: RESOURCE: VIRTUAL NETWORK----#
virtual_network              = "my_vnet"
address_space                = ["10.0.0.0/16"]
dns_servers                  = []
enable_ddos_protection_plan1 = "true"
tags = {
  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Azure_SERVICES"
}

#----DEFAULT VALUES: RESOURCE: DDOS----#
network_ddos_protection_plan = "my_protection_plan"

#----DEFAULT VALUES: RESOURCE: SUBNET----#
subnet_name             = "AzureFirewallSubnet"
subnet_address_prefixes = ["10.0.1.0/24"]
service_endpoints       = ["Microsoft.AzureCosmosDB"]

#----DEFAULT VALUES: RESOURCE: PUBLIC IP----#
public_ip         = "my_public_ip"
allocation_method = "Static"
sku               = "Standard"

#----DEFAULT VALUES: RESOURCE: FIREWALL----#
firewall_name     = "my_firewall"
threat_intel_mode = "Alert"
ip_config         = "Configuration"

#----DEFAULT VALUES: RESOURCE: COSMOS DB ACCOUNT----#
cosmosdb_account_name                = "cosmos-db-test-account01924"
offer_type                           = "Standard"
kind                                 = "GlobalDocumentDB"
enable_automatic_failover            = true
is_virtual_network_filter_enabled    = true
consistency_level                    = "BoundedStaleness"
max_interval_in_seconds              = 10
max_staleness_prefix                 = 200
geo_location_failover_priority       = 0
ignore_missing_vnet_service_endpoint = true