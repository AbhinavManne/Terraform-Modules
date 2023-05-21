#kEYVAULT SECRET DATA SOURCE FOR ADMIN LOGIN AND PASSWORD
data "azurerm_key_vault_secret" "secret" {
  name         = var.secret_name
  key_vault_id = var.keyvault_id
}

#Reference to MariaDB Server Database module
module "maria_db" {
  source              = "../../modules/module_mariadb/maria_db_module"
  resource_group_name = var.resource_group_name
  location            = var.location
  //MARIA DB SERVER
  mariadb_server_name                          = var.mariadb_server_name
  mariadb_server_sku_name                      = var.mariadb_server_sku_name
  mariadb_server_version                       = var.mariadb_server_version
  mariadb_server_administrator_login           = data.azurerm_key_vault_secret.secret.name//var.mariadb_server_administrator_login
  mariadb_server_administrator_login_password  = data.azurerm_key_vault_secret.secret.value//var.mariadb_server_administrator_login_password
  mariadb_server_auto_grow_enabled             = var.mariadb_server_auto_grow_enabled
  mariadb_server_backup_retention_days         = var.mariadb_server_backup_retention_days
  mariadb_server_create_mode                   = var.mariadb_server_create_mode
  mariadb_server_creation_source_server_id     = var.mariadb_server_creation_source_server_id
  mariadb_server_geo_redundant_backup_enabled  = var.mariadb_server_geo_redundant_backup_enabled
  mariadb_server_public_network_access_enabled = var.mariadb_server_public_network_access_enabled
  mariadb_server_restore_point_in_time         = var.mariadb_server_restore_point_in_time
  mariadb_server_ssl_enforcement_enabled       = var.mariadb_server_ssl_enforcement_enabled
  mariadb_server_storage_mb                    = var.mariadb_server_storage_mb
  tags                                         = var.tags
  //MARIA DB 
  mariadb_database_settings = var.mariadb_database_settings
  //MARIA DB CONFIGURATIONS
  mariadb_configuration_settings = var.mariadb_configuration_settings
  //MARIA DB FIREWALL
  mariadb_firewall_rules = var.mariadb_firewall_rules
  //MARIA DB VNET RULE
  mariadb_virtual_network_rule = var.mariadb_virtual_network_rule
  subnet_id                    = var.subnet_id
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
  private_connection_resource_id    = module.maria_db.mariadb_server_id
  subnet_id                         = var.subnet_id
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
}

# #Reference to module that provisions alerts resources
# module "alert" {
#   source                   = "../../modules/module_alert"
#   action_group_name        = var.action_group_name
#   resource_group_name      = var.resource_group_name
#   resource_group_location  = var.location
#   short_name               = var.short_name
#   action_group_rule_name   = var.action_group_rule_name
#   scope_type               = var.scope_type
#   resource_id              = module.maria_db.mariadb_server_id
#   activity_log_alert_name  = var.activity_log_alert_name
#   resource_group_id        = var.resource_group_id
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

# #Reference to module that provisions diagnostic resources
# module "diag_settings" {
#   source                          = "../../modules/module_diagnostics_settings"
#   enable_log_monitoring           = var.enable_log_monitoring
#   diag_name                       = var.diag_name
#   target_resource_id              = module.maria_db.mariadb_server_id
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