#-----------------------------Resource Group---------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource group location"
}

#--------------------------------firewall policy rule collection group-----------------------------
variable "firewall_policy_rule_collection_group_name" {
  type        = string
  description = "firewall policy rule collection group name in Azure"
}
/*
variable "firewall_policy_id" {
  type        = string
  description = "The ID of the Firewall Policy where the Firewall Policy Rule Collection Group should exist"
}
*/
variable "priority" {
  type        = number
  description = "The priority of the Firewall Policy Rule Collection Group"
}

################# application_rule_collection #############

variable "application_rule_collection" {
  type = list(object({
    name     = string
    priority = number
    action   = string

    rule = list(object({
      name                   = string
      description            = string
      source_addresses       = list(string)
      source_ip_groups       = list(string)
      destination_addresses  = list(string)
      destination_urls       = list(string)
      destination_fqdns      = list(string)
      destination_fqdn_tags  = list(string)
      terminate_tls          = bool
      web_categories         = list(string)

      protocols = list(object({
        type = string
        port = number
      }))
    }))
  }))
  description = "Application rule collection block in firewall policy rule collection group. Here, Optional arguments are: description, source_addresses, source_ip_groups, destination_addresses, destination_urls, destination_fqdns, destination_fqdn_tags, terminate_tls, and web_categories"
}

################# Network_rule_collection #############

variable "network_rule_collection" {
  type = list(object({
    name     = string
    priority = number
    action   = string

    rule = list(object({
      name                  = string
      protocols             = list(string)
      destination_ports     = list(string)
      source_addresses      = list(string)
      source_ip_groups      = list(string)
      destination_addresses = list(string)
      destination_ip_groups = list(string)
      destination_fqdns     = list(string)
    }))
  }))
  description = "Network rule collection block in firewall policy rule collection group. Here, Optional arguments are: source_addresses, source_ip_groups, destination_addresses, destination_ip_groups, and destination_fqdns"
}

################# Nat rule collection #############

variable "nat_rule_collection" {
  type = list(object({
    name     = string
    priority = number
    action   = string

    rule = object({
      name      = string
      protocols = list(string)
      source_addresses      = list(string)
      source_ip_groups      = list(string)
      destination_address   = string
      destination_ports     = list(string)
      translated_address    = string
      translated_fqdn       = string
      translated_port       = string
    })
  }))
  description = "Nat rule collection block in firewall policy rule collection group. Here, Optional arguments are: source_addresses, source_ip_groups, destination_address, destination_ports, translated_address, translated_fqdn, and translated_port"
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
}

variable "tags" {
  type        = map(any)
  description = "Tags"
}

variable "threat_intelligence_mode" {
  type        = string
  description = "The operation mode for Threat Intelligence."
}

variable "sql_redirect_allowed" {
  type        = bool
  description = "Whether SQL Redirect traffic filtering is allowed."
}

############ dns ###########
variable "enable_dns" {
  type        = bool
  description = "Whether to enable DNS block"
}

variable "proxy_enabled" {
  type        = bool
  description = "Whether to enable DNS proxy on Firewalls attached to this Firewall Policy"
}

variable "servers" {
  type        = list(string)
  description = "A list of custom DNS servers' IP addresses"
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
}

variable "log_analytics_workspace" {
  type = map(object({
    id                = string
    firewall_location = string
  }))
  description = "log_analytics_workspace block"
}

############ intrusion_detection ###########
variable "enable_intrusion_detection" {
  type        = bool
  description = "Whether to enable intrusion_detection"
}

variable "mode" {
  type        = string
  description = "n which mode you want to run intrusion detection"
}

variable "private_ranges" {
  type        = list(string)
  description = " A list of Private IP address ranges to identify traffic direction."
}

variable "signature_overrides" {
  type = list(object({
    id    = number
    state = string
  }))
  description = "Signature Overrides block"
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
  description = "Traffic bypass block"
}

############ threat_intelligence_allowlist ###########

variable "enable_threat_intelligence_allowlist" {
  type        = bool
  description = "Whether to enable threat intelligence allowlist"
}
variable "fqdns" {
  type        = list(string)
  description = " A list of FQDNs that will be skipped for threat detection"
}
variable "ip_addresses" {
  type        = list(string)
  description = "A list of IP addresses or CIDR ranges that will be skipped for threat detection."
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
