module "storageacc" {

  source = "../../modules/module_storage-account/storage-account"
  resource_group_name = module.module_create_resource_group.resource_group_name
  location            = module.module_create_resource_group.resource_group_location

  length  = var.length
  special = var.special
  upper   = var.upper

  storage_account_name             = var.storage_account_name
  account_tier                     = var.account_tier
  replication_type                 = var.replication_type
  min_tls_version                  = var.min_tls_version
  tags                             = var.tags
  account_kind                     = var.account_kind
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  access_tier                      = var.access_tier
  edge_zone                        = var.edge_zone
  enable_https_traffic_only        = var.enable_https_traffic_only
  allow_nested_items_to_be_public  = var.allow_nested_items_to_be_public
  shared_access_key_enabled        = var.shared_access_key_enabled
  is_hns_enabled                   = var.is_hns_enabled
  nfsv3_enabled                    = var.nfsv3_enabled
  large_file_share_enabled         = var.large_file_share_enabled

  custom_domain_name = var.custom_domain_name
  use_subdomain      = var.use_subdomain

  key_vault_key_id          = var.key_vault_key_id
  user_assigned_identity_id = var.user_assigned_identity_id

  managed_identity_type = var.managed_identity_type

  enable_static_website         = var.enable_static_website
  static_website_index_document = var.static_website_index_document
  static_website_error_doc      = var.static_website_error_doc

  enable_share_properties = var.enable_share_properties

  shared_properties_allowed_headers = var.shared_properties_allowed_headers
  shared_properties_allowed_methods = var.blob_properties_allowed_methods
  shared_properties_allowed_origins = var.shared_properties_allowed_origins
  shared_properties_exposed_headers = var.shared_properties_exposed_headers
  shared_properties_max_age_in_sec  = var.shared_properties_max_age_in_sec

  retention_policy_days = var.retention_policy_days

  smb_versions                        = var.smb_versions
  smb_authentication_types            = var.smb_authentication_types
  smb_kerberos_ticket_encryption_type = var.smb_kerberos_ticket_encryption_type
  channel_encryption_type             = var.channel_encryption_type

  directory_type = var.directory_type

  storage_sid         = var.storage_sid
  domain_name         = var.domain_name
  domain_sid          = var.domain_sid
  domain_guid         = var.domain_guid
  forest_name         = var.forest_name
  netbios_domain_name = var.netbios_domain_name

  enable_routing              = var.enable_routing
  publish_internet_endpoints  = var.publish_internet_endpoints
  publish_microsoft_endpoints = var.publish_microsoft_endpoints
  routing_choice              = var.routing_choice

  enable_blob_properties        = var.enable_blob_properties
  enable_versioning             = var.enable_versioning
  last_access_time_enabled      = var.last_access_time_enabled
  change_feed_enabled           = var.change_feed_enabled
  change_feed_retention_in_days = var.change_feed_retention_in_days
  default_service_version       = var.default_service_version

  blob_properties_allowed_headers    = var.blob_properties_allowed_headers
  blob_properties_allowed_methods    = var.blob_properties_allowed_methods
  blob_properties_allowed_origins    = var.blob_properties_allowed_origins
  blob_properties_exposed_headers    = var.blob_properties_exposed_headers
  blob_properties_max_age_in_seconds = var.blob_properties_max_age_in_seconds

  blob_soft_delete_retention_days = var.blob_soft_delete_retention_days

  container_soft_delete_retention_days = var.container_soft_delete_retention_days

  queue_properties_allowed_headers    = var.queue_properties_allowed_headers
  queue_properties_allowed_methods    = var.queue_properties_allowed_methods
  queue_properties_allowed_origins    = var.queue_properties_allowed_origins
  queue_properties_exposed_headers    = var.queue_properties_exposed_headers
  queue_properties_max_age_in_seconds = var.queue_properties_max_age_in_seconds

  logging_delete                = var.logging_delete
  logging_read                  = var.logging_read
  logging_version               = var.logging_version
  logging_write                 = var.logging_write
  logging_retention_policy_days = var.logging_retention_policy_days

  minute_metrics_enabled               = var.minute_metrics_enabled
  minute_metrics_version               = var.minute_metrics_version
  minute_metrics_include_apis          = var.minute_metrics_include_apis
  minute_metrics_retention_policy_days = var.minute_metrics_retention_policy_days

  hour_metrics_enabled               = var.hour_metrics_enabled
  hour_metrics_version               = var.hour_metrics_version
  hour_metrics_include_apis          = var.hour_metrics_include_apis
  hour_metrics_retention_policy_days = var.hour_metrics_retention_policy_days

  network_rule_default_action = var.network_rule_default_action
  ip_rules                    = var.ip_rules
  subnet_id                   = var.subnet_id
  bypass                      = var.bypass

  endpoint_resource_id = var.endpoint_resource_id
  endpoint_tenant_id   = var.endpoint_tenant_id

  encryption_scopes = var.encryption_scopes

  enable_advanced_threat_protection = var.enable_advanced_threat_protection

}

module "module_create_resource_group" {

  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags
}

module "PrivateEndpoint_module" {
  count  = var.create_private-endpoint ? 1 : 0
  source = "../../modules/module_private_endpoint"
  resource_group_name               = module.module_create_resource_group.resource_group_name
  location                          = module.module_create_resource_group.resource_group_location
  tags                              = var.tags
  private_endpoint_name             = var.private_endpoint_name
  private_service_connection_name   = var.private_service_connection_name
  subresource_names                 = var.subresource_names
  is_manual_connection              = var.is_manual_connection
  request_message                   = var.request_message
  private_dns_zone_group            = var.private_dns_zone_group
  private_connection_resource_id    = module.storageacc.storage_id
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
  resource_id              = module.storageacc.storage_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = module.module_create_resource_group.resource_group_id
  operation_name_log_alert = var.operation_name_log_alert
  category_log_alert       = var.category_log_alert
  metric_alert_name        = var.metric_alert_name
  storage_account_id       = module.storageacc.storage_id
  metric_namespace         = var.metric_namespace
  metric_name              = var.metric_name
  aggregation              = var.aggregation
  operator                 = var.operator
  threshold                = var.threshold
  dimension_name           = var.dimension_name
  dimension_operator       = var.dimension_operator
  values                   = var.values
}