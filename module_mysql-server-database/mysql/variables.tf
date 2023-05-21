
variable "resource_group_name" {
  type        = string
  description = "A container that holds related resources for an Azure solution"
}

variable "location" {
  type        = string
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "admin_username" {
  type        = string
  description = "The Administrator login for the MySQL Server. Required when create_mode is Default"
  default     = null
}

variable "admin_password" {
  type        = string
  description = "The password associated with the admin_username user"
  default     = null
}

variable "auto_grow_enabled" {
  type        = bool
  description = "Enable/Disable auto-growing of the storage"
  default     = true
}

variable "ad_admin_login_name" {
  description = "The login name of the principal to set as the server administrator"
}

variable "backup_retention_days" {
  type        = number
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  default     = null
}


variable "create_mode" {
  type        = string
  description = "The creation mode. Can be used to restore or replicate existing servers. Possible values are `Default`, `Replica`, `GeoRestore`, and `PointInTimeRestore`. Defaults to `Default`"
  default     = "Default"
}

variable "creation_source_server_id" {
  type        = string
  description = "For creation modes other than Default, the source server ID to use."
  default     = null
}

variable "firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))
}

variable "geo_redundant_backup_enabled" {
  type        = bool
  description = "Turn Geo-redundant server backups on/off"
  default     = false
}

variable "infrastructure_encryption_enabled" {
  type        = bool
  description = "Whether or not infrastructure is encrypted for this server"
  default     = false
}


variable "identity" {
  type        = string
  description = "Specifies the type of Managed Service Identity that should be configured on this MySQL Server. The only possible value is SystemAssigned."
  default     = "SystemAssigned"
}

variable "mysqlserver_name" {
  type        = string
  description = "MySQL server Name"
}

variable "mysql_version" {
  type        = string
  description = "version of mysql"
}

variable "mysql_database" {
  type        = map(any)
  description = "MYSQL database "
  default     = null
}

variable "mysql_configuration" {
  description = "Sets a MySQL Configuration value on a MySQL Server"
  type        = map(string)
  default     = null
}

variable "object_id" {
  type        = string
  description = "The ID of the principal to set as the server administrator. For a managed identity this should be the Client ID of the identity."
  default     = null
}

variable "tenant_id" {
  type        = string
  description = "The Azure Tenant ID"
  default     = null
}

variable "key_vault_key_id" {
  type        = string
  description = "The URL to a Key Vault Key"
  default     = null
}


variable "public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server"
  default     = true
}

variable "restore_point_in_time" {
  type        = string
  description = "When create_mode is PointInTimeRestore, specifies the point in time to restore from creation_source_server_id."
  default     = null
}

variable "ssl_enforcement_enabled" {
  type        = bool
  description = "Specifies if SSL should be enforced on connections"
  default     = false
}

variable "ssl_minimal_tls_version_enforced" {
  type        = string
  description = "The minimum TLS version to support on the sever."
  default     = "TLS1_2"
}


variable "sku_name" {
  type        = string
  description = "sku name"
}

variable "storage_mb" {
  type        = number
  description = "stoarge for mysql"
  default     = null
}

variable "subnet_id" {
  type        = string
  description = "id of subnet"
}


variable "threat_detection_policy" {
  type = object({
    enabled                    = bool
    disabled_alerts            = list(string)
    email_account_admins       = bool
    email_addresses            = list(string)
    retention_days             = number
    storage_account_access_key = string
    storage_endpoint           = string
  })
  description = "Threat detection policy configuration, known in the API as Server Security Alerts Policy."
  default     = null
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
}