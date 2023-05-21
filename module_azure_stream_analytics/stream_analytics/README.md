<!-- BEGIN_TF_DOCS -->
###### Last Updated[DD/MM/YYYY]: 07/09/2022
# <u> Introduction </u>
* This module provision the Stream Analytics Job, Stream Analytics Stream Input Blob, and Stream Analytics Output Blob. In this module we have included all  possiable argument for for the resources.

## File Structure 
This particular module is having the following configuration files.
- stream_analytics.tf : This file is having the terraform code to provision the resources as per requirements.
- variables.tf : This file consist of all the variable definitions needed for the terraform code mentioned in vmss.tf
- output.tf : This file is having all the resource output details generated.

### Note
* Edge doesn't support stream_analytics_cluster_id and streaming_units.
* streaming_units must be set when type is Cloud.
* encoding is required when type is set to Csv or Json.
* field_delimiter is required when type is set to Csv.
* batch_max_wait_time and batch_min_rows are required when type is set to Parquet
* format is required and can only be specified when type is set to Json.
## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.21.1 |

## Resources

| Name | Type |
|------|------|
| [azurerm_stream_analytics_job.stream_analytics_job](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_job) | resource |
| [azurerm_stream_analytics_output_blob.outputx](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_output_blob) | resource |
| [azurerm_stream_analytics_stream_input_blob.inputx](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/stream_analytics_stream_input_blob) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_authentication_mode"></a> [authentication\_mode](#input\_authentication\_mode) | The authentication mode for the Stream Output. Possible values are Msi and ConnectionString. Defaults to ConnectionString. | `string` | `"ConnectionString"` | no |
| <a name="input_azurerm_stream_analytics_output_blob_data_format"></a> [azurerm\_stream\_analytics\_output\_blob\_data\_format](#input\_azurerm\_stream\_analytics\_output\_blob\_data\_format) | The date format. Wherever {date} appears in path\_pattern, the value of this property is used as the date format instead. | `string` | n/a | yes |
| <a name="input_azurerm_stream_analytics_output_blob_path_pattern"></a> [azurerm\_stream\_analytics\_output\_blob\_path\_pattern](#input\_azurerm\_stream\_analytics\_output\_blob\_path\_pattern) | The blob path pattern. Not a regular expression. It represents a pattern against which blob names will be matched to determine whether or not they should be included as input or output to the job. | `string` | n/a | yes |
| <a name="input_azurerm_stream_analytics_output_blob_serialization_encoding"></a> [azurerm\_stream\_analytics\_output\_blob\_serialization\_encoding](#input\_azurerm\_stream\_analytics\_output\_blob\_serialization\_encoding) | The encoding of the incoming data in the case of input and the encoding of outgoing data in the case of output. It currently can only be set to UTF8. | `string` | `null` | no |
| <a name="input_azurerm_stream_analytics_output_blob_serialization_field_delimiter"></a> [azurerm\_stream\_analytics\_output\_blob\_serialization\_field\_delimiter](#input\_azurerm\_stream\_analytics\_output\_blob\_serialization\_field\_delimiter) | The delimiter that will be used to separate comma-separated value (CSV) records. Possible values are (space), , (comma), (tab), \| (pipe) and ;. | `string` | `null` | no |
| <a name="input_azurerm_stream_analytics_output_blob_serialization_format"></a> [azurerm\_stream\_analytics\_output\_blob\_serialization\_format](#input\_azurerm\_stream\_analytics\_output\_blob\_serialization\_format) | Specifies the format of the JSON the output will be written in. Possible values are Array and LineSeparated. | `string` | `null` | no |
| <a name="input_azurerm_stream_analytics_output_blob_serialization_type"></a> [azurerm\_stream\_analytics\_output\_blob\_serialization\_type](#input\_azurerm\_stream\_analytics\_output\_blob\_serialization\_type) | The serialization format used for outgoing data streams. Possible values are Avro, Csv, Json and Parquet. | `string` | n/a | yes |
| <a name="input_azurerm_stream_analytics_output_blob_storage_account_key"></a> [azurerm\_stream\_analytics\_output\_blob\_storage\_account\_key](#input\_azurerm\_stream\_analytics\_output\_blob\_storage\_account\_key) | The Access Key which should be used to connect to this Storage Account. | `string` | `null` | no |
| <a name="input_azurerm_stream_analytics_output_blob_storage_account_name"></a> [azurerm\_stream\_analytics\_output\_blob\_storage\_account\_name](#input\_azurerm\_stream\_analytics\_output\_blob\_storage\_account\_name) | The name of the Storage Account. | `string` | n/a | yes |
| <a name="input_azurerm_stream_analytics_output_blob_storage_container_name"></a> [azurerm\_stream\_analytics\_output\_blob\_storage\_container\_name](#input\_azurerm\_stream\_analytics\_output\_blob\_storage\_container\_name) | The name of the Container within the Storage Account. | `string` | n/a | yes |
| <a name="input_azurerm_stream_analytics_output_blob_time_format"></a> [azurerm\_stream\_analytics\_output\_blob\_time\_format](#input\_azurerm\_stream\_analytics\_output\_blob\_time\_format) | The time format. Wherever {time} appears in path\_pattern, the value of this property is used as the time format instead. | `string` | n/a | yes |
| <a name="input_batch_max_wait_time"></a> [batch\_max\_wait\_time](#input\_batch\_max\_wait\_time) | The maximum wait time per batch in hh:mm:ss e.g. 00:02:00 for two minutes. | `string` | `null` | no |
| <a name="input_batch_min_rows"></a> [batch\_min\_rows](#input\_batch\_min\_rows) | The minimum number of rows per batch (must be between 0 and 10000). | `string` | `null` | no |
| <a name="input_compatibility_level"></a> [compatibility\_level](#input\_compatibility\_level) | Specifies the compatibility level for this job - which controls certain runtime behaviours of the streaming job. Possible values are 1.0 and 1.1. | `string` | `null` | no |
| <a name="input_data_locale"></a> [data\_locale](#input\_data\_locale) | Specifies the Data Locale of the Job | `string` | `null` | no |
| <a name="input_enable_identity"></a> [enable\_identity](#input\_enable\_identity) | Wants to enable identity | `bool` | `false` | no |
| <a name="input_events_late_arrival_in_sec"></a> [events\_late\_arrival\_in\_sec](#input\_events\_late\_arrival\_in\_sec) | Specifies the maximum tolerable delay in seconds where events arriving late could be included. Supported range is -1 (indefinite) to 1814399 (20d 23h 59m 59s). Default is 0. | `number` | `0` | no |
| <a name="input_events_out_of_order_in_sec"></a> [events\_out\_of\_order\_in\_sec](#input\_events\_out\_of\_order\_in\_sec) | Specifies the maximum tolerable delay in seconds where out-of-order events can be adjusted to be back in order. Supported range is 0 to 599 (9m 59s). Default is 5. | `number` | `5` | no |
| <a name="input_events_out_of_order_policy"></a> [events\_out\_of\_order\_policy](#input\_events\_out\_of\_order\_policy) | Specifies the policy which should be applied to events which arrive out of order in the input event stream. Possible values are Adjust and Drop. Default is Adjust | `string` | `"Adjust"` | no |
| <a name="input_input_blob"></a> [input\_blob](#input\_input\_blob) | The name of the Stream Input Blob. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_job"></a> [job](#input\_job) | The name of the Stream Analytics Job. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The Azure location. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_output_blob"></a> [output\_blob](#input\_output\_blob) | The name of the Stream Output. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_output_error_policy"></a> [output\_error\_policy](#input\_output\_error\_policy) | Specifies the policy which should be applied to events which arrive at the output and cannot be written to the external storage due to being malformed | `string` | `"Drop"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The name of the Resource Group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_stream_analytics_cluster_id"></a> [stream\_analytics\_cluster\_id](#input\_stream\_analytics\_cluster\_id) | The ID of an existing Stream Analytics Cluster where the Stream Analytics Job should run. | `string` | `null` | no |
| <a name="input_stream_analytics_job_type"></a> [stream\_analytics\_job\_type](#input\_stream\_analytics\_job\_type) | The type of the Stream Analytics Job. Possible values are Cloud and Edge. Defaults to Cloud. Changing this forces a new resource to be created. | `string` | `"Cloud"` | no |
| <a name="input_stream_analytics_stream_input_blob_date_format"></a> [stream\_analytics\_stream\_input\_blob\_date\_format](#input\_stream\_analytics\_stream\_input\_blob\_date\_format) | The date format. Wherever {date} appears in path\_pattern, the value of this property is used as the date format instead. | `string` | n/a | yes |
| <a name="input_stream_analytics_stream_input_blob_path_pattern"></a> [stream\_analytics\_stream\_input\_blob\_path\_pattern](#input\_stream\_analytics\_stream\_input\_blob\_path\_pattern) | The blob path pattern. Not a regular expression. It represents a pattern against which blob names will be matched to determine whether or not they should be included as input or output to the job. | `string` | n/a | yes |
| <a name="input_stream_analytics_stream_input_blob_serialization_encoding"></a> [stream\_analytics\_stream\_input\_blob\_serialization\_encoding](#input\_stream\_analytics\_stream\_input\_blob\_serialization\_encoding) | The encoding of the incoming data in the case of input and the encoding of outgoing data in the case of output. It currently can only be set to UTF8. | `string` | `null` | no |
| <a name="input_stream_analytics_stream_input_blob_serialization_field_delimiter"></a> [stream\_analytics\_stream\_input\_blob\_serialization\_field\_delimiter](#input\_stream\_analytics\_stream\_input\_blob\_serialization\_field\_delimiter) | The delimiter that will be used to separate comma-separated value (CSV) records. Possible values are (space), , (comma), (tab), \| (pipe) and ;. | `string` | `null` | no |
| <a name="input_stream_analytics_stream_input_blob_serialization_type"></a> [stream\_analytics\_stream\_input\_blob\_serialization\_type](#input\_stream\_analytics\_stream\_input\_blob\_serialization\_type) | The serialization format used for incoming data streams. Possible values are Avro, Csv and Json. | `string` | n/a | yes |
| <a name="input_stream_analytics_stream_input_blob_storage_account_key"></a> [stream\_analytics\_stream\_input\_blob\_storage\_account\_key](#input\_stream\_analytics\_stream\_input\_blob\_storage\_account\_key) | The Access Key which should be used to connect to this Storage Account. | `string` | n/a | yes |
| <a name="input_stream_analytics_stream_input_blob_storage_account_name"></a> [stream\_analytics\_stream\_input\_blob\_storage\_account\_name](#input\_stream\_analytics\_stream\_input\_blob\_storage\_account\_name) | The name of the Storage Account. | `string` | n/a | yes |
| <a name="input_stream_analytics_stream_input_blob_storage_container_name"></a> [stream\_analytics\_stream\_input\_blob\_storage\_container\_name](#input\_stream\_analytics\_stream\_input\_blob\_storage\_container\_name) | The name of the Container within the Storage Account. | `string` | n/a | yes |
| <a name="input_stream_analytics_stream_input_blob_time_format"></a> [stream\_analytics\_stream\_input\_blob\_time\_format](#input\_stream\_analytics\_stream\_input\_blob\_time\_format) | The time format. Wherever {time} appears in path\_pattern, the value of this property is used as the time format instead. | `string` | n/a | yes |
| <a name="input_streaming_units"></a> [streaming\_units](#input\_streaming\_units) | Specifies the number of streaming units that the streaming job uses. Supported values are 1, 3, 6 and multiples of 6 up to 120. | `number` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags assigned to the resource. | `map(string)` | n/a | yes |
| <a name="input_transformation_query"></a> [transformation\_query](#input\_transformation\_query) | Specifies the query that will be run in the streaming job, written in Stream Analytics Query Language (SAQL). | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_stream_analytics_job_id"></a> [stream\_analytics\_job\_id](#output\_stream\_analytics\_job\_id) | ID od Atream Analytics Job |

## Module Usage 
* You can call the specified this module in any script where you want to integrate it.
```
module "module_azure_stream_analytics" {
  source = "../../modules/module_azure_stream_analytics/stream_analytics"
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
  enable_identity = var.enable_identity
  output_error_policy                                                = var.output_error_policy
  streaming_units                                                    = var.streaming_units
  transformation_query = var.transformation_query
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

```

<!-- END_TF_DOCS -->