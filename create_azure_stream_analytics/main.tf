#Reference to azure container registry creation module
module "create_resource_group" {
  source                = "../../modules/module_resource-group-creation/resource_group"
  create_resource_group = var.create_resource_group
  resource_group_name   = var.resource_group_name
  location              = var.location
  tags                  = var.tags

}

module "module_azure_stream_analytics" {
  source                                                             = "../../modules/module_azure_stream_analytics/stream_analytics"
  resource_group_name                                                = module.create_resource_group.resource_group_name
  location                                                           = module.create_resource_group.resource_group_location
  job                                                                = var.job
  stream_analytics_cluster_id                                        = var.stream_analytics_cluster_id
  compatibility_level                                                = var.compatibility_level
  data_locale                                                        = var.data_locale
  events_late_arrival_in_sec                                         = var.events_late_arrival_in_sec
  events_out_of_order_in_sec                                         = var.events_out_of_order_in_sec
  events_out_of_order_policy                                         = var.events_out_of_order_policy
  stream_analytics_job_type                                          = var.stream_analytics_job_type
  enable_identity                                                    = var.enable_identity
  output_error_policy                                                = var.output_error_policy
  streaming_units                                                    = var.streaming_units
  transformation_query                                               = var.transformation_query
  tags                                                               = var.tags
  input_blob                                                         = var.input_blob
  stream_analytics_stream_input_blob_date_format                     = var.stream_analytics_stream_input_blob_date_format
  stream_analytics_stream_input_blob_path_pattern                    = var.stream_analytics_stream_input_blob_path_pattern
  stream_analytics_stream_input_blob_storage_account_name            = var.stream_analytics_stream_input_blob_storage_account_name
  stream_analytics_stream_input_blob_storage_account_key             = var.stream_analytics_stream_input_blob_storage_account_key
  stream_analytics_stream_input_blob_storage_container_name          = var.stream_analytics_stream_input_blob_storage_container_name
  stream_analytics_stream_input_blob_time_format                     = var.stream_analytics_stream_input_blob_time_format
  stream_analytics_stream_input_blob_serialization_type              = var.stream_analytics_stream_input_blob_serialization_type
  stream_analytics_stream_input_blob_serialization_encoding          = var.stream_analytics_stream_input_blob_serialization_encoding
  stream_analytics_stream_input_blob_serialization_field_delimiter   = var.stream_analytics_stream_input_blob_serialization_field_delimiter
  output_blob                                                        = var.output_blob
  azurerm_stream_analytics_output_blob_data_format                   = var.azurerm_stream_analytics_output_blob_data_format
  azurerm_stream_analytics_output_blob_path_pattern                  = var.azurerm_stream_analytics_output_blob_path_pattern
  azurerm_stream_analytics_output_blob_storage_account_name          = var.azurerm_stream_analytics_output_blob_storage_account_name
  azurerm_stream_analytics_output_blob_storage_container_name        = var.azurerm_stream_analytics_output_blob_storage_container_name
  azurerm_stream_analytics_output_blob_time_format                   = var.azurerm_stream_analytics_output_blob_time_format
  azurerm_stream_analytics_output_blob_serialization_type            = var.azurerm_stream_analytics_output_blob_serialization_type
  azurerm_stream_analytics_output_blob_serialization_encoding        = var.azurerm_stream_analytics_output_blob_serialization_encoding
  azurerm_stream_analytics_output_blob_serialization_format          = var.azurerm_stream_analytics_output_blob_serialization_format
  azurerm_stream_analytics_output_blob_serialization_field_delimiter = var.azurerm_stream_analytics_output_blob_serialization_field_delimiter
  authentication_mode                                                = var.authentication_mode
  batch_max_wait_time                                                = var.batch_max_wait_time
  batch_min_rows                                                     = var.batch_min_rows
  azurerm_stream_analytics_output_blob_storage_account_key           = var.azurerm_stream_analytics_output_blob_storage_account_key
}

module "alert" {
  source                   = "../../modules/module_alert"
  action_group_name        = var.action_group_name
  resource_group_name      = var.resource_group_name
  resource_group_location  = var.location
  short_name               = var.short_name
  action_group_rule_name   = var.action_group_rule_name
  scope_type               = var.scope_type
  resource_id              = module.module_azure_stream_analytics.stream_analytics_job_id
  activity_log_alert_name  = var.activity_log_alert_name
  resource_group_id        = module.create_resource_group.resource_group_id
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
  target_resource_id              = module.module_azure_stream_analytics.stream_analytics_job_id
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
