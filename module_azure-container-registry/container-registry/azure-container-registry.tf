
resource "azurerm_container_registry" "container_registry" {
  name                          = format("%s", var.container_registry_config.name)
  resource_group_name           = var.resource_group_name
  location                      = var.location
  admin_enabled                 = var.container_registry_config.admin_enabled
  sku                           = var.container_registry_config.sku
  public_network_access_enabled = var.container_registry_config.public_network_access_enabled
  quarantine_policy_enabled     = var.container_registry_config.quarantine_policy_enabled
  zone_redundancy_enabled       = var.container_registry_config.zone_redundancy_enabled
  tags                          = merge({ "Name" = format("%s", var.container_registry_config.name) }, var.tags, )

  dynamic "georeplications" {
    for_each = var.georeplications 
    content {
      location                = georeplications.value.location
      zone_redundancy_enabled = georeplications.value.zone_redundancy_enabled
      tags                    = merge({ "Name" = format("%s", "georep-${georeplications.value.location}") }, var.tags)
    }
  }

  dynamic "network_rule_set" {
    for_each = var.network_rule_set != null ? [var.network_rule_set] : []
    content {
      default_action = lookup(network_rule_set.value, "default_action", "Allow")

      dynamic "ip_rule" {
        for_each = network_rule_set.value.ip_rule
        content {
          action   = "Allow"
          ip_range = ip_rule.value.ip_range
        }
      }
      dynamic "virtual_network" {
        for_each = network_rule_set.value.virtual_network
        content {
          action    = "Allow"
          subnet_id = virtual_network.value.subnet_id
        }
      }
    }
  }

  dynamic "retention_policy" {
    for_each = var.retention_policy != null ? [var.retention_policy] : []
    content {
      days    = lookup(retention_policy.value, "days", 7)
      enabled = lookup(retention_policy.value, "enabled", true)
    }
  }

  #This is not supported for encryption enabled registries .
  #To enable content trust first disable the encryption
  dynamic "trust_policy" {
    for_each = var.enable_content_trust ? [1] : []
    content {
      enabled = var.enable_content_trust
    }
  }


  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []
    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "UserAssigned" || var.identity_type == "SystemAssigned, UserAssigned" ? var.identity_ids : null
    }
  }

  dynamic "encryption" {
    for_each = var.encryption != null ? [var.encryption] : []
    content {
      enabled            = encryption.value.enabled
      key_vault_key_id   = encryption.value.key_vault_key_id
      identity_client_id = encryption.value.identity_client_id
    }
  }
}


#----------------------------------------------------------
# Container Registry  Agent pool 
#----------------------------------------------------------

resource "azurerm_container_registry_agent_pool" "agent_pool" {
  for_each                  = var.agent_pool != null ? { for k, v in var.agent_pool : k => v if v != null } : {}
  name                      = format("%s", each.key)
  resource_group_name       = var.resource_group_name
  location                  = var.location
  container_registry_name   = azurerm_container_registry.container_registry.name
  instance_count            = each.value["instance_count"]
  tier                      = each.value["tier"]
  virtual_network_subnet_id = each.value["virtual_network_subnet_id"]
}

#------------------------------------------------------------
# Container Registry Resoruce Scope map - Default is "false"
#------------------------------------------------------------

resource "azurerm_container_registry_scope_map" "scope_map" {
  for_each                = var.scope_map != null ? { for k, v in var.scope_map : k => v if v != null } : {}
  name                    = format("%s", each.key)
  resource_group_name     = var.resource_group_name
  container_registry_name = azurerm_container_registry.container_registry.name
  actions                 = each.value["actions"]
}

#------------------------------------------------------------
# Container Registry Token  - Default is "false"
#------------------------------------------------------------
resource "azurerm_container_registry_token" "registry_token" {
  for_each                = var.scope_map != null ? { for k, v in var.scope_map : k => v if v != null } : {}
  name                    = format("%s", "${each.key}-token")
  resource_group_name     = var.resource_group_name
  container_registry_name = azurerm_container_registry.container_registry.name
  scope_map_id            = element([for k in azurerm_container_registry_scope_map.scope_map : k.id], 0)
  enabled                 = var.enabled
}

#------------------------------------------------------------
# Container Registry webhook - Default is "true"
#------------------------------------------------------------
resource "azurerm_container_registry_webhook" "registry_webhook" {
  for_each            = var.container_registry_webhooks != null ? { for k, v in var.container_registry_webhooks : k => v if v != null } : {}
  name                = format("%s", each.key)
  resource_group_name = var.resource_group_name
  location            = var.location
  registry_name       = azurerm_container_registry.container_registry.name
  service_uri         = each.value["service_uri"]
  actions             = each.value["actions"]
  status              = each.value["status"]
  scope               = each.value["scope"]
  custom_headers      = each.value["custom_headers"]
}



