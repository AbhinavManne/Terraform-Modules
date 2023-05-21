#----DEFAULT VALUES: RESOURCE: RESOURCE GROUP----#
create_resource_group = false
resource_group_name   = "rg"
location              = "East Us"

#-----Stream Anayltics Job------#

job                         = "example-job"
stream_analytics_cluster_id = null
compatibility_level         = "1.1"
data_locale                 = "en-GB"
events_late_arrival_in_sec  = 60
events_out_of_order_in_sec  = 50
events_out_of_order_policy  = "Drop"
stream_analytics_job_type   = "Cloud"
enable_identity             = true
output_error_policy         = "Stop"
streaming_units             = 3
transformation_query        = <<QUERY
    SELECT
    *
    INTO
        [outputasa]
    FROM
        [inputasa]
QUERY
tags = {
  "Contact_person" : "ABC"
  "cost_center" : 999
  "Application Name" : "Stream_analytics"
}

input_blob                                                         = "inputasa"
stream_analytics_stream_input_blob_date_format                     = "yyyy/MM/dd"
stream_analytics_stream_input_blob_path_pattern                    = "some-random-pattern"
stream_analytics_stream_input_blob_storage_account_name            = "qwedvb"
stream_analytics_stream_input_blob_storage_account_key             = "uSEi/m9Vqc4e/xuSe7d2bBwALtFgqnYkxfNfyBEjXJkXq6vleUP/5Ug7DFWzDj5n/GEP0vIR3kN/+ASt1SV34w=="
stream_analytics_stream_input_blob_storage_container_name          = "con1"
stream_analytics_stream_input_blob_time_format                     = "HH"
stream_analytics_stream_input_blob_serialization_type              = "Csv"
stream_analytics_stream_input_blob_serialization_encoding          = "UTF8"
stream_analytics_stream_input_blob_serialization_field_delimiter   = ","
output_blob                                                        = "outputasa"
azurerm_stream_analytics_output_blob_data_format                   = "yyyy-MM-dd"
azurerm_stream_analytics_output_blob_path_pattern                  = "some-pattern"
azurerm_stream_analytics_output_blob_storage_account_name          = "qwedvb"
azurerm_stream_analytics_output_blob_storage_container_name        = "con2"
azurerm_stream_analytics_output_blob_time_format                   = "HH"
azurerm_stream_analytics_output_blob_serialization_type            = "Csv"
azurerm_stream_analytics_output_blob_serialization_encoding        = "UTF8"
azurerm_stream_analytics_output_blob_serialization_format          = null
azurerm_stream_analytics_output_blob_serialization_field_delimiter = ","
authentication_mode                                                = "ConnectionString"
batch_max_wait_time                                                = "00:02:00"
batch_min_rows                                                     = "1"
azurerm_stream_analytics_output_blob_storage_account_key           = "uSEi/m9Vqc4e/xuSe7d2bBwALtFgqnYkxfNfyBEjXJkXq6vleUP/5Ug7DFWzDj5n/GEP0vIR3kN/+ASt1SV34w=="

storage_account_id       = "/subscriptions/d9eb170f-fa4b-49e2-916a-446a6c074b1a/resourceGroups/rg/providers/Microsoft.Storage/storageAccounts/qwedvb"
action_group_name        = "example-action-groupc"
short_name               = "actiongc"
action_group_rule_name   = "example-c"
scope_type               = "Resource"
activity_log_alert_name  = "example-activitylogalertc"
operation_name_log_alert = "Microsoft.Network/networkSecurityGroups/write"
category_log_alert       = "Security"
metric_alert_name        = "example-metricalertc"
metric_namespace         = "Microsoft.Storage/storageAccounts"
metric_name              = "Transactions"
aggregation              = "Total"
operator                 = "GreaterThan"
threshold                = 50
dimension_name           = "ApiName"
dimension_operator       = "Include"
values                   = ["*"]

enable_log_monitoring           = true
diag_name                       = "kv-diag"
log_analytics_workspace_id      = null
log_analytics_destination_type  = null #"Dedicated"
eventhub_name                   = null
eventhub_authorization_rule_id  = null
log_enabled                     = true
log_retention_policy_enabled    = true
log_retention_days              = 7
metric_retention_policy_enabled = true
metric_retention_days           = 7