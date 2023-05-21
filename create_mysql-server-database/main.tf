data "azurerm_key_vault_secret" "secret1" {
  name         = var.key_vault_secret_name_primary
  key_vault_id = var.key_vault_id
}


module "mysql" {
  source                            = "../../modules/module_mysql-server-database/mysql"
  resource_group_name               = var.resource_group_name
  location                          = var.location
  mysqlserver_name                  = var.mysqlserver_name
  sku_name                          = var.sku_name
  storage_mb                        = var.storage_mb
  mysql_version                     = var.mysql_version
  admin_username                    = var.admin_username
  admin_password                    = data.azurerm_key_vault_secret.secret1.value
  auto_grow_enabled                 = var.auto_grow_enabled
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
  mysql_configuration               = var.mysql_configuration
  key_vault_key_id                  = var.key_vault_key_id
  threat_detection_policy           = var.threat_detection_policy
  ad_admin_login_name               = var.ad_admin_login_name
  firewall_rules                    = var.firewall_rules
  subnet_id                         = var.subnet_id
  restore_point_in_time             = var.restore_point_in_time
  creation_source_server_id         = var.creation_source_server_id
  tags                              = var.tags
}

//------------------------------------------------------------//
module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

#---------------------------------------Calling modules-----------------------------------------------------------#
// By default this module is optional
module "PrivateEndpointSql_module" {
  count               = var.create_private-endpoint ? 1 : 0
  source              = "../../modules/module_private_endpoint"
  resource_group_name = var.resource_group_name
  location            = var.location

  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_connection_resource_id    = module.mysql.mysql_server_id
  subnet_id                         = var.subnet_id
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
}


# // By default this module is optional
# module "diag_settings" {
#   count                          = var.create_diagnostic_settings ? 1 : 0
#   source                         = "../../modules/module_diagnostics_settings"
#   enable_log_monitoring          = var.enable_log_monitoring
#   diag_name                      = var.diag_name
#   target_resource_id             = module.mysql.mysql_server_id
#   log_analytics_workspace_id     = var.log_analytics_workspace_id
#   log_analytics_destination_type = var.log_analytics_destination_type
#   storage_account_id             = var.storage_account_id
#   eventhub_name                  = var.eventhub_name
#   eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
#   //extaudit_diag_logs              = var.extaudit_diag_logs
#   log_enabled                  = var.log_enabled
#   log_retention_policy_enabled = var.log_retention_policy_enabled
#   log_retention_days           = var.log_retention_days
#   //metrics_category                = var.metrics_category
#   metric_retention_policy_enabled = var.metric_retention_policy_enabled
#   metric_retention_days           = var.metric_retention_days
# }

# // By default this module is optional
# module "alert" {
#   count                    = var.create_alert ? 1 : 0
#   source                   = "../../modules/module_alert"
#   action_group_name        = var.action_group_name
#   resource_group_name      = var.resource_group_name
#   resource_group_location  = var.location
#   short_name               = var.short_name
#   action_group_rule_name   = var.action_group_rule_name
#   scope_type               = var.scope_type
#   resource_id              = module.mysql.mysql_server_id
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
