#-----------------------------------Resource Group--------------------------------------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}
#---------------------------------Postgre SQL Server--------------------------------------------------
variable "postgresqlserver_name" {
  description = "MySQL server Name"
}

variable "admin_username" {
  description = "The administrator login name for the new SQL Server"
}

variable "admin_password" {
  type        = string
  description = "The password associated with the admin_username user"
}

variable "sku_name" {
  description = "sku name"
}

variable "storage_mb" {
  description = "stoarge for mysql"
}

variable "postgresql_version" {
  description = "version of mysql"
}

variable "auto_grow_enabled" {
  description = "Enable/Disable auto-growing of the storage"
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
}

variable "geo_redundant_backup_enabled" {
  description = "Turn Geo-redundant server backups on/off"
}

variable "infrastructure_encryption_enabled" {
  description = "Whether or not infrastructure is encrypted for this server"
}

variable "public_network_access_enabled" {
  description = "Whether or not public network access is allowed for this server"
}

variable "ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections"
}

variable "ssl_minimal_tls_version_enforced" {
  description = "The minimum TLS version to support on the sever."
}

variable "create_mode" {
  description = "The creation mode. Can be used to restore or replicate existing servers. Possible values are `Default`, `Replica`, `GeoRestore`, and `PointInTimeRestore`. Defaults to `Default`"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}
###################################### Identity

variable "managed_identity_type" {
  description = "type of identity"
  type        = string
  default     = null
}

##################################### Threat protection policy

variable "enable_threat_detection_policy" {
  description = "Threat detection policy configuration, known in the API as Server Security Alerts Policy"
}

variable "disabled_alerts" {
  description = "Specifies an array of alerts that are disabled. Allowed values are: Sql_Injection, Sql_Injection_Vulnerability, Access_Anomaly, Data_Exfiltration, Unsafe_Action."
  type        = list(any)
}

variable "email_addresses_for_alerts" {
  description = "A list of email addresses which alerts should be sent to."
  type        = list(any)

}

variable "log_retention_days" {

}

variable "storage_account_access_key" {
  description = "access key of the storage account"
  type        = string
  default     = null
}
variable "storage_endpoint" {
  description = "storage endpoint"
  type        = string
  default     = null
}

#-------------------------------------- Postgre sql Database ---------------------------------------

variable "charset" {
  description = "Specifies the Charset for the Database, which needs to be a valid Charset"
}

variable "collation" {
  description = "Specifies the Collation for the Database, which needs to be a valid Collation. "
}

#--------------------------------------  Postgresql Configuration ---------------------------

variable "postgresql_configuration" {
  description = "Sets a MySQL Configuration value on a MySQL Server"
  type        = map(string)
}

#-------------------------------------- Postgresql Firewall rule ---------------------------

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
}

#-------------------------------- postgresql active directory administrator ----------------------------------------

variable "ad_admin_login_name" {
  description = "The login name of the principal to set as the server administrator"
}

#-------------------------------- postgresql server key -----------------------

variable "key_vault_key_id" {
  description = "The URL to a Key Vault Key"
  type        = string
}

#-----------------------postgresql_virtual_network_rule -------------------------

variable "subnet_id" {
  description = "subnet ID"
  type        = string
}
