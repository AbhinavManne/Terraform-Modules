variable "resource_group_name" {
  type        = string
  description = "Resource Group for the Data Explorer"
}

variable "location" {
  type        = string
  description = "Location for the Data Explorer"
}

variable "kusto_cluster" {
  type        = string
  description = "Name of of Data Explorer"
}

variable "allowed_fqdns" {
  type        = list(string)
  description = "List of allowed FQDNs(Fully Qualified Domain Name) for egress from Cluster."
  default     = null
}

variable "allowed_ip_ranges" {
  type        = list(string)
  description = "The list of ips in the format of CIDR allowed to connect to the cluster."
  default     = null
}

variable "double_encryption_enabled" {
  type        = bool
  description = "Is the cluster's double encryption enabled?"
  default     = false
}

variable "auto_stop_enabled" {
  type        = bool
  description = "Specifies if the cluster could be automatically stopped (due to lack of data or no activity for many days)."
  default     = false
}

variable "disk_encryption_enabled" {
  type        = bool
  description = "Specifies if the cluster's disks are encrypted."
  default     = false
}

variable "streaming_ingestion_enabled" {
  type        = bool
  description = "Specifies if the streaming ingest is enabled."
  default     = false
}

variable "public_ip_type" {
  type        = string
  description = "Indicates what public IP type to create - IPv4 (default), or DualStack (both IPv4 and IPv6)."
  default     = "IPv4"
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Is the public network access enabled?"
  default     = false
}

variable "outbound_network_access_restricted" {
  type        = bool
  description = "Whether to restrict outbound network access"
  default     = false
}

variable "purge_enabled" {
  type        = bool
  description = "Specifies if the purge operations are enabled"
  default     = false
}

variable "sku_name" {
  type        = string
  description = "The name of the SKU"
}

variable "capacity" {
  type        = number
  description = "Specifies the node count for the cluster. Boundaries depend on the SKU name."
}

variable "identity_type" {
  type        = string
  description = "Specifies the type of Managed Service Identity that is configured on this Kusto Cluster. Possible values are: SystemAssigned, UserAssigned and SystemAssigned,UserAssigned"
  default     = "SystemAssigned"
}

variable "identity_ids" {
  type        = list(string)
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Kusto Cluster."
  default     = null
}
variable "virtual_network_configuration" {
  type        = bool
  description = "Whether to enable virtual network configuration"
  default     = false
}

variable "subnet_id" {
  type        = string
  description = "The subnet resource id"
  default     = null
}

variable "engine_public_ip_id" {
  type        = string
  description = "Engine service's public IP address resource id."
  default     = null
}

variable "data_management_public_ip_id" {
  type        = string
  description = "Data management's service public IP address resource id."
  default     = null
}

variable "optimized_auto_scale" {
  type        = bool
  description = "Whether to enable optimized auto scale"
  default     = false
}

variable "minimum_instances" {
  type        = number
  description = "The minimum number of allowed instances. Must between 0 and 1000."
  default     = 1
}

variable "maximum_instances" {
  type        = number
  description = "The maximum number of allowed instances. Must between 0 and 1000."
  default     = 5
}

variable "engine" {
  type        = string
  description = "The engine type that will be used in the backend. Possible values are V2 and V3"
  default     = "V2"
}

variable "zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this Kusto Cluster should be located."
  default     = null
}

variable "trusted_external_tenants" {
  type        = list(string)
  description = "Specifies a list of tenant IDs that are trusted by the cluster. Default setting trusts all other tenants. Use trusted_external_tenants = ['*'] to explicitly allow all other tenants, trusted_external_tenants = ['MyTenantOnly'] for only your tenant or trusted_external_tenants = [<tenantId1>, <tenantIdx>] to allow specific other tenants."
  default     = ["*"]
}

variable "language_extensions" {
  type        = list(string)
  description = "A list of language_extensions to enable. Valid values are: PYTHON and R."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "tags"
  default     = null
}










