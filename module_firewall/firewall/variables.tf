#-----------------------------Resource Group---------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}
#--------------------------------Firewall------------------------------------
variable "firewall_name" {
  type        = string
  description = "Firewall name in Azure"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

variable "sku_name" {
  type        = string
  description = "sku name in Azure"
}

variable "sku_tier" {
  type        = string
  description = "Sku tier in Azure"
}

variable "firewall_policy_id" {
  type        = string
  description = "The ID of the Firewall Policy applied to the Firewall"
  default     = null
}

variable "dns_servers" {
  type        = list(string)
  description = "A list of DNS servers that the Azure Firewall will direct DNS traffic to the for name resolution"
  default     = null
}

variable "private_ip_ranges" {
  type        = list(string)
  description = "A list of SNAT private CIDR IP ranges, or the special string IANAPrivateRanges"
  default     = null
}

variable "threat_intel_mode" {
  type        = string
  description = "The operation mode for threat intelligence-based filtering. Possible values are: Off, Alert,Deny and (empty string (generally used by double quotes))."
  default     = "Alert"
}

variable "zones" {
  type        = list(string)
  description = "Specifies a list of Availability Zones in which this Azure Firewall should be located."
  default     = null
}

######################## IP configuration 
variable "ip_config_name" {
  type        = string
  description = "Specifies the name of the IP Configuration."
}

variable "ip_config_subnet_id" {
  type        = string
  description = "Reference to the subnet associated with the IP Configuration."
}

variable "ip_config_public_ip_address_id" {
  type        = string
  description = " The ID of the Public IP Address associated with the firewall."
}
######################## Management ip configuration
variable "mgmt_ip_config_name" {
  type        = string
  description = "Specifies the name of the IP Configuration."
}

variable "mgmt_ip_config_subnet_id" {
  type        = string
  description = "Reference to the subnet associated with the IP Configuration."
}

variable "mgmt_ip_config_public_ip_address_id" {
  type        = string
  description = " The ID of the Public IP Address associated with the firewall."
}

######################### Virtual Hub
variable "virtual_hub_id" {
  type        = string
  description = "Specifies the ID of the Virtual Hub where the Firewall resides in."
}

variable "public_ip_count" {
  type        = number
  description = "Specifies the number of public IPs to assign to the Firewall."
  default     = 1
}
