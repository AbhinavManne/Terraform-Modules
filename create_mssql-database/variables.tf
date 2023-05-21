# variable "key_vault_secret"{
#   type = map(object({
#   keyvault_secret        = string
#   keyvault_id            = string
#   keyvault_secret_value  = string
#   secret_content_type    = string
#   secret_not_before_date = string
#   secret_expiration_date = string
#     tags                = map(string)
#   }))
# }

variable "grace_minutes" {
  type        = number
  description = "grace minutes "
}


variable "retention_days" {
  description = "The number of days to retain the log"
  type        = number
}

variable "secondary_sql_server_location" {
  type        = string
  description = "location for secondary server"
}


###########################################################################
# SQL Server variables
##############################################################################

variable "sqlserver_name" {
  description = "SQL server Name"
  type        = string
}

variable "sql_server_version" {
  description = "The version for the new server. Valid values are: 2.0 (for v11 server) and 12.0 (for v12 server)"
  type        = string
}

variable "admin_login" {
  description = "The administrator login name for the new server."
  type        = string
}

# variable "admin_password_primary" {
#   description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy"
#   type        = string
# }

# variable "admin_password_secondary" {
#   description = "The password associated with the administrator_login user. Needs to comply with Azure's Password Policy"
#   type        = string
# }

variable "managed_identity_type" {
  description = "The type of Managed Identity which should be assigned to the Linux Virtual Machine. Possible values are `SystemAssigned`, `UserAssigned` and `SystemAssigned, UserAssigned`"
  type        = string
  default     = null
}

variable "managed_identity_ids" {
  type        = list(string)
  description = "A list of User Managed Identity ID's which should be assigned to the Linux Virtual Machine."
  default     = ["/subscriptions/2f92ce92-48a7-4953-a361-dfb1767eeffa/resourceGroups/rg-docker/providers/Microsoft.ManagedIdentity/userAssignedIdentities/user-nik123"]
}



variable "azuread_administrator" {
  type = object({
    login_username              = string
    object_id                   = string
    tenant_id                   = string
    azuread_authentication_only = bool
  })
  default = null
}

variable "outbound_network_restriction_enabled" {
  type        = bool
  description = "Whether outbound network traffic is restricted for this server"
  default     = false
}


##########---------------------------------------------------------------------
# SQL Database variables
##########-----------------------------------------------------------------------

variable "if_database_name" {
  description = "The name of the database"
  type        = bool
  default     = true

}

variable "database_name" {
  description = "The name of the database"

}
variable "failover_group_name" {
  description = "Name for the Storage Account"
}

variable "sql_database_edition" {
  description = " The edition of the database to be created. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web"
  type        = string

}

variable "email_addresses_for_alerts" {

  description = "A list of email addresses which alerts should be sent to"

}

variable "auto_pause_delay_in_minutes" {
  description = "(Optional) Time in minutes after which database is automatically paused. A value of -1 means that automatic pause is disabled. This property is only settable for General Purpose Serverless databases."
  default     = null
}

variable "create_mode" {
  description = "(Optional) Specifies how to create the database. Must be either Default to create a new database or PointInTimeRestore to restore from a snapshot. Defaults to Default."
  default     = null
}

variable "creation_source_database_id" {
  description = " (Optional) The id of the source database to be referred to create the new database. This should only be used for databases with create_mode values that use another database as reference. Changing this forces a new resource to be created."
  default     = null
}

variable "collation" {
  description = "(Optional) The name of the collation. Applies only if create_mode is Default. Azure default is SQL_LATIN1_GENERAL_CP1_CI_AS. Changing this forces a new resource to be created."
  default     = null
}

variable "elastic_pool_id" {
  description = "(Optional) The id of the elastic database pool."
  default     = null
}



variable "restore_point_in_time" {
  description = "(Optional) The point in time for the restore. Only applies if create_mode is PointInTimeRestore e.g. 2013-11-08T22:00:40Z"
  default     = null
}

variable "read_replica_count" {
  description = "(Optional) The number of readonly secondary replicas associated with the database to which readonly application intent connections may be routed. This property is only settable for Hyperscale edition databases."
  default     = null
}

variable "read_scale" {
  description = "(Optional) Read-only connections will be redirected to a high-available replica. Please see Use read-only replicas to load-balance read-only query workloads."
  default     = null
}

variable "sample_name" {
  description = "(Optional) Specifies the name of the sample schema to apply when creating this database. Possible value is AdventureWorksLT."
  default     = null
}

variable "sku_name" {
  description = "(Optional) Specifies the name of the sku used by the database. Only changing this from tier Hyperscale to another tier will force a new resource to be created. For example, GP_S_Gen5_2,HS_Gen4_1,BC_Gen5_2, ElasticPool, Basic,S0, P2 ,DW100c, DS100."
  default     = null
}



variable "zone_redundant" {
  description = " (Optional) Whether or not this database is zone redundant, which means the replicas of this database will be spread across multiple availability zones. This property is only settable for Premium and Business Critical databases."
  default     = null
}



variable "short_retentiondays" {
  description = "Point in Time Restore Configuration.  Values has to be between 7 and 35"
  default     = 7
}

variable "long_term_retention_policy" {
  type = object({

    ltr_weekly_retention  = string
    ltr_monthly_retention = string
    ltr_yearly_retention  = string
    week_of_year          = string
  })
  default = {
    ltr_monthly_retention = "P1M"
    week_of_year          = "52"
    ltr_weekly_retention  = "P1W"
    ltr_yearly_retention  = "P1Y"
  }
}

variable "disabled_alerts" {
  default = []
}

variable "threat_policy_email_account_admins" {
  description = "the alert is sent to the account administrators or not."
  type        = string
  default     = null
}
variable "min_capacity_db" {
  default = null
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

variable "ledger_enabled" {
  description = "A boolean that specifies if this is a ledger database"
  type        = bool
  default     = false
}
#-------------------mssql db auditin policy variables---------------------#

variable "mssql_db_auditing_enabled" {
  description = "(optional)"
  type        = bool
  default     = true
}


variable "log_monitoring_enabled" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "retention_in_days" {
  description = "(optional)"
  type        = number
  default     = null
}

variable "sa_primary_access_key" {
  description = "(optional)"
  type        = string
  default     = null
}

variable "storage_account_access_key_is_secondary" {
  description = "(optional)"
  type        = bool
  default     = null
}

variable "sa_primary_blob_endpoint" {
  description = "(optional)"
  type        = string
  default     = null
}

#-----------------------------Variables for firewall ----------------------------------------------------

variable "enable_firewall_rules" {
  description = "to enable firewall rule for primary sql server"
  type        = bool
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
  type = string
}

variable "end_ip_address" {
  type = string
}

variable "email_account_admins" {
  type        = bool
  description = "email account admins in case of failure"
  default     = false
}

variable "mode" {
  type    = string
  default = "Automatic"
}

#-----------------Local Variables ----------------------------------------------



variable "enable_failover_group" {
  description = "Create a failover group of databases on a collection of Azure SQL servers"
  #default     = false
}


variable "enable_auditing_policy" {
  description = "Manages Extended Audit policy for SQL database"
  type        = bool
  #default     = false
}

variable "enable_threat_detection_policy" {
  description = ""
  #default     = false
}

#-----------------------------------------------------------------------



variable "min_tls_version" {
  #default     = "1.2"
  description = "The Minimum TLS Version for all SQL Database and SQL Data Warehouse databases associated with the server."
}

variable "mode_failover" {
  description = "The failover policy of the read-write endpoint for the failover group."
  #default     = "Enabled"
}

variable "state" {
  description = ""
  #default     = "Enabled"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether public network access is allowed for this serve"
  #default     = false
}

#---------------------------------------------------------------------------------------------------#


variable "tags" {
  description = "Tag Name"
  type        = map(any)
}



#-----------------------elastic pool variables-------------------------
variable "create_elasticpool" {
  description = "Created an elastic pool for mssql server"
  # default = false
}
variable "sql_elasticpool" {
  type        = string
  description = "SQL Elasticpool name in Azure"
}



variable "license_type" {
  type        = string
  description = "License type of Azure elastic pool configurations"
}

variable "max_size_gb" {
  type        = string
  description = "Maximum size gb of Azure elastic pool configurations"
}

variable "sku" {
  type        = string
  description = "SKU type in Azure elastic pool configurations"
}

variable "tier" {
  type        = string
  description = "Tier type in Azure elastic pool configurations"
}

variable "family" {
  type        = string
  description = "Family type in Azure elastic pool configurations"
}

variable "capacity" {
  type        = string
  description = "Capacity in Azure elastic pool configurations"
}

variable "min_capacity" {
  type        = string
  description = "Minimum Capacity in Azure elastic pool configurations"
  default     = "0.25"
}

variable "max_capacity" {
  type        = string
  description = "Maximum Capacity in Azure elastic pool configurations"
}

variable "connection_policy" {
  type        = string
  description = "The connection policy the server will use"
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

##-----------keyvault secret -----------------------##
variable "key_vault_secret_name_primary" {
  type=string
  description = "key vault secret name"
}

variable "key_vault_secret_name_secondary" {
  type=string
  description = "key vault secret name"
}

variable "key_vault_id" {
  type= string
  description ="ID of keyvault"
}

#########------------------  Resource Group varaiables-----------------------

variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
}

variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"

}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

#---------------------------------Private Endpoint variables------------------------------#
variable "create_private-endpoint" {
  type        = bool
  description = "Wants to create private endpoint or not"
  default     = false
}
variable "private_endpoint_name" {
  type        = string
  description = "pvt endpoint name in Azure"
}

variable "private_service_connection_name" {
  type        = string
  description = "service connection name in Azure"
}

variable "subnet_id" {
  type        = string
  description = "Subnet id"
}

variable "subresource_names" {
  type        = list(string)
  description = "sub resources names in Azure"
}

variable "is_manual_connection" {
  type        = string
  description = "Status of manual connection "
}

variable "request_message" {
  type        = string
  description = "request msg"
}
variable "private_dns_zone_group" {

  type = object({
    name                 = string
    private_dns_zone_ids = list(string)
  })
  default = null
}

variable "private_connection_resource_alias" {
  type        = string
  description = "alias name"
}

variable "private_connection_resource_id" {
  description = "ID of resource to be associated"
  default = null
}

variable "storage_account_id" {
  description = "ID of target resource"
  default     = null
}