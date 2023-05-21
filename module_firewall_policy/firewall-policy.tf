
#------------------------------------- Firewall Policy ---------------------------------------------
resource "azurerm_firewall_policy" "fp" {
  name                     = var.firewall_policy_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  base_policy_id           = var.base_policy_id
  private_ip_ranges        = var.private_ip_ranges
  sku                      = var.firewall_policy_sku
  tags                     = var.tags
  threat_intelligence_mode = var.threat_intelligence_mode
  sql_redirect_allowed     = var.sql_redirect_allowed

  dynamic "dns" {
    for_each = var.enable_dns ? [1] : []
    content {
      proxy_enabled = var.proxy_enabled
      servers       = var.servers
    }
  }

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = var.identity_ids
    }
  }

  dynamic "insights" {
    for_each = var.insights_enabled ? [1] : []
    content {
      enabled                            = var.insights_enabled
      default_log_analytics_workspace_id = var.default_log_analytics_workspace_id
      retention_in_days                  = var.retention_in_days

      dynamic "log_analytics_workspace" {
        for_each = var.log_analytics_workspace != null && var.insights_enabled ? [1] : []
        content {
          id                = lookup(log_analytics_workspace.value, "id")
          firewall_location = lookup(log_analytics_workspace.value, "firewall_location")
        }
      }
    }
  }

  dynamic "intrusion_detection" {
    for_each = var.enable_intrusion_detection ? [1] : []
    content {
      mode           = var.mode
      private_ranges = var.private_ranges

      dynamic "signature_overrides" {
        for_each = var.signature_overrides != null && var.enable_intrusion_detection ? var.signature_overrides : []
        content {
          id    = signature_overrides.value.id
          state = signature_overrides.value.state
        }
      }

      dynamic "traffic_bypass" {
        for_each = var.traffic_bypass != null && var.enable_intrusion_detection != null ? var.traffic_bypass : []
        content {
          name                  = traffic_bypass.value.name
          protocol              = traffic_bypass.value.protocol
          description           = traffic_bypass.value.description
          destination_addresses = traffic_bypass.value.destination_addresses
          destination_ip_groups = traffic_bypass.value.destination_ip_groups
          destination_ports     = traffic_bypass.value.destination_ports
          source_addresses      = traffic_bypass.value.source_addresses
          source_ip_groups      = traffic_bypass.value.source_ip_groups
        }
      }
    }
  }

  dynamic "threat_intelligence_allowlist" {
    for_each = var.enable_threat_intelligence_allowlist ? [1] : []
    content {
      fqdns        = var.fqdns
      ip_addresses = var.ip_addresses
    }
  }

  dynamic "tls_certificate" {
    for_each = var.enable_tls_certificate != null ? [1] : []
    content {
      key_vault_secret_id = var.key_vault_secret_id
      name                = var.name
    }
  }
}
