#-----------------------------------------Stream Analytics job variables-------------------------------------------
variable "create_resource_group" {
  type        = bool
  description = "Whether to create resource group and use it for all networking resources"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group in which the Stream Analytics Job should be exist. Changing this forces a new resource to be created."
}

variable "location" {
  type        = string
  description = "The Azure location where the Stream Analytics Job should exist. Changing this forces a new resource to be created."
}
variable "job" {
  type        = string
  description = "The name of the Stream Analytics Job. Changing this forces a new resource to be created."
}

variable "stream_analytics_cluster_id" {
  type        = string
  description = "The ID of an existing Stream Analytics Cluster where the Stream Analytics Job should run."
}

variable "compatibility_level" {
  type        = string
  description = "Specifies the compatibility level for this job - which controls certain runtime behaviours of the streaming job. Possible values are 1.0 and 1.1."
}

variable "data_locale" {
  type        = string
  description = "Specifies the Data Locale of the Job"
}

variable "events_late_arrival_in_sec" {
  type        = number
  description = "Specifies the maximum tolerable delay in seconds where events arriving late could be included. Supported range is -1 (indefinite) to 1814399 (20d 23h 59m 59s). Default is 0."
}

variable "events_out_of_order_in_sec" {
  type        = number
  description = "Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order. Supported range is 0 to 599 (9m 59s). Default is 5."
}

variable "events_out_of_order_policy" {
  type        = string
  description = "Specifies the policy which should be applied to events which arrive out of order in the input event stream. Possible values are Adjust and Drop. Default is Adjust"
}

variable "stream_analytics_job_type" {
  type        = string
  description = "The type of the Stream Analytics Job. Possible values are Cloud and Edge. Defaults to Cloud. Changing this forces a new resource to be created."
}

variable "enable_identity" {
  type        = bool
  description = "Wants to enable identity"
}

variable "output_error_policy" {
  type        = string
  description = "Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed"
}

variable "streaming_units" {
  type        = number
  description = "Specifies the number of streaming units that the streaming job uses. Supported values are 1, 3, 6 and multiples of 6 up to 120."
}

variable "transformation_query" {
  type        = string
  description = "Specifies the query that will be run in the streaming job, written in Stream Analytics Query Language (SAQL)."
}


variable "tags" {
  type        = map(string)
  description = "A mapping of tags assigned to the resource."
}

variable "input_blob" {
  type        = string
  description = "The name of the Stream Input Blob. Changing this forces a new resource to be created."
}

variable "stream_analytics_stream_input_blob_date_format" {
  type        = string
  description = "The date format. Wherever {date} appears in path_pattern, the value of this property is used as the date format instead."
}
variable "stream_analytics_stream_input_blob_path_pattern" {
  type        = string
  description = "The blob path pattern. Not a regular expression. It represents a pattern against which blob names will be matched to determine whether or not they should be included as input or output to the job."
}
variable "stream_analytics_stream_input_blob_storage_account_name" {
  type        = string
  description = "The name of the Storage Account."
}
variable "stream_analytics_stream_input_blob_storage_account_key" {
  type        = string
  description = "The Access Key which should be used to connect to this Storage Account."
}
variable "stream_analytics_stream_input_blob_storage_container_name" {
  type        = string
  description = "The name of the Container within the Storage Account."
}
variable "stream_analytics_stream_input_blob_time_format" {
  type        = string
  description = " The time format. Wherever {time} appears in path_pattern, the value of this property is used as the time format instead."
}
variable "stream_analytics_stream_input_blob_serialization_type" {
  type        = string
  description = "The serialization format used for incoming data streams. Possible values are Avro, Csv and Json."
}
variable "stream_analytics_stream_input_blob_serialization_encoding" {
  type        = string
  description = "The encoding of the incoming data in the case of input and the encoding of outgoing data in the case of output. It currently can only be set to UTF8."
}
variable "stream_analytics_stream_input_blob_serialization_field_delimiter" {
  type        = string
  description = "The delimiter that will be used to separate comma-separated value (CSV) records. Possible values are (space), , (comma), (tab), | (pipe) and ;."
}

variable "output_blob" {
  type        = string
  description = "The name of the Stream Output. Changing this forces a new resource to be created."
}
variable "azurerm_stream_analytics_output_blob_data_format" {
  type        = string
  description = "The date format. Wherever {date} appears in path_pattern, the value of this property is used as the date format instead."
}
variable "azurerm_stream_analytics_output_blob_path_pattern" {
  type        = string
  description = "The blob path pattern. Not a regular expression. It represents a pattern against which blob names will be matched to determine whether or not they should be included as input or output to the job."
}
variable "azurerm_stream_analytics_output_blob_storage_account_name" {
  type        = string
  description = "The name of the Storage Account."
}
variable "azurerm_stream_analytics_output_blob_storage_container_name" {
  type        = string
  description = "The name of the Container within the Storage Account."
}
variable "azurerm_stream_analytics_output_blob_time_format" {
  type        = string
  description = "The time format. Wherever {time} appears in path_pattern, the value of this property is used as the time format instead."
}
variable "azurerm_stream_analytics_output_blob_serialization_type" {
  type        = string
  description = "The serialization format used for outgoing data streams. Possible values are Avro, Csv, Json and Parquet."
}
variable "azurerm_stream_analytics_output_blob_serialization_encoding" {
  type        = string
  description = "The encoding of the incoming data in the case of input and the encoding of outgoing data in the case of output. It currently can only be set to UTF8."
}
variable "azurerm_stream_analytics_output_blob_serialization_format" {
  type        = string
  description = "Specifies the format of the JSON the output will be written in. Possible values are Array and LineSeparated."
}
variable "azurerm_stream_analytics_output_blob_serialization_field_delimiter" {
  type        = string
  description = "The delimiter that will be used to separate comma-separated value (CSV) records. Possible values are (space), , (comma), (tab), | (pipe) and ;."
}
variable "authentication_mode" {
  type        = string
  description = "The authentication mode for the Stream Output. Possible values are Msi and ConnectionString. Defaults to ConnectionString."
}
variable "batch_max_wait_time" {
  type        = string
  description = "The maximum wait time per batch in hh:mm:ss e.g. 00:02:00 for two minutes."

}
variable "batch_min_rows" {
  type        = string
  description = "The minimum number of rows per batch (must be between 0 and 10000)."

}
variable "azurerm_stream_analytics_output_blob_storage_account_key" {
  type        = string
  description = "The Access Key which should be used to connect to this Storage Account."
}

#-----------------------------------------VARIABLES: ACTION GROUP----------------------------------#

variable "action_group_name" {
  type        = string
  description = "The name of the Action Group. Changing this forces a new resource to be created. "
}

variable "short_name" {
  type        = string
  description = "The short name of the action group. "
}

#-------------------------------------------VARIABLES: ACTION GROUP RULE----------------------------#

variable "action_group_rule_name" {
  type        = string
  description = "Specifies the name of the Monitor Action Rule. Changing this forces a new resource to be created. "
}

variable "scope_type" {
  type        = string
  description = "Specifies the type of target scope. Possible values are ResourceGroup and Resource "
}

#---------------------------------------------VARIABLES: ACTIVITY LOG ALERT---------------------------#

variable "activity_log_alert_name" {
  type        = string
  description = "The name of the activity log alert. Changing this forces a new resource to be created. "
}
variable "storage_account_id" {
  description = "ID of target resource"
}
variable "operation_name_log_alert" {
  type        = string
  description = "The Resource Manager Role-Based Access Control operation name. Supported operation should be of the form: <resourceProvider>/<resourceType>/<operation> "
}

variable "category_log_alert" {
  type        = string
  description = "The category of the operation. Possible values are Administrative, Autoscale, Policy, Recommendation, ResourceHealth, Security and ServiceHealth "
}

#----------------------------------------------VARIABLES: METRIC ALERT-------------------------------#

variable "metric_alert_name" {
  type        = string
  description = "The name of the Metric Alert. Changing this forces a new resource to be created "
}

variable "metric_namespace" {
  type        = string
  description = "One of the metric namespaces to be monitored. "
}

variable "metric_name" {
  type        = string
  description = "One of the metric names to be monitored. "
}

variable "aggregation" {
  type        = string
  description = "The statistic that runs over the metric values. Possible values are Average, Count, Minimum, Maximum and Total. "
}

variable "operator" {
  type        = string
  description = "The criteria operator. Possible values are Equals, NotEquals, GreaterThan, GreaterThanOrEqual, LessThan and LessThanOrEqual. "
}

variable "threshold" {
  type        = number
  description = "The criteria threshold value that activates the alert "
}

variable "dimension_name" {
  type        = string
  description = "One of the dimension names "
}

variable "dimension_operator" {
  type        = string
  description = "The dimension operator. Possible values are Include, Exclude and StartsWith. "
}

variable "values" {
  type        = list(string)
  description = "The list of dimension values. "
}

variable "enable_log_monitoring" {
  type        = bool
  description = "enable log monitoring"
}

variable "diag_name" {
  type        = string
  description = "Specifies the name of the Diagnostic Setting."
}

variable "log_analytics_workspace_id" {
  description = "ID of log anaytics workspace"
}

variable "log_analytics_destination_type" {
  type        = string
  description = "log_analytics_destination_type"
}

variable "eventhub_name" {
  description = "eventhub_name"
}

variable "eventhub_authorization_rule_id" {
  description = "eventhub_authorization_rule_id"
}

variable "log_enabled" {
  type        = bool
  description = "log_enabled"
}

variable "log_retention_policy_enabled" {
  type        = bool
  description = "log_retention_policy_enabled"
}

variable "log_retention_days" {
  type        = number
  description = "log_retention_days"
}

variable "metric_retention_policy_enabled" {
  type        = bool
  description = "metric_retention_policy_enabled"
}

variable "metric_retention_days" {
  type        = number
  description = "log_retention_days"
}