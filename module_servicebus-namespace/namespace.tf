resource "azurerm_servicebus_namespace" "servicebus_namespace" {
  name                = var.servicebus_namespace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  dynamic "identity" {
    for_each = var.identity_config != null ? [1] : []
    content {
      type         = var.identity_config.0.type
      identity_ids = var.identity_config.0.identity_ids
    }
  }
  capacity = var.capacity
  dynamic "customer_managed_key" {
    for_each = var.sku == "Premium" && var.customer_managed_key_config != null ? [1] : []
    content {
      key_vault_key_id                  = var.customer_managed_key_config.0.key_vault_key_id
      identity_id                       = var.customer_managed_key_config.0.identity_id
      infrastructure_encryption_enabled = var.customer_managed_key_config.0.infrastructure_encryption_enabled
    }
  }
  local_auth_enabled            = var.local_auth_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version
  zone_redundant                = var.zone_redundant
  tags                          = var.tags
}