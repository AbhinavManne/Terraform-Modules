#----DEFAULT VALUES: DATA SOURCE: RESOURCE GROUP----#
resource_group = "rg"

#----DEFAULT VALUES: RESOURCE: STORAGE ACCOUNT----#
storage_account          = "adcstore123"
account_tier             = "Standard"
account_replication_type = "LRS"

#----DEFAULT VALUES: RESOURCE: LOG ANALYTICS WORKSPACE----#
log_analytics_workspace = "lvm-workspace123"
log_sku                 = "PerGB2018"
retention_in_days       = 30
internet_ingestion_enabled = false
internet_query_enabled     = false
tags = {

  Contact_name     = "ABC"
  Cost_Center      = "999"
  Application_name = "Log"
}
data_source_type              = "customlogs"
log_storage_insights_name     = "example-storageinsightconfig"
log_data_export_name          = "dataExport1"
log_data_export_table_names   = ["Heartbeat"]
log_data_export_enabled       = true
log_saved_search              = "exampleSavedSearch"
log_saved_search_category     = "exampleCategory"
log_saved_search_display_name = "exampleDisplayName"
log_saved_search_query        = "exampleQuery"
automation_account            = "automation-011"
automation_account_sku_name   = "Basic"
solution_name                 = "VMInsights"
plan_publisher                = "Microsoft"
plan_product                  = "OMSGallery/VMInsights"