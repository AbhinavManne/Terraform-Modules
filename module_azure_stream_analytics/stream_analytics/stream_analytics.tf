#---------------------------------------------Stream Analytics Job--------------------------------------------------
resource "azurerm_stream_analytics_job" "stream_analytics_job" {
  name                                     = var.job
  resource_group_name                      = var.resource_group_name
  location                                 = var.location
  stream_analytics_cluster_id              = var.stream_analytics_cluster_id
  compatibility_level                      = var.compatibility_level
  data_locale                              = var.data_locale
  events_late_arrival_max_delay_in_seconds = var.events_late_arrival_in_sec
  events_out_of_order_max_delay_in_seconds = var.events_out_of_order_in_sec
  events_out_of_order_policy               = var.events_out_of_order_policy
  type                                     = var.stream_analytics_job_type 
  dynamic identity {
    for_each = var.enable_identity ? [1] :[]
    content{
      type = "SystemAssigned"
    }
  }
  output_error_policy  = var.output_error_policy
  streaming_units      = var.streaming_units
  transformation_query = var.transformation_query
  tags                 = var.tags
}

#---------------------------------------Stream Analytics Reference Input Blob-----------------------------------
resource "azurerm_stream_analytics_stream_input_blob" "inputx" {
  name                      = var.input_blob
  resource_group_name       = var.resource_group_name
  stream_analytics_job_name = azurerm_stream_analytics_job.stream_analytics_job.name
  date_format               = var.stream_analytics_stream_input_blob_date_format
  path_pattern              = var.stream_analytics_stream_input_blob_path_pattern           
  storage_account_name      = var.stream_analytics_stream_input_blob_storage_account_name   
  storage_account_key       = var.stream_analytics_stream_input_blob_storage_account_key    
  storage_container_name    = var.stream_analytics_stream_input_blob_storage_container_name 
  time_format               = var.stream_analytics_stream_input_blob_time_format            

  serialization {
    type            = var.stream_analytics_stream_input_blob_serialization_type     
    encoding        = var.stream_analytics_stream_input_blob_serialization_encoding 
    field_delimiter = var.stream_analytics_stream_input_blob_serialization_field_delimiter
  }
}

#---------------------------------------Stream Analytics Reference Output Blob-----------------------------------
resource "azurerm_stream_analytics_output_blob" "outputx" {
  name                      = var.output_blob
  resource_group_name       = var.resource_group_name
  stream_analytics_job_name = azurerm_stream_analytics_job.stream_analytics_job.name
  date_format               = var.azurerm_stream_analytics_output_blob_data_format            
  path_pattern              = var.azurerm_stream_analytics_output_blob_path_pattern           
  storage_account_name      = var.azurerm_stream_analytics_output_blob_storage_account_name   
  storage_container_name    = var.azurerm_stream_analytics_output_blob_storage_container_name 
  time_format               = var.azurerm_stream_analytics_output_blob_time_format            
  serialization {
    type            = var.azurerm_stream_analytics_output_blob_serialization_type            
    encoding        = var.azurerm_stream_analytics_output_blob_serialization_encoding        
    format          = var.azurerm_stream_analytics_output_blob_serialization_format          
    field_delimiter = var.azurerm_stream_analytics_output_blob_serialization_field_delimiter 

  }
  authentication_mode = var.authentication_mode                                                                                   
  batch_max_wait_time = var.batch_max_wait_time
  batch_min_rows      = var.batch_min_rows 
  storage_account_key = var.azurerm_stream_analytics_output_blob_storage_account_key                                              

}