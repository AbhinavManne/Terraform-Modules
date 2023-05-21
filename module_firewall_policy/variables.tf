#-----------------------------Resource Group---------------------------------
variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}
variable "location" {
  type        = string
  description = "Resource group location"
}

#--------------------------------Firewall policy-----------------------------
variable "firewall_policy_name" {
  type        = string
  description = "Firewall policy name in Azure"
}

variable "base_policy_id" {
  type        = string
  description = "The ID of the base Firewall Policy"
}

variable "private_ip_ranges" {
  type        = list(string)
  description = "A list of private IP ranges to which traffic will not be SNAT."
}

variable "firewall_policy_sku" {
  type        = string
  description = "The SKU Tier of the Firewall Policy."
  default     = "Standard"
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

variable "threat_intelligence_mode" {
  type        = string
  description = "The operation mode for Threat Intelligence."
  default     = "Alert"
}

variable "sql_redirect_allowed" {
  type        = bool
  description = "Whether SQL Redirect traffic filtering is allowed."
  default     = false
}

############ dns ###########
variable "enable_dns" {
  type        = bool
  description = "Whether to enable DNS block"
}

variable "proxy_enabled" {
  type        = bool
  description = "Whether to enable DNS proxy on Firewalls attached to this Firewall Policy"
  default     = false
}

variable "servers" {
  type        = list(string)
  description = "A list of custom DNS servers' IP addresses"
  default     = null
}

############ identity ###########
variable "identity_type" {
  type        = string
  description = "Specifies the type of Managed Service Identity that should be configured on this Firewall Policy"
}

variable "identity_ids" {
  type        = list(string)
  description = "Specifies a list of User Assigned Managed Identity IDs to be assigned to this Firewall Policy"
}

############ insights ###########
variable "insights_enabled" {
  type        = bool
  description = "Whether the insights functionality is enabled for this Firewall Policy"
}

variable "default_log_analytics_workspace_id" {
  type        = string
  description = "The ID of the default Log Analytics Workspace that the Firewalls associated with this Firewall Policy will send their logs to, when there is no location matches in the log_analytics_workspace"
}

variable "retention_in_days" {
  type        = number
  description = "The log retention period in days."
  default     = null
}

variable "log_analytics_workspace" {
  type = map(object({
    id                = string
    firewall_location = string
  }))
  description = "log analytics workspace block"
}

############ intrusion_detection ###########
variable "enable_intrusion_detection" {
  type        = bool
  description = "Whether to enable intrusion_detection"
}

variable "mode" {
  type        = string
  description = "n which mode you want to run intrusion detection"
  default     = "Off"
}

variable "private_ranges" {
  type        = list(string)
  description = " A list of Private IP address ranges to identify traffic direction."
  default     = null
}

variable "signature_overrides" {
  type = list(object({
    id    = number
    state = string
  }))
  description = "Signature Overrides block. Optional Arguments: id and state"
}

variable "traffic_bypass" {
  type = list(object({
    name                  = string
    protocol              = string
    description           = string
    destination_addresses = list(string)
    destination_ip_groups = list(string)
    destination_ports     = list(string)
    source_addresses      = list(string)
    source_ip_groups      = list(string)
  }))
  description = "Traffic bypass block. Optional Arguments: description, destination_addresses, destination_ip_groups, destination_ports, source_addresses, and source_ip_groups"
}

############ threat_intelligence_allowlist ###########

variable "enable_threat_intelligence_allowlist" {
  type        = bool
  description = "Whether to enable threat intelligence allowlist"
}
variable "fqdns" {
  type        = list(string)
  description = " A list of FQDNs that will be skipped for threat detection"
  default     = null
}
variable "ip_addresses" {
  type        = list(string)
  description = "A list of IP addresses or CIDR ranges that will be skipped for threat detection."
  default     = null
}

############ tls_certificate ###########

variable "enable_tls_certificate" {
  type        = bool
  description = "Whether to enable tls certificate block"
}
variable "key_vault_secret_id" {
  type        = string
  description = "The ID of the Key Vault, where the secret or certificate is stored."
}
variable "name" {
  type        = string
  description = "The name of the certificate"
}
