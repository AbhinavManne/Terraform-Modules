module "servicebus_namespace_module" {
  source                    = "../module_servicebus-namespace"
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
  public_network_access_enabled = var.public_network_access_enabled_for_namespace
  minimum_tls_version           = var.minimum_tls_version
  zone_redundant                = var.zone_redundant
  tags                          = var.tags
}

data "azurerm_subnet" "servicebus_namespace_network_rule_set_subnet" {
  name                 = var.subnet_name_for_network_config
  virtual_network_name = var.virtual_network_name_for_network_config
  resource_group_name  = var.subnet_resource_group_name
}

resource "azurerm_servicebus_namespace_network_rule_set" "servicebus_namespace_network_rule_set" {
  namespace_id                  = module.servicebus_namespace_module.servicebus_namespace_id
  default_action                = var.default_action
  public_network_access_enabled = var.public_network_access_enabled_for_namespace_network_rule_set
  trusted_services_allowed      = var.trusted_services_allowed
  ip_rules                      = var.ip_rules
  dynamic "network_rules" {
    for_each = var.network_rules_config != null ? [1] : []
    content {
      subnet_id                            = data.azurerm_subnet.servicebus_namespace_network_rule_set_subnet.id
      ignore_missing_vnet_service_endpoint = var.network_rules_config.0.ignore_missing_vnet_service_endpoint
    }
  }
}