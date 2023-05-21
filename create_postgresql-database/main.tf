
module "postgresql" {
  source                            = "../../modules/module_postgresql-database/postgresql-database"
  resource_group_name               = module.module_create_resource_group.resource_group_name
  location                          = module.module_create_resource_group.resource_group_location
  postgresqlserver_name             = var.postgresqlserver_name
  admin_username                    = var.admin_username
  admin_password                    = var.admin_password
  sku_name                          = var.sku_name
  storage_mb                        = var.storage_mb
  postgresql_version                = var.postgresql_version
  auto_grow_enabled                 = var.auto_grow_enabled
  backup_retention_days             = var.backup_retention_days
  geo_redundant_backup_enabled      = var.geo_redundant_backup_enabled
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled
  public_network_access_enabled     = var.public_network_access_enabled
  ssl_enforcement_enabled           = var.ssl_enforcement_enabled
  ssl_minimal_tls_version_enforced  = var.ssl_minimal_tls_version_enforced
  create_mode                       = var.create_mode
  tags                              = var.tags

  managed_identity_type = var.managed_identity_type

  enable_threat_detection_policy = var.enable_threat_detection_policy
  disabled_alerts                = var.disabled_alerts
  email_addresses_for_alerts     = var.email_addresses_for_alerts
  log_retention_days             = var.log_retention_days
  storage_account_access_key     = var.storage_account_access_key
  storage_endpoint               = var.storage_endpoint

  charset   = var.charset
  collation = var.collation

  postgresql_configuration = var.postgresql_configuration

  firewall_rules = var.firewall_rules

  ad_admin_login_name = var.ad_admin_login_name

  key_vault_key_id = var.key_vault_key_id

  subnet_id = var.subnet_id
}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "PrivateEndpoint_module" {
  count                             = var.create_private-endpoint ? 1 : 0
  source                            = "../../modules/module_private_endpoint"
  resource_group_name               = module.module_create_resource_group.resource_group_name
  location                          = module.module_create_resource_group.resource_group_location
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_id    = module.postgresql.postgresql_server_id
  private_connection_resource_alias = var.private_connection_resource_alias
  subnet_id                         = var.subnet_id
}


module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = module.module_create_resource_group.resource_group_name
  resource_group_location  = module.module_create_resource_group.resource_group_location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.postgresql.postgresql_server_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = module.module_create_resource_group.resource_group_id
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

module "diag_settings" {
  source                          = "../../modules/module_diagnostics_settings"
  enable_log_monitoring           = var.enable_log_monitoring
  diag_name                       = var.diag_name
  target_resource_id              = module.postgresql.postgresql_server_id
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  log_analytics_destination_type  = var.log_analytics_destination_type
  storage_account_id              = var.storage_account_id
  eventhub_name                   = var.eventhub_name
  eventhub_authorization_rule_id  = var.eventhub_authorization_rule_id
  log_enabled                     = var.log_enabled
  log_retention_policy_enabled    = var.log_retention_policy_enabled
  log_retention_days              = var.log_retention_days
  metric_retention_policy_enabled = var.metric_retention_policy_enabled
  metric_retention_days           = var.metric_retention_days
}