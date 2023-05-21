
#---------------Resource Group Variables-------------------------------------------#

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"

}

variable "resource_group_id" {
  description="Resource group ID"
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}


#-------------------------------------------------------------------------------------#
#-----------------------MSSQL SERVER variables----------------------------------------#
#-------------------------------------------------------------------------------------#

variable "admin_login" {
  description = "The administrator login name for the new server."
  type        = string
  default     = null
}

variable "admin_password_primary" {
  type = string
  description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy"
}

variable "admin_password_secondary" {
  type = string
  description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy"
}

variable "azuread_administrator" {
  description = "block for azure ad admin"
  type = object({
    login_username              = string
    object_id                   = string
    tenant_id                   = string
    azuread_authentication_only = bool
  })
  default = null
}

variable "sqlserver_name" {
  description = "SQL server Name"
  type        = string
}

variable "sql_server_version" {
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)"
  type        = string
}


variable "outbound_network_restriction_enabled" {
  type        = bool
  description = "Whether outbound network traffic is restricted for this server"
  default     = false
}

variable "connection_policy" {
  type        = string
  description = "The connection policy the server will use"
  default     = null
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for this server "
  default     = false
}

variable "managed_identity_type" {
  description = "The type of Managed Identity . Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`"
  type        = string
}

variable "managed_identity_ids" {
  type        = list(string)
  description = "A list of User Managed Identity ID's ."
  default     = []
}
#----------------Elastic pool variables -----------------------#
variable "create_elasticpool" {
  description = "Created an elastic pool for mssql server "
  default     = false
}

variable "capacity" {
  type        = number
  description = "Capacity in Azure elastic pool configurations"
  default     = 4
}

variable "family" {
  type        = string
  description = "Family type in Azure elastic pool configurations"
  default     = "Gen5"
}

variable "sql_elasticpool" {
  type        = string
  description = "SQL Elasticpool name in Azure"
}


variable "sku" {
  type        = string
  description = "SKU type in Azure elastic pool configurations"
  default     = "GP_Gen5"
}

variable "tier" {
  type        = string
  description = "Tier type in Azure elastic pool configurations"
  default     = "GeneralPurpose"
}


variable "max_capacity" {
  type        = string
  description = "Maximum Capacity in Azure elastic pool configurations"
}


#-----------------------mssql database  varaibles-----------------------------------------
variable "collation" {
  description = "(Optional) The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS. Changing this forces a new resource to be created."
  default     = null
}

variable "create_mode" {
  type        = string
  description = "(Optional) Specifies how to create the database. Must be either Default to create a new database or PointInTimeRestore to restore from a snapshot. Defaults to Default."
  default     = null
}

variable "creation_source_database_id" {
  type        = string
  description = " (Optional) The id of the source database to be referred to create the new database. This should only be used for databases with create_mode values that use another database as reference. Changing this forces a new resource to be created."
  default     = null
}

variable "database_name" {
  description = "The name of the database"
  type        = string
}

variable "disabled_alerts" {
  type        = list(string)
  description = "Specifies a list of alerts which should be disabled"
  default     = []
}

variable "elastic_pool_id" {
  description = "(Optional) The id of the elastic database pool."
  default     = null
}

variable "email_addresses_for_alerts" {
  type        = list(any)
  description = "A list of email addresses which alerts should be sent to"
  default     = []
}

variable "min_tls_version" {
  type = string
  default     = "1.2"
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server."
}


variable "retention_days" {
  description = "The number of days to retain the log"
  type        = number
  default     = 1
}

variable "secondary_sql_server_location" {
  type        = string
  description = "location for secondary server"
  default     = "south india"
}

#---------------------------creation/Enabling variables used -----------------------------#
variable "enable_auditing_policy" {
  description = "Manages Extended Audit policy for SQL database"
  type        = bool
  default     = true
}

variable "enable_failover_group" {
  description = "Create a failover group of databases on a collection of Azure SQL servers"
  default     = false
}

variable "enable_firewall_rules" {
  description = " to enable firewall rule for primary sql server."
  type        = bool
  default     = false
}

variable "enable_threat_detection_policy" {
  type        = bool
  description = "threat detection policy in db"
  default     = false
}

variable "create_alert-policy" {
  description = "To create alert policy "
  default     = false
  type        = bool
}

variable "if_database_name" {
  description = "The name of the database"
  type        = bool
  default     = true
}


#------------Failover group------------------#
variable "failover_group_name" {
  description = "Name for the Storage Account"
  default     = "failovr45"
}

variable "mode" {
  type    = string
  default = "Automatic"
}


variable "grace_minutes" {
  type        = number
  description = "grace minutes "
  default     = 1
}


variable "ledger_enabled" {
  description = "A boolean that specifies if this is a ledger database"
  type        = bool
  default     = false
}

variable "license_type" {
  type        = string
  description = "License type of Azure elastic pool configurations"
  default     = "LicenseIncluded"
}

variable "mode_failover" {
  type        = string
  description = "The failover policy of the read-write endpoint for the failover group."
  default     = "Enabled"
}


variable "log_monitoring_enabled" {
  description = "(optional)log monitoring for auditing policy"
  type        = bool
  default     = null
}



variable "max_size_gb" {
  type        = number
  description = "Maximum size gb of Azure elastic pool configurations"
  default     = 756
}

variable "min_capacity" {
  type        = string
  description = "Minimum Capacity in Azure elastic pool configurations"
  default     = "0.25"
}

variable "min_capacity_db" {
  description = "The minimum capacity all databases are guaranteed."
  default     = null
}






##########---------------------------------------------------------------------
# SQL Database variables
##########-----------------------------------------------------------------------




variable "auto_pause_delay_in_minutes" {
  type        = number
  description = "(Optional) Time in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled. This property is only settable for General Purpose Serverless databases."
  default     = null
}

variable "sql_database_edition" {
  description = " The edition of the database to be created. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web"
  type        = string
  default     = "Standard"
}

variable "restore_point_in_time" {
  type = string
  description = "(Optional) The point in time for the restore. Only applies if create_mode is PointInTimeRestore e.g. 2013-11-08T22:00:40Z"
}

variable "read_replica_count" {
  type = string
  description = "(Optional) The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed. This property is only settable for Hyperscale edition databases."
  default     = null
}

variable "read_scale" {
  type = string
  description = "(Optional) Read-only connections will be redirected to a high-available replica. Please see Use read-only replicas to load-balance read-only query workloads."
  default     = null
}

variable "sample_name" {
  type = string
  description = "(Optional) Specifies the name of the sample schema to apply when creating this database. Possible value is AdventureWorksLT."
  default     = null
}

variable "sku_name" {
  type = string
  description = "(Optional) Specifies the name of the sku used by the database. Only changing this from tier Hyperscale to another tier will force a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."
  default     = null
}



variable "zone_redundant" {
  type = string
  description = " (Optional) Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases."
  default     = null
}



variable "short_retentiondays" {
  type        = number
  description = "Point in Time Restore Configuration.  Values has to be between 7 and 35"

}

variable "long_term_retention_policy" {
  description = "block for long term retention policy"
  type = object({

    ltr_weekly_retention  = string
    ltr_monthly_retention = string
    ltr_yearly_retention  = string
    week_of_year          = string
  })
  default = {
    ltr_monthly_retention = "P1M"
    ltr_weekly_retention  = "P1W"
    ltr_yearly_retention  = "P1Y"
    week_of_year          = "52"
  }
}
variable "backup_interval_in_hours" {
  type        = number
  description = "the hours between each differential backup. This is only applicable to live databases but not dropped databases. Value has to be 12 or 24"
  default     = 12
}


variable "threat_policy_email_account_admins" {
  description = "the alert is sent to the account administrators or not."
  type        = string
  default     = null
}
variable "state" {
  type        = string
  description = "Specifies the state of the policy, whether it is enabled or disabled "
}



variable "storage_account_type" {
  description = "Specifies the storage account type used to store backups for this database."
  type        = string
  default     = "Geo"
}

variable "recover_database_id" {
  description = "The ID of the database to be recovered."
  type        = string
  default     = null
}

variable "restore_dropped_database_id" {
  description = "The ID of the database to be restored"
  type        = string
  default     = null
}

variable "geo_backup_enabled" {
  description = "A boolean that specifies if the Geo Backup Policy is enabled."
  type        = bool
  default     = false
}


#-------------------mssql db auditing policy variables---------------------#

variable "mssql_db_auditing_enabled" {
  description = "(optional)"
  type        = bool
  default     = false
}


variable "retention_in_days" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "sa_primary_access_key" {
  description = "(optional)primary access key for storage blob"
  type        = string
  default     = null
}

variable "storage_account_access_key_is_secondary" {
  description = "(optional) secondary acces key for storage blob"
  type        = bool
  default     = null
}

variable "sa_primary_blob_endpoint" {
  description = "(optional) storage endpoint for storage blob"
  type        = string
  default     = null
}

variable "primary_blob_endpoint" {
  type        = string
  description = "primary blob endpoint for storage account"
  default     = ""
}

variable "primary_access_key" {
  type        = string
  description = " primary access key for storage account "
  default     = ""
}
#-----------------------------Variables for firewall ----------------------------------------------------

variable "end_ip_address" {
  type        = string
  description = "The ending IP address to allow through the firewall for this rule."
}
variable "firewall_rule1" {
  description = "Range of IP addresses to allow firewall connections."
  type        = string

}

variable "firewall_rule2" {
  description = "Range of IP addresses to allow firewall connections."
  type        = string
}

variable "start_ip_address" {
  type        = string
  description = "start ip of firewall"
}

variable "email_account_admins" {
  type        = bool
  description = "email account admins in case of failure"
  default     = false
}

#--------------------------------------------Tags-------------------------------------------------------#

variable "tags" {
  description = "Tag Name "
  type        = map(any)
}

