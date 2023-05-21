locals {
  spokeSubnetNames      = ["Application_Subnet", "Database_Subnet"]
  networkInterfaceNames = ["app_subnet-example-nic", "Database_Subnet-example-nic"]
  vmNames               = ["AppServerVM", "DBServerVM"]
  osDiskNames           = ["osDisk1", "osDisk2"]
}

#Reference to recovery services vault creation module
#recovery vault name should be unique
module "recoveryservicesvault_module" {
  source = "../../modules/module_recoveryservicesvault"
  depends_on = [
    module.module_create_spoke_resource_group
  ]
  rg_name             = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name
}

#Reference to keyvault creation module
module "keyvault_module" {
  source = "../../modules/module_keyvault"
  depends_on = [
    module.module_create_spoke_resource_group
  ]
  rg_name       = var.resource_group_name
  keyvault_name = var.keyvault_name
}

#Reference to log analytics workspace creation module
module "module_create_log_analytics_workspace" {
  source = "../../modules/module_log-analytics-workspace-creation"
  depends_on = [
    module.module_create_spoke_resource_group
  ]
  resource_group_name = var.resource_group_name
  log_workspace_name  = var.log_workspace_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
}

#Reference to virtual machine creation module
module "windows_vm_creation_module" {
  count  = length(local.vmNames)
  source = "../../modules/module_windows-vm"
  depends_on = [
    module.networkinterface_module
  ]
  resource_group_name    = var.resource_group_name
  virtual_network_name   = var.spoke_virtual_network_name
  network_interface_name = local.networkInterfaceNames[count.index]
  windows_vm_name        = local.vmNames[count.index]
  os_disk_name           = local.osDiskNames[count.index]
}

#Reference to network interface creation module
module "networkinterface_module" {
  count  = length(local.spokeSubnetNames)
  source = "../../modules/module_networkinterface"
  depends_on = [
    module.sqlserver_subnetconnection_module, module.module_create_subnet
  ]
  rg_name                = var.resource_group_name
  vnet_name              = var.spoke_virtual_network_name
  subnet_name            = local.spokeSubnetNames[count.index]
  network_interface_name = local.networkInterfaceNames[count.index]
  ip_configuration_name  = "${var.ip_configuration_name}-${local.spokeSubnetNames[count.index]}"
}

#Reference to the module for creating an sql server subnet connection
module "sqlserver_subnetconnection_module" {
  source = "../../modules/module_sqlserver_subnet_connection"
  depends_on = [
    module.mssql-server
  ]
  resource_group_name              = var.resource_group_name
  vnet_name                        = var.spoke_virtual_network_name
  subnet_name                      = local.spokeSubnetNames[1]
  database_subnet_address_prefixes = var.database_subnet_address_prefixes
  sqlserver_name                   = var.sqlserver_name
}

module "mssql-server" {
  source = "../../modules/module_singledb_azuresql"
  depends_on = [
    module.storageaccount_module
  ]
  resource_group_name = var.resource_group_name
  # SQL Server and Database details
  # The valid service objective name for the database include S0, S1, S2, S3, P1, P2, P4, P6, P11 
  sqlserver_name               = var.sqlserver_name
  database_name                = var.database_name
  sql_database_edition         = var.sql_database_edition
  sqldb_service_objective_name = var.sqldb_service_objective_name
  storage_account_name         = var.storage_account_name

  # SQL server extended auditing policy defaults to `true`. 
  # To turn off set enable_sql_server_extended_auditing_policy to `false`  
  # DB extended auditing policy defaults to `false`. 
  # to tun on set the variable `enable_database_extended_auditing_policy` to `true` 
  # To enable Azure Defender for database set `enable_threat_detection_policy` to true 
  enable_threat_detection_policy = var.enable_threat_detection_policy
  log_retention_days             = var.log_retention_days

  # schedule scan notifications to the subscription administrators
  # Manage Vulnerability Assessment set `enable_vulnerability_assessment` to `true`
  email_addresses_for_alerts = var.email_addresses_for_alerts

  # Sql failover group creation. required secondary locaiton input. 
  enable_failover_group         = false
  secondary_sql_server_location = "northeurope"

  # # Tags for Azure Resources
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "test-user"
  }
}

#Reference to storage account creation module
#storage acc name should be unique
module "storageaccount_module" {
  source = "../../modules/module_storage-account"
  depends_on = [
    module.module_create_spoke_resource_group
  ]
  rg_name                          = var.resource_group_name
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
}

#Reference to vnet peering module
module "vnet_peering_module" {
  source = "../../modules/module_vnet-peering"
  depends_on = [
    module.module_create_spoke_virtual_network, module.module_create_hub_virtual_network, module.virtualnetworkgateway_module
  ]
  resource_group_name    = var.resource_group_name
  vnet_name_1            = var.hub_virtual_network_name
  vnet_name_2            = var.spoke_virtual_network_name
  vnet_peering_1to2_name = var.hubtospoke_vnet_peering_name
  vnet_peering_2to1_name = var.spoketohub_vnet_peering_name
}

# Reference to subnet creation module
module "module_create_subnet" {
  source = "../../modules/module_subnet-creation"
  depends_on = [
    module.module_create_spoke_virtual_network
  ]
  resource_group_name     = var.resource_group_name
  virtual_network_name    = var.spoke_virtual_network_name
  subnet_name             = local.spokeSubnetNames[0]
  subnet_address_prefixes = var.appservice_subnet_address_prefixes
}

#Reference to virtual network creation module
module "module_create_spoke_virtual_network" {
  source = "../../modules/module_virtual-network-creation"
  depends_on = [
    module.module_create_spoke_resource_group
  ]
  resource_group_name           = var.resource_group_name
  virtual_network_name          = var.spoke_virtual_network_name
  virtual_network_address_space = var.spoke_virtual_network_address_space
}

#Reference to resource group creation module
module "module_create_spoke_resource_group" {
  source              = "../../modules/module_resource-group-creation"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}