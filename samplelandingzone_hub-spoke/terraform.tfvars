#hub resources
resource_group_name               = "SampleLandingZone-RG-001"
resource_group_location           = "West Europe"
hub_virtual_network_name          = "hub-vnet-001"
hub_virtual_network_address_space = ["10.0.0.0/22"]
gateway_subnet_address_prefixes   = ["10.0.1.0/27"]
firewall_subnet_address_prefixes  = ["10.0.0.0/26"]
public_ip_sku                     = "Standard"
public_ip_allocation_method       = "Static"
virtualnetworkgateway_name        = "hub-vpn-gateway1"
firewall_name                     = "hub-vpn-Firewall-001"

#spoke resources
spoke_virtual_network_name          = "spoke-vnet-001"
spoke_virtual_network_address_space = ["10.1.0.0/22"]
appservice_subnet_address_prefixes  = ["10.1.0.0/27"]
database_subnet_address_prefixes    = ["10.1.1.0/27"]
recovery_vault_name                 = "rudhsrecoveryvault"
keyvault_name                       = "rudhskeyvault001a"
storage_account_name                = "anistoracc1"
storage_account_tier                = "Standard"
storage_account_replication_type    = "GRS"
log_workspace_name                  = "log-ws-001"
sku                                 = "PerGB2018"
retention_in_days                   = 30
app_service_plan_name               = "asp-236824612899"
app_service_plan_sku_tier           = "Standard"
app_service_plan_sku_size           = "S1"
app_service_name                    = "webappservice001"

#sql server db
sqlserver_name                 = "sqldbserver01b"
database_name                  = "demomssqldb"
sql_database_edition           = "Standard"
sqldb_service_objective_name   = "S1"
enable_threat_detection_policy = "false"
log_retention_days             = 30
email_addresses_for_alerts     = ["user@example.com", "firstname.lastname@example.com"]
tags = {
  tag1 = "value1"
}

ip_configuration_name = "internalspokeIP"

#vnet peering
hubtospoke_vnet_peering_name = "hubtospokepeering"
spoketohub_vnet_peering_name = "spoketohubpeering"