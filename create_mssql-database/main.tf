
data "azurerm_key_vault_secret" "secret1" {
  name         = var.key_vault_secret_name_primary
  key_vault_id = var.key_vault_id
}

data "azurerm_key_vault_secret" "secret2" {
  name         = var.key_vault_secret_name_secondary
  key_vault_id = var.key_vault_id
}

#----------------------------------------------------
# module for ms sql server
#--------------------------------------------------
module "mssqlserver" {
  source                                  = "../../modules/module_mssql-database/sql-server"
  resource_group_name                     = module.module_create_resource_group.resource_group_name
  location                                = module.module_create_resource_group.resource_group_location
  resource_group_id                       = module.module_create_resource_group.resource_group_id
  sqlserver_name                          = var.sqlserver_name
  admin_login                             = var.admin_login
  admin_password_primary                  = data.azurerm_key_vault_secret.secret1.value
  admin_password_secondary                = data.azurerm_key_vault_secret.secret2.value
  enable_auditing_policy                  = var.enable_auditing_policy
  enable_threat_detection_policy          = var.enable_threat_detection_policy
  min_tls_version                         = var.min_tls_version
  sql_server_version                      = var.sql_server_version
  retention_days                          = var.retention_days
  database_name                           = var.database_name
  failover_group_name                     = var.failover_group_name
  sql_database_edition                    = var.sql_database_edition
  email_addresses_for_alerts              = var.email_addresses_for_alerts
  firewall_rule1                          = var.firewall_rule1
  firewall_rule2                          = var.firewall_rule2
  start_ip_address                        = var.start_ip_address
  end_ip_address                          = var.end_ip_address
  create_elasticpool                      = var.create_elasticpool
  enable_firewall_rules                   = var.enable_firewall_rules
  enable_failover_group                   = var.enable_failover_group
  mode                                    = var.mode
  mode_failover                           = var.mode_failover
  public_network_access_enabled           = var.public_network_access_enabled
  state                                   = var.state
  email_account_admins                    = var.email_account_admins
  secondary_sql_server_location           = var.secondary_sql_server_location
  grace_minutes                           = var.grace_minutes
  tags                                    = var.tags
  primary_blob_endpoint                   = var.primary_blob_endpoint
  primary_access_key                      = var.primary_access_key
  sql_elasticpool                         = var.sql_elasticpool
  license_type                            = var.license_type
  max_size_gb                             = var.max_size_gb
  sku                                     = var.sku
  tier                                    = var.tier
  family                                  = var.family
  capacity                                = var.capacity
  min_capacity                            = var.min_capacity
  max_capacity                            = var.max_capacity
  connection_policy                       = var.connection_policy
  retention_in_days                       = var.retention_in_days
  mssql_db_auditing_enabled               = var.mssql_db_auditing_enabled
  log_monitoring_enabled                  = var.log_monitoring_enabled
  sa_primary_access_key                   = var.sa_primary_access_key
  storage_account_access_key_is_secondary = var.storage_account_access_key_is_secondary
  sa_primary_blob_endpoint                = var.sa_primary_blob_endpoint
  min_capacity_db                         = var.min_capacity_db
  threat_policy_email_account_admins      = var.threat_policy_email_account_admins
  disabled_alerts                         = var.disabled_alerts
  long_term_retention_policy              = var.long_term_retention_policy
  short_retentiondays                     = var.short_retentiondays
  zone_redundant                          = var.zone_redundant
  sku_name                                = var.sku_name
  sample_name                             = var.sample_name
  read_scale                              = var.read_scale
  read_replica_count                      = var.read_replica_count
  restore_point_in_time                   = var.restore_point_in_time
  elastic_pool_id                         = var.elastic_pool_id
  collation                               = var.collation
  creation_source_database_id             = var.creation_source_database_id
  create_mode                             = var.create_mode
  auto_pause_delay_in_minutes             = var.auto_pause_delay_in_minutes
  azuread_administrator                   = var.azuread_administrator
  managed_identity_ids                    = var.managed_identity_ids
  managed_identity_type                   = var.managed_identity_type
  storage_account_type                    = var.storage_account_type
  ledger_enabled                          = var.ledger_enabled
  recover_database_id                     = var.recover_database_id
  restore_dropped_database_id             = var.restore_dropped_database_id
  geo_backup_enabled                      = var.geo_backup_enabled
}



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
  private_connection_resource_id    = module.mssqlserver.primary_sql_server_id
  subnet_id                         = var.subnet_id
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_alias = var.private_connection_resource_alias
}
 

// By default this module is optional
# module "diag_settings" {
#   count                           = var.create_diagnostic_settings ? 1 : 0
#   source                          = "../../modules/module_diagnostics_settings"
#   enable_log_monitoring           = var.enable_log_monitoring
#   diag_name                       = var.diag_name
#   target_resource_id              = module.mssqlserver.sql_database_id
#   log_analytics_workspace_id      = var.log_analytics_workspace_id
#   log_analytics_destination_type  = var.log_analytics_destination_type
#   storage_account_id              = var.storage_account_id
#   eventhub_name                   = var.eventhub_name
#   eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
#   extaudit_diag_logs              = var.extaudit_diag_logs
#   log_enabled                     = var.log_enabled
#   log_retention_policy_enabled    = var.log_retention_policy_enabled
#   log_retention_days              = var.log_retention_days
#   metrics_category                = var.metrics_category
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
#   resource_id              = module.mssqlserver.sql_database_id
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
