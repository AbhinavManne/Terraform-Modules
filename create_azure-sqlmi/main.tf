module "sqlmi" {

  source = "../../modules/module_azure_sqlmi"

  resource_group_name            = var.resource_group_name
  location                       = var.location
  primary_sqlmi                  = var.primary_sqlmi
  administrator_login            = var.administrator_login
  license_type                   = var.license_type
  sku_name                       = var.sku_name
  vcores                         = var.vcores
  storage_size_in_gb             = var.storage_size_in_gb
  public_data_endpoint_enabled   = var.public_data_endpoint_enabled
  collation                      = var.collation
  minimum_tls_version            = var.minimum_tls_version
  proxy_override                 = var.proxy_override
  timezone_id                    = var.timezone_id
  dns_zone_partner_id            = var.dns_zone_partner_id
  storage_account_type           = var.storage_account_type
  identity_type                  = var.identity_type
  subnet_id                      = var.subnet_id
  maintenance_configuration_name = var.maintenance_configuration_name
  database_name                  = var.database_name
  mode                           = var.mode
  grace_minutes                  = var.grace_minutes
  create_aad                     = var.create_aad
  failover_group_name            = var.failover_group_name
  login_username                 = var.login_username
  tenant_id                      = var.tenant_id
  object_id                      = var.object_id
  storage_container_path         = var.storage_container_path
  storage_container_sas_key      = var.storage_container_sas_key
  secondary_sqlmi                = var.secondary_sqlmi
  secondary_location             = var.secondary_location
  key_vault_secret_name          = var.key_vault_secret_name
  key_vault_id                   = var.key_vault_id
  tags                           = var.tags

}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

# module "alert" {
#   source                   = "../../modules/module_alert"
#   action_group_name        = var.action_group_name
#   resource_group_location  = var.location
#   resource_group_name      = var.resource_group_name
#   short_name               = var.short_name
#   action_group_rule_name   = var.action_group_rule_name
#   scope_type               = var.scope_type
#   resource_id              = module.sqlmi.sqlmi_instance_id
#   activity_log_alert_name  = var.activity_log_alert_name
#   resource_group_id        = module.module_create_resource_group.resource_group_id
#   operation_name_log_alert = var.operation_name_log_alert
#   category_log_alert       = var.category_log_alert
#   metric_alert_name        = var.metric_alert_name
#   storage_account_id       = var.storage_account_id
#   metric_namespace         = var.metric_namespace
#   metric_name              = var.metric_name
#   aggregation              = var.aggregation
#   operator                 = var.operator
#   threshold                = var.threshold
#   dimension_name           = var.dimension_name
#   dimension_operator       = var.dimension_operator
#   values                   = var.values

# }


# module "diag_settings" {
#   source                          = "../../modules/module_diagnostics_settings"
#   enable_log_monitoring           = var.enable_log_monitoring
#   diag_name                       = var.diag_name
#   target_resource_id              = module.sqlmi.sqlmi_instance_id
#   log_analytics_workspace_id      = var.log_analytics_workspace_id
#   log_analytics_destination_type  = var.log_analytics_destination_type
#   storage_account_id              = var.storage_account_id
#   eventhub_name                   = var.eventhub_name
#   eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
#   log_enabled                     = var.log_enabled
#   log_retention_policy_enabled    = var.log_retention_policy_enabled
#   log_retention_days              = var.log_retention_days
#   metric_retention_policy_enabled = var.metric_retention_policy_enabled
#   metric_retention_days           = var.metric_retention_days
# }
