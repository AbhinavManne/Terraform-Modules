
##################### Event Hub Namespace ###################
resource "azurerm_eventhub_namespace" "event_hub_namespace" {
  name                 = var.event_hub_namespace_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  sku                  = var.event_hub_sku
  capacity             = var.event_hub_capacity
  tags                 = var.tags
  auto_inflate_enabled = var.event_hub_sku != "Premium" && var.event_hub_sku != "Basic" ? var.auto_inflate_enabled : null
  dedicated_cluster_id = var.dedicated_cluster_id
  dynamic "identity" {
    for_each = var.identity != null ? var.identity : []
    content {
      type = identity.value.type
    }
  }
  maximum_throughput_units = var.event_hub_sku != "Premium" && var.event_hub_sku != "Basic" ? var.maximum_thoroughput_units : null
  zone_redundant           = var.zone_redundant
  dynamic "network_rulesets" {
    for_each = var.network_rulesets != null && var.event_hub_sku != "Basic" ? var.network_rulesets : []
    content {
      default_action                 = network_rulesets.value.default_action
      public_network_access_enabled  = network_rulesets.value.public_network_access
      trusted_service_access_enabled = network_rulesets.value.trusted_service_access_enabled
      dynamic "virtual_network_rule" {
        for_each = network_rulesets.value.virtual_network_rule
        content {
          subnet_id                                       = virtual_network_rule.value.subnet_id
          ignore_missing_virtual_network_service_endpoint = virtual_network_rule.value.ignore_missing_virtual_network_service_endpoint
        }
      }
      dynamic "ip_rule" {
        for_each = network_rulesets.value.ip_rule
        content {
          ip_mask = ip_rule.value.ip_mask
          action  = ip_rule.value.action
        }
      }
    }
  }
  local_authentication_enabled  = var.local_authentication_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version
}

########################  Event Hub Namespace Customer Managed Policy #############################

resource "azurerm_key_vault_access_policy" "namespace_cmk_base_policy" {
  count        = var.use_customer_managed_key == true && var.event_hub_sku == "Premium" ? 1 : 0
  key_vault_id = var.keyvault_id
  tenant_id    = azurerm_eventhub_namespace.event_hub_namespace.identity[0].tenant_id
  object_id    = azurerm_eventhub_namespace.event_hub_namespace.identity[0].principal_id

  key_permissions = ["Get", "UnwrapKey", "WrapKey", "Create",
    "Delete",
    "List",
    "Purge",
  "Recover", ]
  depends_on = [
    azurerm_eventhub_namespace.event_hub_namespace,
  ]
}

########################  Event Hub Namespace Customer Managed Key #############################

resource "azurerm_eventhub_namespace_customer_managed_key" "event_hub_customer_managed_key" {
  count                 = var.use_customer_managed_key == true && var.event_hub_sku == "Premium" ? 1 : 0
  eventhub_namespace_id = azurerm_eventhub_namespace.event_hub_namespace.id
  key_vault_key_ids     = var.key_vault_key_ids
  depends_on = [
    azurerm_eventhub_namespace.event_hub_namespace,
    azurerm_key_vault_access_policy.namespace_cmk_base_policy
  ]
}


