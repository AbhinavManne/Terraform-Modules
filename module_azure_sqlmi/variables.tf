variable "primary_sqlmi" {
  type        = string
  description = "The name of the SQL Managed Instance. This needs to be globally unique within Azure."
}

variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}


variable "location" {
  type = string
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
}

variable "secondary_location" {
  type = string
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = "East US 2"
}

variable "administrator_login" {
  type        = string
  description = "The administrator login name for the new server"

}

variable "license_type" {
  type        = string
  description = "What type of license the Managed Instance will use"

}
variable "sku_name" {
  type        = string
  description = "Specifies the SKU Name for the SQL Managed Instance."

}

variable "vcores" {
  type        = string
  description = "Number of cores that should be assigned to your instance"

}

variable "storage_size_in_gb" {
  type        = number
  description = "Maximum storage space for your instance"

}

variable "public_data_endpoint_enabled" {
  type        = bool
  description = "Is the public data endpoint enabled?"
  default     = false

}

variable "collation" {
  type        = string
  description = "Specifies how the SQL Managed Instance will be collated"
  default     = "SQL_Latin1_General_CP1_CI_AS"
}


variable "minimum_tls_version" {
  type        = string
  description = "The Minimum TLS Version"
  default     = "1.2"
}

variable "proxy_override" {
  type        = string
  description = "Specifies how the SQL Managed Instance will be accessed"
  default     = "Default"
}

variable "subnet_id" {
  type        = string
  description = "(required)The subnet resource id that the SQL Managed Instance will be associated with."

}

variable "timezone_id" {
  type        = string
  description = "The TimeZone ID that the SQL Managed Instance will be operating in."
  default     = "UTC"
}

variable "dns_zone_partner_id" {
  type        = string
  description = "The ID of the SQL Managed Instance which will share the DNS zone."
  default     = null
}

variable "storage_account_type" {
  type        = string
  description = "Specifies the storage account type used to store backups for this database"
  default     = "GRS"
}

variable "identity_type" {
  type        = string
  description = "identity block "
  default     = null
}

variable "maintenance_configuration_name" {
  type        = string
  description = " The name of the Public Maintenance Configuration window to apply to the SQL Managed Instance."
  default     = "SQL_Default"
}

variable "secondary_sqlmi" {
  description = "The Secondary (Failover) SQL MI instance details"
  type        = map(any)
  default     = null
}

variable "database_name" {
  type        = map(any)
  description = "name of db"
}

variable "mode" {
  type        = string
  description = "The failover mode"
}

variable "grace_minutes" {
  type        = string
  description = "The grace period in minutes before failover with data loss is attempted."
  default     = null
}

variable "login_username" {
  type        = string
  description = "The login name of the principal to set as the Managed Instance Administrator"
}

variable "object_id" {
  type        = string
  description = "The Object ID of the principal to set as the Managed Instance Administrator"
}

variable "tenant_id" {
  type        = string
  description = "The Azure Active Directory Tenant ID"
}

variable "azuread_authentication_only" {
  type        = bool
  description = "When true, only permit logins from AAD users and administrators. When false, also allow local database users."
  default     = false

}

variable "storage_container_path" {
  type        = string
  description = " A blob storage container path to hold the scan results"

}

variable "storage_account_access_key" {
  type        = string
  description = " Specifies the identifier key of the storage account for vulnerability assessment scan results."
  default     = null
}


variable "storage_container_sas_key" {
  type        = string
  description = "A shared access signature (SAS Key) that has write access to the blob container specified in storage_container_path parameter. If storage_account_access_key isn't specified, storage_container_sas_key is required."
}

variable "recurring_scans" {
  type        = map(any)
  description = "The recurring scans settings"
  default     = null
}

variable "create_aad" {
  type        = bool
  description = "wants to create aad or not"
  default     = false
}


variable "create_vulnerability_assessment" {
  type        = bool
  description = "wants to create vulnerability assessment"
  default     = false
}

variable "create_managed_db" {
  type        = bool
  description = "wants to create database or not"
  default     = false
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "failover_group_name" {
  type = map(any)
  description = "name of failover group"
}

variable "key_vault_secret_name" {
  type=string
  description = "key vault secret name"
}

variable "key_vault_id" {
  type= string
  description ="ID of keyvault"
}