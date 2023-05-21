variable "resource_group_name" {
  type        = string
  description = "Resource group name of the virtual network"
}
variable "resource_group_location" {
  type        = string
  description = "Location"
}
variable "virtual_network_name" {
  type        = string
  description = "Name of the virtual network"
}
variable "virtual_network_address_space" {
  type        = list(string)
  description = "address space of the virtual network"
}


variable "public_ip_name" {
  type        = string
  description = "Public IP name in Azure"
}

variable "ip_configuration_name" {
  type        = string
  description = "IP configuration name in Azure"
}



variable "windows_vm_name" {
  type        = string
  description = "Windows VM name in Azure"
}

variable "recovery_vault_name" {
  type        = string
  description = "recovery service keyvault name in Azure"
}

variable "keyvault_name" {
  type        = string
  description = "Keyvault name in Azure"
}

variable "storage_account_name" {
  type        = string
  description = "storage account name in Azure"
}

variable "storage_account_tier" {
  type        = string
  description = "storage account tier in Azure"
}

variable "storage_account_replication_type" {
  type        = string
  description = "storage account replication type in Azure"
}

variable "log_workspace_name" {
  type        = string
  description = "Name of the log analytics workspace"
}
variable "sku" {
  type        = string
  description = "Stock Keeping Unit"
}
variable "retention_in_days" {
  type        = number
  description = "No. of days for retention of the workspace"
}

variable "app_service_plan_name" {
  type        = string
  description = "Name of the app service plan"
}
variable "app_service_plan_sku_tier" {
  type        = string
  description = "Pricing tier of the app service plan"
}
variable "app_service_plan_sku_size" {
  type        = string
  description = "Instance size of the app service plan"
}

variable "app_service_name" {
  type        = string
  description = "Name of the app service"
}

variable "appservice_subnet_address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of theapp service subnet"
}
variable "database_subnet_address_prefixes" {
  type        = list(string)
  description = "List of address prefixes of the db subnet"
}




variable "create_resource_group" {
  description = "Whether to create resource group and use it for all networking resources"
  default     = true
}


variable "log_analytics_workspace_name" {
  description = "The name of log analytics workspace name"
  default     = null
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = ""
}

variable "random_password_length" {
  description = "The desired length of random password created by this module"
  default     = 24
}

variable "enable_sql_server_extended_auditing_policy" {
  description = "Manages Extended Audit policy for SQL servers"
  default     = true
}

variable "enable_database_extended_auditing_policy" {
  description = "Manages Extended Audit policy for SQL database"
  default     = false
}

variable "enable_threat_detection_policy" {
  description = ""
  default     = false
}

variable "sqlserver_name" {
  description = "SQL server Name"
  default     = ""
}

variable "admin_username" {
  description = "The administrator login name for the new SQL Server"
  default     = null
}

variable "admin_password" {
  description = "The password associated with the admin_username user"
  default     = null
}

variable "database_name" {
  description = "The name of the database"
  default     = ""
}

variable "sql_database_edition" {
  description = "The edition of the database to be created"
  default     = "Standard"
}

variable "sqldb_service_objective_name" {
  description = " The service objective name for the database"
  default     = "S1"
}

variable "log_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs"
  default     = "30"
}

variable "threat_detection_audit_logs_retention_days" {
  description = "Specifies the number of days to keep in the Threat Detection audit logs."
  default     = 0
}

variable "enable_vulnerability_assessment" {
  description = "Manages the Vulnerability Assessment for a MS SQL Server"
  default     = false
}

variable "email_addresses_for_alerts" {
  description = "A list of email addresses which alerts should be sent to."
  type        = list(any)
  default     = []
}

variable "disabled_alerts" {
  description = "Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action."
  type        = list(any)
  default     = []
}

variable "ad_admin_login_name" {
  description = "The login name of the principal to set as the server administrator"
  default     = null
}

variable "identity" {
  description = "If you want your SQL Server to have an managed identity. Defaults to false."
  default     = false
}

variable "enable_firewall_rules" {
  description = "Manage an Azure SQL Firewall Rule"
  default     = false
}

variable "enable_failover_group" {
  description = "Create a failover group of databases on a collection of Azure SQL servers"
  default     = false
}

variable "secondary_sql_server_location" {
  description = "Specifies the supported Azure location to create secondary sql server resource"
  default     = "northeurope"
}

variable "enable_private_endpoint" {
  description = "Manages a Private Endpoint to SQL database"
  default     = false
}

variable "private_subnet_address_prefix" {
  description = "The name of the subnet for private endpoints"
  default     = null
}

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = list(object({
    name             = string
    start_ip_address = string
    end_ip_address   = string
  }))
  default = []
}

variable "enable_log_monitoring" {
  description = "Enable audit events to Azure Monitor?"
  default     = false
}

variable "initialize_sql_script_execution" {
  description = "Allow/deny to Create and initialize a Microsoft SQL Server database"
  default     = false
}

variable "sqldb_init_script_file" {
  description = "SQL Script file name to create and initialize the database"
  default     = ""
}

variable "extaudit_diag_logs" {
  description = "Database Monitoring Category details for Azure Diagnostic setting"
  default     = ["SQLSecurityAuditEvents", "SQLInsights", "AutomaticTuning", "QueryStoreRuntimeStatistics", "QueryStoreWaitStatistics", "Errors", "DatabaseWaitStatistics", "Timeouts", "Blocks", "Deadlocks"]
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "client_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "stack" {
  type = string
}

variable "location_short" {
  description = "Short string for Azure location."
  type        = string
}

variable "name_prefix" {
  description = "Optional prefix for the generated name"
  type        = string
  default     = ""
}

variable "server_version" {
  description = "Version of the SQL Server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server). See https://www.terraform.io/docs/providers/azurerm/r/sql_server.html#version"
  type        = string
  default     = "12.0"
}

variable "allowed_cidr_list" {
  description = "Allowed IP addresses to access the server in CIDR format. Default to all Azure services"
  type        = list(string)
  default     = ["0.0.0.0/32"]
}

variable "extra_tags" {
  description = "Extra tags to add"
  type        = map(string)
  default     = {}
}

variable "server_extra_tags" {
  description = "Extra tags to add on SQL Server"
  type        = map(string)
  default     = {}
}

variable "elastic_pool_extra_tags" {
  description = "Extra tags to add on the SQL Elastic Pool"
  type        = map(string)
  default     = {}
}

variable "databases_extra_tags" {
  description = "Extra tags to add on the SQL databases"
  type        = map(string)
  default     = {}
}

variable "server_custom_name" {
  description = "Name of the SQL Server, generated if not set."
  type        = string
  default     = ""
}

variable "elastic_pool_custom_name" {
  description = "Name of the SQL Elastic Pool, generated if not set."
  type        = string
  default     = ""
}

variable "administrator_login" {
  description = "Administrator login for SQL Server"
  type        = string
}

variable "elastic_pool_max_size" {
  description = "Maximum size of the Elastic Pool in gigabytes"
  type        = string
}

variable "zone_redundant" {
  description = "Whether or not the Elastic Pool is zone redundant, SKU tier must be Premium to use it. This is mandatory for high availability."
  type        = bool
  default     = false
}

variable "database_min_dtu_capacity" {
  description = "The minimum capacity all databases are guaranteed in the Elastic Pool. Defaults to 0."
  type        = string
  default     = "0"
}

variable "database_max_dtu_capacity" {
  description = "The maximum capacity any one database can consume in the Elastic Pool. Default to the max Elastic Pool capacity."
  type        = string
  default     = ""
}

variable "databases_names" {
  description = "Names of the databases to create for this server"
  type        = list(string)
}

variable "databases_collation" {
  description = "SQL Collation for the databases"
  type        = string
  default     = "SQL_LATIN1_GENERAL_CP1_CI_AS"
}

variable "enable_logging" {
  description = "Boolean flag to specify whether logging is enabled"
  type        = bool
  default     = true
}

variable "logs_storage_retention" {
  description = "Retention in days for logs on Storage Account"
  type        = number
  default     = 30
}

variable "logs_storage_account_id" {
  description = "Storage Account id for logs"
  type        = string
  default     = null
}

variable "logs_log_analytics_workspace_id" {
  description = "Log Analytics Workspace id for logs"
  type        = string
  default     = null
}

variable "enable_advanced_data_security" {
  description = "Boolean flag to enable Advanced Data Security. The cost of ADS is aligned with Azure Security Center standard tier pricing. See https://docs.microsoft.com/en-us/azure/sql-database/sql-database-advanced-data-security"
  type        = bool
  default     = false
}

variable "enable_advanced_data_security_admin_emails" {
  description = "Boolean flag to define if account administrators should be emailed with Advanced Data Security alerts."
  type        = bool
  default     = false
}

variable "advanced_data_security_additional_emails" {
  description = "List of addiional email addresses for Advanced Data Security alerts."
  type        = list(string)

  # https://github.com/terraform-providers/terraform-provider-azurerm/issues/1974
  default = ["john.doe@azure.com"]
}

variable "create_databases_users" {
  description = "True to create a user named <db>_user per database with generated password and role db_owner."
  type        = bool
  default     = true
}

variable "daily_backup_retention" {
  description = "Retention in days for the databases backup. Value can be 7, 14, 21, 28 or 35."
  type        = number
  default     = 35
}

variable "weekly_backup_retention" {
  description = "Retention in weeks for the weekly databases backup."
  type        = number
  default     = 0
}

variable "monthly_backup_retention" {
  description = "Retention in months for the monthly databases backup."
  type        = number
  default     = 3
}

variable "yearly_backup_retention" {
  description = "Retention in years for the yearly backup."
  type        = number
  default     = 0
}

variable "yearly_backup_time" {
  description = "Week number taken in account for the yearly backup retention."
  type        = number
  default     = 52
}


