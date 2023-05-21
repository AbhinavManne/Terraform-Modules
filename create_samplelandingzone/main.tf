locals {
  subnetNames           = ["app_subnet", "Database_Subnet"]
  networkInterfaceNames = ["app_subnet-example-nic", "Database_Subnet-example-nic"]
}

#Reference to resource group creation module
module "module_create_resource_group" {
  source              = "../../modules/module_resource-group-creation"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
}

#Reference to virtual network creation module
module "module_create_virtual_network" {
  source = "../../modules/module_virtual-network-creation"
  depends_on = [
    module.module_create_resource_group
  ]
  resource_group_name           = var.resource_group_name
  virtual_network_name          = var.virtual_network_name
  virtual_network_address_space = var.virtual_network_address_space
}

/*
#Reference to subnet creation module
module "module_create_subnet" {
  
  source = "../../modules/module_subnet-creation"
  depends_on = [
    module.module_create_virtual_network
  ]
  resource_group_name     = var.resource_group_name
  virtual_network_name    = var.virtual_network_name
  subnet_name             = local.subnetNames[1]
  subnet_address_prefixes = var.database_subnet_address_prefixes
}
*/

#Reference to network interface creation module
module "networkinterface_module" {
  // count = length(local.subnetNames) 
  source = "../../modules/module_networkinterface"
  depends_on = [
    module.app_service_subnetconnection_module, module.sqlserver_subnetconnection_module
  ]
  rg_name               = var.resource_group_name
  vnet_name             = var.virtual_network_name
  subnet_name           = local.subnetNames[1]
  networkinterface_name = local.networkInterfaceNames[1]
  ip_configuration_name = "${var.ip_configuration_name}-${local.subnetNames[1]}"
}

#Reference to virtual machine creation module
module "windows_vm_creation_module" {
  source = "../../modules/module_windows-vm"
  depends_on = [
    module.networkinterface_module
  ]
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  /* network_interface_appserver_name = local.networkInterfaceNames[0] */
  network_interface_database_name = local.networkInterfaceNames[1]
  windows_vm_name                 = var.windows_vm_name
}

#Reference to recovery services vault creation module
#recovery vault name should be unique
module "recoveryservicesvault_module" {
  source = "../../modules/module_recoveryservicesvault"
  depends_on = [
    module.module_create_resource_group
  ]
  rg_name             = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name

}

#Reference to keyvault creation module
module "keyvault_module" {
  source = "../../modules/module_keyvault"
  depends_on = [
    module.module_create_resource_group
  ]
  rg_name       = var.resource_group_name
  keyvault_name = var.keyvault_name
}

#Reference to storage account creation module
#storage acc name should be unique
module "storageaccount_module" {
  source = "../../modules/module_storage-account"
  depends_on = [
    module.module_create_resource_group
  ]
  rg_name                          = var.resource_group_name
  storage_account_name             = var.storage_account_name
  storage_account_tier             = var.storage_account_tier
  storage_account_replication_type = var.storage_account_replication_type
}

#Reference to log analytics workspace creation module
module "module_create_log_analytics_workspace" {
  source = "../../modules/module_log-analytics-workspace-creation"
  depends_on = [
    module.module_create_resource_group
  ]
  resource_group_name = var.resource_group_name
  log_workspace_name  = var.log_workspace_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
}

#Reference to the app service plan creation module
module "module_create_app_service_plan" {
  source = "../../modules/module_app-service-plan-creation"
  depends_on = [
    module.module_create_resource_group
  ]
  resource_group_name       = var.resource_group_name
  app_service_plan_name     = var.app_service_plan_name
  app_service_plan_sku_tier = var.app_service_plan_sku_tier
  app_service_plan_sku_size = var.app_service_plan_sku_size
}

#Reference to the module for creating an app service
module "app_service_creation_module" {
  source = "../../modules/module_app-service-creation"
  depends_on = [
    module.module_create_app_service_plan
  ]
  resource_group_name   = var.resource_group_name
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
}

#Reference to the module for creating an app service subnet connection
module "app_service_subnetconnection_module" {
  source = "../../modules/module_app_service_subnet_connection"
  depends_on = [
    module.app_service_creation_module
  ]
  resource_group_name                = var.resource_group_name
  vnet_name                          = var.virtual_network_name
  subnet_name                        = local.subnetNames[0]
  appservice_subnet_address_prefixes = var.appservice_subnet_address_prefixes
  app_service_plan_name              = var.app_service_plan_name
  app_service_name                   = var.app_service_name
}

#Reference to the module for creating an sql server subnet connection
module "sqlserver_subnetconnection_module" {
  source = "../../modules/module_sqlserver_subnet_connection"
  depends_on = [
    module.mssql-server, module.module_create_resource_group
  ]
  resource_group_name              = var.resource_group_name
  vnet_name                        = var.virtual_network_name
  subnet_name                      = local.subnetNames[1]
  database_subnet_address_prefixes = var.database_subnet_address_prefixes
  sqlserver_name                   = var.sqlserver_name
}

module "mssql-server" {
  source = "../../modules/module_singledb_azuresql"
  depends_on = [
    module.module_create_resource_group, module.storageaccount_module, module.module_create_log_analytics_workspace
  ]

  # By default, this module will not create a resource group
  # proivde a name to use an existing resource group, specify the existing resource group name,
  # and set the argument to `create_resource_group = false`. Location will be same as existing RG.
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
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
  enable_vulnerability_assessment = var.enable_vulnerability_assessment
  email_addresses_for_alerts      = ["user@example.com", "firstname.lastname@example.com"]

  # Sql failover group creation. required secondary locaiton input. 
  enable_failover_group         = true
  secondary_sql_server_location = "northeurope"

  # enabling the Private Endpoints for Sql servers
  enable_private_endpoint = true

  # (Optional) To enable Azure Monitoring for Azure SQL database including audit logs
  # log analytic workspace name required
  enable_log_monitoring        = true
  log_analytics_workspace_name = "loganalytics-we-sharedtest2"

  # Firewall Rules to allow azure and external clients and specific Ip address/ranges. 
  enable_firewall_rules = true
  firewall_rules = [
    {
      name             = "access-to-azure"
      start_ip_address = "0.0.0.0"
      end_ip_address   = "0.0.0.0"
    },
    {
      name             = "desktop-ip"
      start_ip_address = "49.204.225.134"
      end_ip_address   = "49.204.225.134"
    }
  ]

  # Create and initialize a database with custom SQL script
  # need sqlcmd utility to run this command 
  # your desktop public IP must be added to firewall rules to run this command 
  initialize_sql_script_execution = true
  sqldb_init_script_file          = "../artifacts/db-init-sample.sql"

  # Tags for Azure Resources
  tags = {
    Terraform   = "true"
    Environment = "dev"
    Owner       = "test-user"
  }
}

module "sql" {
  source = "../../modules/module_elasticpool_azuresql"
  depends_on = [
    module.module_create_resource_group, module.mssql-server
  ]
  client_name         = var.client_name
  environment         = var.environment
  location            = var.location
  location_short      = var.location_short
  resource_group_name = var.resource_group_name
  stack               = var.stack
  sqlserver_name      = var.sqlserver_name

  databases_names = ["users", "documents"]

  administrator_login = var.administrator_login
  #administrator_password = var.administrator_password

  sku = {
    tier     = "Standard"
    capacity = "100"
  }

  elastic_pool_max_size = "50"

  # This can costs you money https://docs.microsoft.com/en-us/azure/sql-database/sql-database-advanced-data-security
  enable_advanced_data_security = true

  enable_logging = true

  #logs_storage_account_id = data.terraform_remote_state.run.logs_storage_account_id
  #logs_log_analytics_workspace_id = data.terraform_remote_state.run.log_analytics_id
}