module "primary_servicebus_namespace_module" {
  source                    = "../module_servicebus-namespace"
  servicebus_namespace_name = var.primary_servicebus_namespace_name
  location                  = var.primary_servicebus_namespace_location
  resource_group_name       = var.resource_group_name
  sku                       = var.sku
  identity_config = [{
    type         = var.identity_config.0.type
    identity_ids = var.identity_config.0.identity_ids
  }]
  capacity = var.capacity
  customer_managed_key_config = [{
    key_vault_key_id                  = var.customer_managed_key_config.0.key_vault_key_id
    identity_id                       = var.customer_managed_key_config.0.identity_id
    infrastructure_encryption_enabled = var.customer_managed_key_config.0.infrastructure_encryption_enabled
  }]
  local_auth_enabled            = var.local_auth_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version
  zone_redundant                = var.zone_redundant
  tags                          = var.tags
}

module "secondary_servicebus_namespace_module" {
  source                    = "../module_servicebus-namespace"
  servicebus_namespace_name = var.secondary_servicebus_namespace_name
  location                  = var.secondary_servicebus_namespace_location
  resource_group_name       = var.resource_group_name
  sku                       = var.sku
  identity_config = [{
    type         = var.identity_config.0.type
    identity_ids = var.identity_config.0.identity_ids
  }]
  capacity = var.capacity
  customer_managed_key_config = [{
    key_vault_key_id                  = var.customer_managed_key_config.0.key_vault_key_id
    identity_id                       = var.customer_managed_key_config.0.identity_id
    infrastructure_encryption_enabled = var.customer_managed_key_config.0.infrastructure_encryption_enabled
  }]
  local_auth_enabled            = var.local_auth_enabled
  public_network_access_enabled = var.public_network_access_enabled
  minimum_tls_version           = var.minimum_tls_version
  zone_redundant                = var.zone_redundant
  tags                          = var.tags
}

resource "azurerm_servicebus_namespace_disaster_recovery_config" "servicebus_namespace_disaster_recovery_config" {
  name                 = var.servicebus_namespace_disaster_recovery_config_name
  primary_namespace_id = module.primary_servicebus_namespace_module.servicebus_namespace_id
  partner_namespace_id = module.secondary_servicebus_namespace_module.servicebus_namespace_id
}