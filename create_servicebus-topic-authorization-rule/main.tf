module "servicebus_topic_authorization_rule_module" {
  source                    = "../../modules/module_servicebus-topic-authorization-rule"
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

  servicebus_topic_name                   = var.servicebus_topic_name
  max_message_size_in_kilobytes           = var.max_message_size_in_kilobytes
  max_size_in_megabytes                   = var.max_size_in_megabytes
  requires_duplicate_detection            = var.requires_duplicate_detection
  default_message_ttl                     = var.default_message_ttl
  duplicate_detection_history_time_window = var.duplicate_detection_history_time_window
  status                                  = var.status
  enable_batched_operations               = var.enable_batched_operations
  auto_delete_on_idle                     = var.auto_delete_on_idle
  enable_partitioning                     = var.enable_partitioning
  enable_express                          = var.enable_express
  support_ordering                        = var.support_ordering

  servicebus_topic_authorization_rule_name = var.servicebus_topic_authorization_rule_name
  listen                                   = var.listen
  send                                     = var.send
  manage                                   = var.manage
}