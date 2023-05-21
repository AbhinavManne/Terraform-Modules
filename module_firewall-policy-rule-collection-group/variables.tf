
#--------------------------------firewall policy rule collection group-----------------------------
variable "firewall_policy_rule_collection_group_name" {
  type        = string
  description = "firewall policy rule collection group name in Azure"
}

variable "firewall_policy_id" {
  type        = string
  description = "The ID of the Firewall Policy where the Firewall Policy Rule Collection Group should exist"
}

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