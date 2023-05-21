data "azurerm_client_config" "config" {
}

#Reference to module that provisions an Azure Keyvault
module "keyvault" {
  source                          = "../../modules/module_keyvault"
  keyvault_name                   = var.keyvault_name  
  location                        = var.location
  resource_group_name             = var.resource_group_name
  tenant_id                       = data.azurerm_client_config.config.tenant_id //var.tenant_id
  kv_sku                          = var.kv_sku
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  purge_protection_enabled        = var.purge_protection_enabled
  public_network_access_enabled   = var.public_network_access_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days
  default_action                  = var.default_action
  bypass                          = var.bypass
  ip_rules                        = var.ip_rules
  virtual_network_subnet_ids      = var.virtual_network_subnet_ids
  contact_email                   = var.contact_email
  contact_name                    = var.contact_name
  contact_phone                   = var.contact_phone
  tags                            = var.tags
  enable_access_policy            = var.enable_access_policy
  object_id                       = data.azurerm_client_config.config.object_id //var.object_id
  application_id                  = var.application_id
  keyvault_key_permissions        = var.keyvault_key_permissions
  keyvault_secret_permissions     = var.keyvault_secret_permissions
  keyvault_certificate_permissions= var.keyvault_certificate_permissions
  keyvault_storage_permissions    = var.keyvault_storage_permissions
  
}

#Reference to module that provisions multiple keyvault access policies
// By default this module is optional
module "keyvault_access_policies" {
  for_each = var.policies != null && var.create_keyvault_access_policies ? var.policies : {}
  source      = "../../modules/module_keyvault_access_policies"
  keyvault_id             = module.keyvault.keyvault_id //var.keyvault_id
  tenant_id               = lookup(each.value, "tenant_id")
  object_id               = lookup(each.value, "object_id")
  application_id          = lookup(each.value, "application_id")  
  key_permissions         = lookup(each.value, "key_permissions")
  secret_permissions      = lookup(each.value, "secret_permissions")
  certificate_permissions = lookup(each.value, "certificate_permissions")
  storage_permissions     = lookup(each.value, "storage_permissions")

}

#Reference to module that provisions private endpoint
// By default this module is optional
module "PrivateEndpointSql_module" {
  count                             = var.create_private-endpoint ? 1 : 0
  source                            = "../../modules/module_private_endpoint"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_connection_resource_id    = module.keyvault.keyvault_id
  subnet_id                         = var.subnet_id
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
}

#Reference to module that provisions alerts resources
module "alert" {
  source = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.keyvault.keyvault_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = var.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = var.storage_account_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}

#Reference to module that provisions diagnostic resources
module "diag_settings" {
  source                         = "../../modules/module_diagnostics_settings"
  enable_log_monitoring          = var.enable_log_monitoring
  diag_name                      = var.diag_name
  target_resource_id             = module.keyvault.keyvault_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  log_analytics_destination_type = var.log_analytics_destination_type
  storage_account_id             = var.storage_account_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  log_enabled                    = var.log_enabled
  log_retention_policy_enabled   = var.log_retention_policy_enabled
  log_retention_days             = var.log_retention_days
  metric_retention_policy_enabled= var.metric_retention_policy_enabled
  metric_retention_days          = var.metric_retention_days
}