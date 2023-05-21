variable "location" {
  type        = string
  description = "The location/region to keep all your resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB SERVER-----------------------------#
variable "mariadb_server_name" {
  type        = string
  description = "Name of the MariaDB Server"
}

variable "mariadb_server_sku_name" {
  type        = string
  description = "Specifies the SKU Name for this MariaDB Server. The name of the SKU, follows the tier + family + cores pattern (e.g. B_Gen4_1, GP_Gen5_8)."
}

variable "mariadb_server_version" {
  type        = string
  description = "Specifies the version of MariaDB to use. Possible values are 10.2 and 10.3. "
}

variable "mariadb_server_administrator_login" {
  type        = string
  description = "The Administrator Login for the MariaDB Server"
}

variable "mariadb_server_administrator_login_password" {
  type        = string
  description = "The Password associated with the administrator_login for the MariaDB Server"
}

variable "mariadb_server_auto_grow_enabled" {
  type        = bool
  description = "Enable/Disable auto-growing of the storage"
  default     = true
}

variable "mariadb_server_backup_retention_days" {
  type        = number
  description = "Backup retention days for the server, supported values are between 7 and 35 days"
  default     = 7
  validation {
    condition     = var.mariadb_server_backup_retention_days >= 7 && var.mariadb_server_backup_retention_days <= 35
    error_message = "Backup retention days for the server, supported values are between 7 and 35 days."
  }
}

variable "mariadb_server_create_mode" {
  type        = string
  description = "The creation mode. Can be used to restore or replicate existing servers. Possible values are Default, Replica, GeoRestore, and PointInTimeRestore. Defaults to Default."
  default     = "Default"
}

variable "mariadb_server_creation_source_server_id" {
  type        = string
  description = "For creation modes other than Default, the source server ID to use."
  default     = null
}

variable "mariadb_server_geo_redundant_backup_enabled" {
  type        = bool
  description = "Turn Geo-redundant server backups on/off. It will not work with Basic tier. Works with GP_Gen5_2 #GP: General Purpose"
  default     = false
}

variable "mariadb_server_public_network_access_enabled" {
  type        = bool
  description = "Whether or not public network access is allowed for this server"
  default     = true
}

variable "mariadb_server_restore_point_in_time" {
  type        = string
  description = "When create_mode is PointInTimeRestore, specifies the point in time to restore from creation_source_server_id."
  default     = null
}

variable "mariadb_server_ssl_enforcement_enabled" {
  type        = bool
  description = "Specifies if SSL should be enforced on connections"
}

variable "mariadb_server_storage_mb" {
  type        = number
  description = "Max storage allowed for a server. Possible values are between 5120 MB (5GB) and 1024000MB (1TB) for the Basic SKU and between 5120 MB (5GB) and 4096000 MB (4TB) for General Purpose/Memory Optimized SKUs."
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB DATABASE--------------------------#
variable "mariadb_database_settings" {
  type        = map(any)
  description = "(Required) MariaDB Database details"
}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB CONFIGURATION--------------------------#
variable "mariadb_configuration_settings" {
  type        = map(any)
  description = "(Required) MariaDB Server Configuration details"
}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB FIREWALL RULES---------------------#
variable "mariadb_firewall_rules" {
  description = "Range of IP addresses to allow firewall connections."
  type = map(object({
    start_ip_address = string
    end_ip_address   = string
  }))

}

#--------------------------------------VARIABLES: RESOURCE: MARIA DB VNET RULE--------------------------#
variable "mariadb_virtual_network_rule" {
  type        = string
  description = "Name of the MariaDB Virtual Network Rule"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID"
}