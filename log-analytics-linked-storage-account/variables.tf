#----------------------------------DATA SOURCE: RESOURCE GROUP----------------------------------------------#
variable "resource_group" {
  type        = string
  description = "Specifies the name of the Resource Group."
}

#-----------------------------------RESOURCE: STORAGE ACCOUNT----------------------------------------------#
variable "storage_account" {
  type        = string
  description = "Specifies the name of the storage account. Changing this forces a new resource to be created."
}


variable "account_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium"
}


variable "account_replication_type" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
}


#--------------------------------RESOURCE: LOG ANALYTICS WORKSPACE AND RESOURCES----------------------------#
variable "log_analytics_workspace" {
  type        = string
  description = "Specifies the name of the Log Analytics Workspace."
}


variable "log_sku" {
  type        = string
  description = " Specifies the Sku of the Log Analytics Workspace."
}


variable "retention_in_days" {
  type        = number
  description = "The workspace data retention in days. Possible values are either 7 (Free Tier only) or range between 30 and 730."
}


variable "internet_ingestion_enabled" {
  type        = bool
  description = " Internet ingestion enable or not"
}


variable "internet_query_enabled" {
  type        = bool
  description = " Interent quet enable or not"
}


variable "tags" {
  type        = map(any)
  description = "Tags"
}


variable "data_source_type" {
  type        = string
  description = "The data source type which should be used for this Log Analytics Linked Storage Account. Possible values are customlogs, azurewatson, query, ingestion and alerts.  "
}


variable "log_storage_insights_name" {
  type        = string
  description = " The name which should be used for this Log Analytics Storage Insights "
}


variable "log_data_export_name" {
  type        = string
  description = " The name of the Log Analytics Data Export Rule "
}


variable "log_data_export_table_names" {
  type        = list(string)
  description = "A list of table names to export to the destination resource, for example: [Heartbeat, SecurityEvent]. "
}


variable "log_data_export_enabled" {
  type        = string
  description = "Is this Log Analytics Data Export Rule enabled? "
}


variable "log_saved_search" {
  type        = string
  description = "Specifies the name of the Log Analytics Saved Search. "
}


variable "log_saved_search_category" {
  type        = string
  description = "The category that the Saved Search will be listed under. "
}


variable "log_saved_search_display_name" {
  type        = string
  description = "The name that Saved Search will be displayed as. "
}


variable "log_saved_search_query" {
  type        = string
  description = "The query expression for the saved search. "
}


variable "automation_account" {
  type        = string
  description = "Name of the automation account "
}


variable "automation_account_sku_name" {
  type        = string
  description = "SKU type of the automation account "
}


variable "solution_name" {
  type        = string
  description = "Specifies the name of the solution to be deployed."
}


variable "plan_publisher" {
  type        = string
  description = "The publisher of the solution. For example Microsoft"
}


variable "plan_product" {
  type        = string
  description = "The product name of the solution. For example OMSGallery/Containers"
}

#---------------------------------------------------------------------------------------------------------#
#RBAC MODULE VARIABLE
variable "role_definition_name" {
  type        = list(string)
  description = "List of Role Definitions"
  default     = ["Reader", "Contributor"]
}
#----------------------------------------------------------------------------------------------------------#