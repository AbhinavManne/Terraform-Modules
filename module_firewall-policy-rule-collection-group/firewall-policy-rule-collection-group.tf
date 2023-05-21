
resource "azurerm_firewall_policy_rule_collection_group" "fprcg" {
  name               = var.firewall_policy_rule_collection_group_name
  firewall_policy_id = var.firewall_policy_id
  priority           = var.priority

  dynamic "application_rule_collection" {
    for_each = var.application_rule_collection != null ? var.application_rule_collection : []
    content {
      name     = application_rule_collection.value.name
      priority = application_rule_collection.value.priority
      action   = application_rule_collection.value.action

      dynamic "rule" {
        for_each = application_rule_collection.value.rule != null ? application_rule_collection.value.rule : []
        content {
          name                  = rule.value.name
          description           = rule.value.description
          source_addresses      = rule.value.source_addresses
          source_ip_groups      = rule.value.source_ip_groups
          destination_addresses = rule.value.destination_addresses
          destination_urls      = rule.value.destination_urls
          destination_fqdns     = rule.value.destination_fqdns
          destination_fqdn_tags = rule.value.destination_fqdn_tags
          terminate_tls         = rule.value.terminate_tls
          web_categories        = rule.value.web_categories

          dynamic "protocols" {
            for_each = rule.value.protocols != null ? rule.value.protocols : []
            content {
              type = protocols.value.type
              port = protocols.value.port
            }
          }
        }
      }
    }
  }
  dynamic "network_rule_collection" {
    for_each = var.network_rule_collection != null ? var.network_rule_collection : []
    content {
      name     = network_rule_collection.value.name
      priority = network_rule_collection.value.priority
      action   = network_rule_collection.value.action

      dynamic "rule" {
        for_each = network_rule_collection.value.rule != null ? network_rule_collection.value.rule : []
        content {
          name                  = rule.value.name
          protocols             = rule.value.protocols
          destination_ports     = rule.value.destination_ports
          source_addresses      = rule.value.source_addresses
          source_ip_groups      = rule.value.source_ip_groups
          destination_addresses = rule.value.destination_addresses
          destination_ip_groups = rule.value.destination_ip_groups
          destination_fqdns     = rule.value.destination_fqdns
        }
      }
    }
  }

  dynamic "nat_rule_collection" {
    for_each = var.nat_rule_collection != null ? var.nat_rule_collection : []
    content {
      name     = nat_rule_collection.value.name
      priority = nat_rule_collection.value.priority
      action   = nat_rule_collection.value.action

      rule {
        name                = lookup(nat_rule_collection.value.rule, "name")
        protocols           = lookup(nat_rule_collection.value.rule, "protocols")
        source_addresses    = lookup(nat_rule_collection.value.rule, "source_addresses")
        source_ip_groups    = lookup(nat_rule_collection.value.rule, "source_ip_groups")
        destination_address = lookup(nat_rule_collection.value.rule, "destination_address")
        destination_ports   = lookup(nat_rule_collection.value.rule, "destination_ports")
        translated_address  = lookup(nat_rule_collection.value.rule, "translated_address")
        translated_fqdn     = lookup(nat_rule_collection.value.rule, "translated_fqdn")
        translated_port     = lookup(nat_rule_collection.value.rule, "translated_port")

      }
    }
  }
}
