module "servicebus_namespace_module" {
  source                    = "../../modules/module_servicebus-namespace"
  servicebus_namespace_name = var.servicebus_namespace_name
  location                  = var.location
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